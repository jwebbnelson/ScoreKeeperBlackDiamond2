//
//  Player.m
//  ScoreKeeperIB
//
//  Created by Jordan Nelson on 2/13/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import "Player.h"

static NSString * const playersKey = @"players";

@implementation Player

#pragma mark - initWithDictionary
// Dictionaries to objects
-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.playerName = dictionary[nameKey];
        self.playerScore = dictionary[scoreKey];
    }
    return self;
}

#pragma mark - entryDictionary
- (NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDictionary = [NSMutableDictionary new];
    if (self.playerName) {
        [entryDictionary setObject:self.playerName forKey:nameKey];
    }
    if (self.playerScore) {
        [entryDictionary setObject:self.playerScore forKey:scoreKey];
    }
    return entryDictionary;
}


@end
