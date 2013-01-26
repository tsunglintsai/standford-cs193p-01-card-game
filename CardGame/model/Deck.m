//
//  Deck.m
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property(strong,nonatomic) NSMutableArray *cards;
@end


@implementation Deck

-(NSMutableArray*) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(void) addCard:(Card*)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

-(Card*) drawRandomCard{
    Card *randomCard;
    if(self.cards.count){
        unsigned index = arc4random()% self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}


@end
