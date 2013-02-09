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
 *  @warning *Note:* Any value can passed into attributed. However, class will ignore invalid values. reccomend use convenience initializer to create SetGameCard object;
 **/
@interface SetGameCard : Card

///---------------------------------------------------------------------------------------
/// @name Convenience Initializer
///---------------------------------------------------------------------------------------

/**
 * Returns a newly initialized SetGameCard object with value specified.
 **/
- (id)initWithNumber:(NSUInteger)number withSymbol:(NSString*)symbol withShading:(NSString*)shading withColor:(NSString*)color;

///---------------------------------------------------------------------------------------
/// @name SetGameCard Attributes
///---------------------------------------------------------------------------------------

/**
 * The value of number.
 **/
@property (nonatomic) NSUInteger number;
/**
 * The value of symbol.
 **/
@property (strong,nonatomic) NSString *symbol;
/**
 * The value of shading.
 **/
@property (strong,nonatomic) NSString *shading;
/**
 * The value of color.
 **/
@property (strong,nonatomic) NSString *color;

///---------------------------------------------------------------------------------------
/// @name Get Card Content
///---------------------------------------------------------------------------------------

/**
 * Gets the attributed string content of card.
 * @return attributed string content.
 **/
-(NSAttributedString*) getContentAsAttributedString;

///---------------------------------------------------------------------------------------
/// @name Get Valid Values
///---------------------------------------------------------------------------------------

/**
 * Gets the number of SetGameCard object
 * @return set of NSNumber.
 **/
+(NSSet*) validNumbers;

/**
 * Gets the symbol of SetGameCard object
 * @return set of NSString.
 **/
+(NSSet*) validSymbol;

/**
 * Gets the shading of SetGameCard object
 * @return set of NSString.
 **/
+(NSSet*) validShading;

/**
 * Gets the color of SetGameCard object
 * @return set of NSString.
 **/
+(NSSet*) validColor;

@end
