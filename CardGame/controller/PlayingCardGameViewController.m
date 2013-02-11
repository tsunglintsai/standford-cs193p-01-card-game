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

@synthesize playingCardDeck = _playingCardDeck;

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

-(void)setDeck:(Deck *)deck{
    if([deck isKindOfClass:[PlayingCardDeck class]] || !deck){
        _playingCardDeck = (PlayingCardDeck*) deck;
    }
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

-(NSString*) gameName{
    return @"Matchismo";
}
@end
