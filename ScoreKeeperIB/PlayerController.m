//
//  PlayerController.m
//  ScoreKeeperIB
//
//  Created by Jordan Nelson on 2/13/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import "PlayerController.h"
#import "Player.h"

static NSString *const playerListKey = @"playerListKey";

@interface PlayerController ()

@property (nonatomic, strong) NSArray *players;

@end

@implementation PlayerController

+ (PlayerController *)sharedInstance {
    static PlayerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PlayerController alloc] init];
        [sharedInstance loadFromDefaults];
    });
    return sharedInstance;
}

#pragma mark - loadFromDefaults
-(void)loadFromDefaults{
    NSArray *playerDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:playerListKey];
    
    NSMutableArray *players = [NSMutableArray new];
    for (NSDictionary *player in playerDictionaries) {
        [players addObject:[[Player alloc] initWithDictionary:player]];
    }
    self.players = players;
}

#pragma mark - addEntry
-(void)addPlayer:(Player*)player{
    if(!player){
        return;
    }
    NSMutableArray *mutableArray = self.players.mutableCopy;
    [mutableArray addObject:player];
    
    self.players = mutableArray;
    [self synchronize];
}

#pragma mark - removeEntry
-(void)removeEntry:(Player *)player{
    if(!player){
        return;
    }
    NSMutableArray *mutableArray = self.players.mutableCopy;
    [mutableArray removeObject:player];
    
    self.players = mutableArray;
    [self synchronize];
}

#pragma mark - synchronize
-(void)synchronize{
    NSMutableArray *playerDictionaries = [NSMutableArray new];
    
    for (Player *player in self.players){
        [playerDictionaries addObject:[player entryDictionary]];
    }
    
    [[NSUserDefaults standardUserDefaults]setObject:playerDictionaries forKey:playerListKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

@end
