//
//  PlayingCard.h
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "Card.h"

/**
 * A PlayingCard object represents a card which is porker card without Joker.
 *
 *  - `suit`: heart is represented as ♥, diamond is represented as ♦, heart is represented as ♠, club is represented as ♣.
 *  - `rank`: rank value is from 1 to 13 which represents one of folloinwg value{ A | 2 | 3 | 4 | 5 | | 7 | 8 | 9 | 10 | J | Q | K }.
 **/
@interface PlayingCard : Card

///---------------------------------------------------------------------------------------
/// @name PlayingCard Attributes
///---------------------------------------------------------------------------------------

/**
 * The value of card suit.
 **/
@property (strong,nonatomic) NSString* suit;

/**
 * The value of card rank
 **/
@property (nonatomic) NSUInteger rank;


///---------------------------------------------------------------------------------------
/// @name Get Valid Values
///---------------------------------------------------------------------------------------

/**
 * Returns a list of valid NSString suit value.
 *
 * @return Returns a suit value.
 **/
+(NSArray*) validSuits;


/**
 * Returns max value of all possible rank values.
 *
 * @return Returns a max value.
 **/
+(NSUInteger) maxRank;
@end
