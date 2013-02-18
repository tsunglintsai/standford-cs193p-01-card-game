//
//  SetGameCard.h
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "Card.h"

/**
 * A SetGameCard object is varying in four features: number (1, 2, or 3); symbol (diamond, squiggle, oval); shading (solid, striped, or open); and color (red, green, or purple).
 *
 *  - `number` : { 1 | 2 | 3 }
 *  - `symbol` : { diamond | squiggle | oval }
 *  - `shading` : { solid | striped | open }
 *  - `color` : { red | green | purple }
 *
 *  Following are rules that defines a 'set':
 *
 *  - They all have the same number, or they have three different numbers.
 *
 *  - They all have the same symbol, or they have three different symbols.
 *
 *  - They all have the same shading, or they have three different shadings.
 *
 *  - They all have the same color, or they have three different colors.
 *
 *  The rules of Set are summarized by: If you can sort a group of three cards into "Two of X and one of Y,"
 *  then it is not a set.
 *  @warning *Note:* Any value can passed into attributed. However, class will ignore invalid values. reccomend use convenience initializer to create SetGameCard object;
 **/
@interface SetGameCard : Card

///---------------------------------------------------------------------------------------
/// @name Convenience Initializer
///---------------------------------------------------------------------------------------

/**
 * Returns a newly initialized SetGameCard object with value specified.
 **/
- (id)initWithNumber:(NSUInteger)number withSymbol:(NSUInteger)symbol withShading:(NSUInteger)shading withColor:(NSUInteger)color;

///---------------------------------------------------------------------------------------
/// @name SetGameCard Attributes
///---------------------------------------------------------------------------------------

/**
 * The value of number.
 **/
@property (readonly, nonatomic) NSUInteger number;
/**
 * The value of symbol.
 **/
@property (readonly, nonatomic) NSUInteger symbol;
/**
 * The value of shading.
 **/
@property (readonly, nonatomic) NSUInteger shading;
/**
 * The value of color.
 **/
@property (readonly, nonatomic) NSUInteger color;


///---------------------------------------------------------------------------------------
/// @name Get Valid Values
///---------------------------------------------------------------------------------------

/**
 * Gets the max value of number of SetGameCard object
 * @return set of NSNumber.
 **/
+(NSUInteger) maxNumber;

/**
 * Gets the max value of symbol of SetGameCard object
 * @return set of NSString.
 **/
+(NSUInteger) maxSymbol;

/**
 * Gets the max value of shading of SetGameCard object
 * @return set of NSString.
 **/
+(NSUInteger) maxShading;

/**
 * Gets the max value of color of SetGameCard object
 * @return set of NSString.
 **/
+(NSUInteger) maxColor;

@end
