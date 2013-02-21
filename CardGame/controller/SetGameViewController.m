//
//  SetGameViewController.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetGameDeck.h"
#import "SetGameCard.h"
#import "SetGameCardViewCell.h"
#import "SetCardView.h"

@interface SetGameViewController ()
@property (strong, nonatomic) SetGameDeck *setGameDeck;
@property (nonatomic) CGFloat cardContentFontSize;
@end

@implementation SetGameViewController

-(NSUInteger)numberOfMatchedCardInGame{
    return 3;
}

- (Deck*)getCardDeck{
    return [[SetGameDeck alloc]init];
}

-(NSString*) gameName{
    return @"Set Game";
}

- (NSUInteger)startingCardCount{
    return 12;
}

- (void) updateCell:(UICollectionViewCell*) cell useringCard:(Card*)card{
    if([cell isKindOfClass:[SetGameCardViewCell class]]  && [card isKindOfClass:[SetGameCard class]] ){
        SetGameCardViewCell *setGameCardViewCell = (SetGameCardViewCell*) cell;
        SetGameCard *setGameCard = (SetGameCard*) card;
        setGameCardViewCell.number = setGameCard.number;
        setGameCardViewCell.symbol = setGameCard.symbol;
        setGameCardViewCell.shading= setGameCard.shading;
        setGameCardViewCell.color  = setGameCard.color;
        
        if(card.faceup){
            setGameCardViewCell.drawOutLine = YES;
        }else{
            setGameCardViewCell.drawOutLine = NO;
            
        }
        
    }
}

- (void) updateCell:(UICollectionViewCell*) cell useringCardSet:(NSArray*)cardSet{

}

- (UIView*) createCardViewUsingCard:(Card*) card{
    SetCardView *result;
    if([card isKindOfClass:[SetGameCard class]]){
        SetGameCard *setGameCard = (SetGameCard*)card;
        result = [[SetCardView alloc]init];
        result.number = setGameCard.number+1;
        result.shape = setGameCard.symbol+1;
        result.fill = setGameCard.shading+1;
        result.color = setGameCard.color+1;
        
    }
    return result;
}

@end
