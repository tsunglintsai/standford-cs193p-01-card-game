//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Daniela on 1/30/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (readwrite,nonatomic) int score;
@property (strong,nonatomic) Deck* deck;
@property (strong,nonatomic) NSMutableArray* cards; // holds list of Card

#define MATCH_BOUNUS 4;
#define MISMATCH_PENALTY 2;

@end

@implementation CardMatchingGame



-(NSMutableArray*)cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(id)initWithWithCardCount:(NSUInteger)count usingDeck:(Deck*) deck{

    self = [super init];
    
    if(self){
        for(int i = 0 ; i < count ; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                self.cards[i] = card;
            }else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(NSMutableArray*) cardsInlastOperation{
    if(!_cardsInlastOperation){
        _cardsInlastOperation = [[NSMutableArray alloc]init];
    }
    return _cardsInlastOperation;
}

-(void)flipCardAtIndex:(NSUInteger) index{
    Card *card = [self.cards objectAtIndex:index];

    if(card && !card.unplayable){
        if(!card.isFaceup){
            self.lastState = JUST_FLIP_A_CARD;
            [self.cardsInlastOperation removeAllObjects];
            [self.cardsInlastOperation addObject:card];
            
            int pointsGetThisRound = -1;
            
            for(Card *otherCard in self.cards){
                if(otherCard.isFaceup && !otherCard.isUnplayable){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        card.unplayable = YES;
                        otherCard.unplayable = YES;
                        pointsGetThisRound = matchScore * MATCH_BOUNUS;
                        self.lastState = MACTCHED_CARDS;
                    }else{
                        pointsGetThisRound = 0 - MISMATCH_PENALTY;
                        self.lastState = MISMATCHED_CARDS;
                    }
                    [self.cardsInlastOperation addObject:otherCard];
                    break;
                }
            }
            
            self.score += pointsGetThisRound;
            self.pointsEarnInLastOperation = pointsGetThisRound;
        }
        card.faceup = !card.faceup;
    }
}

-(Card*)cardAtIndex:(NSUInteger) index{
    if(index < [self.cards count]){
        return self.cards[index];
    }else{
        return nil;
    }
    
}


@end
