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

#define FLIP_PENALTY -1

@property (readonly,nonatomic) int score;
@property (nonatomic) NSMutableArray *cardsInlastOperation;
@property (nonatomic) int pointsEarnInLastOperation;

-(id)initWithWithCardCount:(NSUInteger)count usingDeck:(Deck*) deck withMatchCardNumber:(NSUInteger)matchNumber;
-(void)flipCardAtIndex:(NSUInteger) index;
-(Card*)cardAtIndex:(NSUInteger) index;
-(void)resetGame;
@end
