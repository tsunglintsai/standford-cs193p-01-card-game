//
//  SetGameDeck.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SetGameDeck.h"
#import "SetGameCard.h"

@implementation SetGameDeck

/**
 *
 **/
-(SetGameDeck*) init{
    
    self = [super init];
    if(self){
        for(NSUInteger number = 0 ; number < [SetGameCard maxNumber] ; number++){
            for(NSUInteger symbol = 0 ; symbol < [SetGameCard maxSymbol] ; symbol++ ){
                for(NSUInteger shading = 0 ; shading < [SetGameCard maxShading] ; shading++){
                    for(NSUInteger color = 0 ; color < [SetGameCard maxColor] ; color++) {
                        SetGameCard *card = [[SetGameCard alloc]initWithNumber:number withSymbol:symbol withShading:shading withColor:color];
                        if(card){
                            [self addCard:card atTop:YES];
                        }
                    }
                }
            }
        }
    }
    
    return self;
}


@end
