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
        self.deck = deck;
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
        [self.cardsInlastOperation removeAllObjects];
        if(!card.isFaceup){
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
                                [self.cardsInlastOperation addObject:otherCardMatched];
                            }
                            pointsGetThisRound = matchScore * MATCH_BOUNUS;
                        }else{
                            for(Card *otherCardMatched in otherCardsToMatch){
                                otherCardMatched.faceup = NO;
                                [self.cardsInlastOperation addObject:otherCardMatched];                                
                            }
                            pointsGetThisRound = 0 - MISMATCH_PENALTY;
                        }
                        [self.cardsInlastOperation addObject:card];
                        break;
                    }
                }
            }
            
            self.score += pointsGetThisRound;
            self.pointsEarnInLastOperation = pointsGetThisRound;
        }

        card.faceup = !card.faceup;
        if(self.pointsEarnInLastOperation == FLIP_PENALTY || self.pointsEarnInLastOperation==0){ // if not to reach com
            for(Card *cardInCards in self.cards){
                if(cardInCards.isFaceup){
                    [self.cardsInlastOperation addObject:cardInCards];
                }
            }
        }
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

-(NSArray*)drawMoreCardWithCardCount:(NSUInteger)cardCount{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for(int i = 0 ; i < cardCount ;i++){
        Card *card = [self.deck drawRandomCard];
        if(card){
            [self.cards addObject:card];
            [result addObject:card];
        }
    }
    return result;
}

-(NSUInteger) playableCardCount{
    return [self.cards count];
}

-(void) removeCard:(Card *)card{
    [self.cards removeObject:card];
}

-(NSInteger) indexOfCard:(Card *)card{
    return [self.cards indexOfObject:card];
}

-(NSArray*) cardFlipped{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for(Card *card in self.cards){
        if(card.faceup && !card.isUnplayable){
            [result addObject:card];
        }
    }
    return [result copy];
}

@end
