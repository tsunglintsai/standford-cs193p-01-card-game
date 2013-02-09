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
    /*
    self = [super init];
    if(self){
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSInteger rank = 1 ; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
        }
    }
    */
    return self;
}


@end
