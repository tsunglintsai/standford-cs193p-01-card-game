//
//  PlayingCardGameViewController.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "PlayingCardGameViewController.h"

@interface PlayingCardGameViewController ()
@property (strong, nonatomic) UIImage *cardBackImage;

@end

@implementation PlayingCardGameViewController

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
@end
