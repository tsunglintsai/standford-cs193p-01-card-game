//
//  SetGameCard.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SetGameCard.h"
@interface SetGameCard()

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


@property (nonatomic) SetGameCardNumber number;
@property (nonatomic) SetGameCardSymbol symbol;
@property (nonatomic) SetGameCardShading shading;
@property (nonatomic) SetGameCardColor color;

@end


@implementation SetGameCard

-(NSAttributedString*) getContentAsAttributedString{
    // TODO: Add logic here
    return nil;
}
@end
