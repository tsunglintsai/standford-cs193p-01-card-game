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
@property (strong, nonatomic) UIImage *cardBackImage;
@property (strong, nonatomic) PlayingCardDeck *playingCardDeck;

@end

@implementation PlayingCardGameViewController

-(PlayingCardDeck*)playingCardDeck{
    if(!_playingCardDeck){
        _playingCardDeck = [[PlayingCardDeck alloc]init];
    }
    return _playingCardDeck;
}

-(NSUInteger)numberOfMatchedCardInGame{
    return 2;
}

-(Deck*)deck{
    return self.playingCardDeck;
}

-(UIImage*) cardBackImage{
    if(!_cardBackImage){
        _cardBackImage = [UIImage imageNamed:@"CardBack.png"];
    }
    return _cardBackImage;
}

- (void)updateUI{
    
    for(UIButton *button in self.cardButtons){
        Card *card = [self.game cardAtIndex: [self.cardButtons indexOfObject:button]];
        [button setTitle:card.contents forState:UIControlStateSelected];
        [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        [button setTitle:card.contents forState:UIControlStateNormal ];
        [button setImageEdgeInsets:UIEdgeInsetsMake (1, -1, -1, -1)];
        [button setImage:card.isFaceup? card.cardImage : self.cardBackImage forState:UIControlStateNormal];
        
        if(button.selected != card.isFaceup){
            [UIView beginAnimations:@"flipbutton" context:NULL];
            [UIView setAnimationDuration:0.4];
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:button cache:YES];
            [UIView commitAnimations];
        }
        
        button.selected = card.isFaceup;
        button.enabled = !card.isUnplayable;
        button.alpha = card.isUnplayable ? Disable_Alpha : 1;
        button.adjustsImageWhenHighlighted = NO;
        button.adjustsImageWhenDisabled = NO;
        
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score:%d",self.game.score];
    
    self.lastFlipResultLabel.text = [[self class] getFlipResultString:self.game];
    
}

/**
 * The NSString value of of flip result.
 * @param game engine object
 * @return flip result
 **/
+ (NSString*) getFlipResultString:(CardMatchingGame*)game{
    NSString *lastFlipResult = @"";
    NSMutableArray *resultString = [[NSMutableArray alloc]init];
    
    if(game.pointsEarnInLastOperation == FLIP_PENALTY ){
        
        Card *flippedCard = [game.cardsInlastOperation lastObject];
        [resultString addObjectsFromArray:@[@"Flipped up",flippedCard.contents]];
        
    }else if(game.pointsEarnInLastOperation > 0){
        
        [resultString addObject:@"Matched"];
        for(Card *matchedCard in game.cardsInlastOperation){
            [resultString addObject:matchedCard.contents];
            if(![[game.cardsInlastOperation lastObject] isEqual:matchedCard]){
                [resultString addObject:@"&"];
            }
        }
        [resultString addObject:[NSString stringWithFormat:@" for %d points", game.pointsEarnInLastOperation]];
        
        
    }else if(game.pointsEarnInLastOperation < 0){
        
        for(Card *matchedCard in game.cardsInlastOperation){
            [resultString addObject:matchedCard.contents];
            if(![[game.cardsInlastOperation lastObject] isEqual:matchedCard]){
                [resultString addObject:@" & "];
            }
        }
        [resultString addObject:@" don't mach!"];
        [resultString addObject:[NSString stringWithFormat:@" %d points penalty!", abs(game.pointsEarnInLastOperation)]];
        
    }
    lastFlipResult = [resultString componentsJoinedByString:@" "];
    return lastFlipResult;
}

@end
