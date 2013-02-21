//
//  PlayingCardGameViewController.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCardViewCell.h"
#import "PlayingCard.h"
#import "PlayingCardView.h"

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

- (void) updateCell:(UICollectionViewCell*) cell useringCard:(Card*)card{
    if([cell isKindOfClass:[PlayingCardViewCell class]]  && [card isKindOfClass:[PlayingCard class]] ){
        PlayingCardViewCell *playingCardViewCell = (PlayingCardViewCell*) cell;
        PlayingCard *playingCard = (PlayingCard*) card;
        playingCardViewCell.suit = playingCard.suit;
        playingCardViewCell.rank = playingCard.rank;
        playingCardViewCell.faceup= playingCard.faceup;
    }
}

- (UIView*) createCardViewUsingCard:(Card*) card{
    PlayingCardView *result;
    if([card isKindOfClass:[PlayingCard class]]){
        PlayingCard *playingCard = (PlayingCard*)card;
        result = [[PlayingCardView alloc]init];
        result.suit = playingCard.suit;
        result.rank = playingCard.rank;
        result.faceup = YES;
    }
    return result;
}

@end
