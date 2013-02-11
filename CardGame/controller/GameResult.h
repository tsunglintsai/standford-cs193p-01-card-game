//
//  GameResult.h
//  CardGame
//
//  Created by Daniela on 2/11/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

@property (readwrite, nonatomic) NSString *gameName;
@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;
+(NSArray *)allGameResults;
+(void)deleteAllGameResults;
-(id)initWithGameName:(NSString*)gameName;

@end
