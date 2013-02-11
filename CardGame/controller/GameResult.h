//
//  GameResult.h
//  CardGame
//
//  Created by Daniela on 2/11/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * A Gsameresult objects handles persistence score.
 */

@interface GameResult : NSObject

///---------------------------------------------------------------------------------------
/// @name GameResult Attributes
///---------------------------------------------------------------------------------------

/**
 * The name of game.
 **/
@property (readwrite, nonatomic) NSString *gameName;

/**
 * The start time of game.
 **/
@property (readonly, nonatomic) NSDate *start;

/**
 * The end time of game.
 **/
@property (readonly, nonatomic) NSDate *end;

/**
 * The duration of the game in sec.
 **/
@property (readonly, nonatomic) NSTimeInterval duration;

/**
 * The score of the game.
 **/
@property (nonatomic) int score;

///---------------------------------------------------------------------------------------
/// @name Convenience Initializer
///---------------------------------------------------------------------------------------

/**
 * Initializer to Create game result
 **/
-(id)initWithGameName:(NSString*)gameName;

///---------------------------------------------------------------------------------------
/// @name GameResult methods
///---------------------------------------------------------------------------------------

/**
 * The score of the game.
 **/
+(NSArray *)allGameResults;

/**
 * The score of the game.
 **/
+(void)deleteAllGameResults;


@end
