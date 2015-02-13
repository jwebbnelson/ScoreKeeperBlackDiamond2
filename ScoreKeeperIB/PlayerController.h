//
//  PlayerController.h
//  ScoreKeeperIB
//
//  Created by Jordan Nelson on 2/13/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerController : NSObject

@property (nonatomic, readonly) NSArray *players;

+(PlayerController *)sharedInstance;

-(void)loadFromDefaults;
-(void)addPlayer:(Player *)player;
-(void)removeEntry:(Player *)player;

@end
