//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Daniela on 1/30/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"	

@interface CardMatchingGame : NSObject

typedef enum { GAME_JUST_START,JUST_FLIP_A_CARD, MACTCHED_CARDS, MISMATCHED_CARDS} FlipState;

@property (readonly,nonatomic) int score;
@property (nonatomic) FlipState lastState;
@property (nonatomic) NSMutableArray *cardsInlastOperation;
@property (nonatomic) int pointsEarnInLastOperation;

-(id)initWithWithCardCount:(NSUInteger)count usingDeck:(Deck*) deck;
-(void)flipCardAtIndex:(NSUInteger) index;
-(Card*)cardAtIndex:(NSUInteger) index;


@end
