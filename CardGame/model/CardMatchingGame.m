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
@property (nonatomic) int numberOfMatchedCardRequired;

#define MATCH_BOUNUS 4
#define MISMATCH_PENALTY 2

@end

@implementation CardMatchingGame


-(NSMutableArray*)cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(id)initWitCardCount:(NSUInteger)count usingDeck:(Deck*) deck withMatchCardNumber:(NSUInteger)matchNumber{

    self = [super init];
    self.numberOfMatchedCardRequired = matchNumber;
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
            [self.cardsInlastOperation removeAllObjects];
            [self.cardsInlastOperation addObject:card];
            
            int pointsGetThisRound = FLIP_PENALTY;
            
            NSMutableArray *otherCardsToMatch = [[NSMutableArray alloc]init];
            
            for(Card *otherCard in self.cards){
                if(otherCard.isFaceup && !otherCard.isUnplayable){
                    [otherCardsToMatch addObject:otherCard];

                    if([otherCardsToMatch count] == self.numberOfMatchedCardRequired -1){ // only try to match when reach number of cards required
                    
                        int matchScore = [card match:otherCardsToMatch];
                        if(matchScore){
                            card.unplayable = YES;
                            for(Card *otherCardMatched in otherCardsToMatch){
                                otherCardMatched.unplayable = YES;
                            }
                            pointsGetThisRound = matchScore * MATCH_BOUNUS;
                        }else{
                            for(Card *otherCardMatched in otherCardsToMatch){
                                otherCardMatched.faceup = NO;
                            }
                            pointsGetThisRound = 0 - MISMATCH_PENALTY;
                        }
                        for(Card *otherCardMatched in otherCardsToMatch){
                            [self.cardsInlastOperation addObject:otherCardMatched];
                        }
                        break;
                    }
                    
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

-(void)resetGame{
    self.score = 0;
    self.cardsInlastOperation = 0;
    self.pointsEarnInLastOperation = 0;
    for(Card *card in self.cards){
        card.faceup = false;
        card.unplayable = false;
    }
}

-(BOOL)drawMoreCardWithCardCount:(NSUInteger)cardCount{
    for(int i = 0 ; i < cardCount ;i++){
        Card *card = [self.deck drawRandomCard];
        if(card){
            [self.cards addObject:[self.deck drawRandomCard]];
        }else{
            return false;
        }
    }
    return true;
}

-(NSUInteger) playableCardCount{
    return [self.cards count];
}

-(void) removeCards:(Card *)card{
    [self.cards removeObject:card];
}

-(NSUInteger) indexOfCard:(Card *)card{
    return [self.cards indexOfObject:card];
}


@end
