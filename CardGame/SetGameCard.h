//
//  SetGameCard.h
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "Card.h"

/**
 * A SetGameCard object is varying in four features: number (one, two, or three); symbol (diamond, squiggle, oval); shading (solid, striped, or open); and color (red, green, or purple).
 *
 **/
@interface SetGameCard : Card

typedef enum {
    SetGameCardNumberOne,
    SetGameCardNumberTwo,
    SetGameCardNumberThree
} SetGameCardNumber;

typedef enum {
    SetGameCardNumberDiamond,
    SetGameCardNumberSquiggle,
    SetGameCardNumberOval
} SetGameCardSymbol;

typedef enum {
    SetGameCardNumberSolid,
    SetGameCardNumberStriped,
    SetGameCardNumberOpen
} SetGameCardShading;

typedef enum {
    SetGameCardNumberRed,
    SetGameCardNumberGreen,
    SetGameCardNumberPurple
} SetGameCardColor;

///---------------------------------------------------------------------------------------
/// @name SetGameCard Attributes
///---------------------------------------------------------------------------------------

/**
 * The value of number.
 **/
@property (nonatomic) SetGameCardNumber number;
/**
 * The value of symbol.
 **/
@property (nonatomic) SetGameCardSymbol symbol;
/**
 * The value of shading.
 **/
@property (nonatomic) SetGameCardShading shading;
/**
 * The value of color.
 **/
@property (nonatomic) SetGameCardColor color;


@end
