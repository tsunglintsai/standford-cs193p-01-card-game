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
        for(NSNumber *number in [SetGameCard validNumbers]){
            for(NSString *symbol in [SetGameCard validSymbol] ){
                for(NSString *shading in [SetGameCard validShading]){
                    for(NSString *color in [SetGameCard validColor]) {
                        SetGameCard *card = [[SetGameCard alloc]initWithNumber:[number unsignedIntegerValue] withSymbol:symbol withShading:shading withColor:color];
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    
    return self;
}


@end
