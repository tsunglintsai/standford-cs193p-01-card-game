//
//  PlayingCardGameViewController.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()
@end

@implementation PlayingCardGameViewController


-(NSUInteger)numberOfMatchedCardInGame{
    return 2;
}

-(NSString*) gameName{
    return @"Matchismo";
}

- (Deck*)getCardDeck{
    return [[PlayingCardDeck alloc]init];
}

- (NSUInteger)startingCardCount{
    return 22;
}

@end
