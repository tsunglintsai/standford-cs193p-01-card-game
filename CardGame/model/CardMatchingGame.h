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
@property (readonly,nonatomic) int score;

-(id)initWithWithCardCount:(NSUInteger)count usingDeck:(Deck*) deck;
-(void)flipCardAtIndex:(NSUInteger) index;
-(Card*)cardAtIndex:(NSUInteger) index;


@end
