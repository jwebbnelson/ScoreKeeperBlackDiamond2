//
//  Player.h
//  ScoreKeeperIB
//
//  Created by Jordan Nelson on 2/13/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const nameKey = @"nameKey";
static NSString * const scoreKey = @"scoreKey";

@interface Player : NSObject

@property (nonatomic, strong) NSString *playerName;
@property (nonatomic, strong) NSString *playerScore;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)entryDictionary;

@end
