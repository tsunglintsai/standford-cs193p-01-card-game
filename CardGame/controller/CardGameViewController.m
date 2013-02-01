//
//  CardGameViewController.m
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "QuartzCore/QuartzCore.h"

@interface CardGameViewController()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastFlipResultLabel;

@end

@implementation CardGameViewController
@synthesize cardButtons = _cardButtons;

-(CardMatchingGame*) game{
    if(!_game){
        _game = [[CardMatchingGame alloc]initWithWithCardCount:[self.cardButtons count] usingDeck:[[PlayingCardDeck alloc]init]];
    }
    return _game;
}

-(void) setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];    
}

-(NSArray*) cardButtons{
    return _cardButtons;
}


- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %i",self.flipCount];
}

- (void)updateUI{
    

    
    for(UIButton *button in self.cardButtons){
        Card *card = [self.game cardAtIndex: [self.cardButtons indexOfObject:button]];
        [button setTitle:card.contents forState:UIControlStateSelected];        
        [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        button.selected = card.isFaceup;
        button.enabled = !card.isUnplayable;
        button.alpha = card.isUnplayable ? 0.3 : 1;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score:%d",self.game.score];
    
    

    
    NSString *lastFlipResult = @"";
    if(self.game.pointsEarnInLastOperation == FLIP_PENALTY ){
        
        Card *flippedCard = [self.game.cardsInlastOperation lastObject];
        lastFlipResult = [@"Flipped up " stringByAppendingString:flippedCard.contents];

    }else if(self.game.pointsEarnInLastOperation > 0){

        lastFlipResult = @"Matched ";
        for(Card *matchedCard in self.game.cardsInlastOperation){
            lastFlipResult = [lastFlipResult stringByAppendingString:matchedCard.contents];
            if(![[self.game.cardsInlastOperation lastObject] isEqual:matchedCard]){
                lastFlipResult = [lastFlipResult stringByAppendingString:@" & "];
            }
        }
        lastFlipResult = [lastFlipResult stringByAppendingString:[NSString stringWithFormat:@" for %d points", self.game.pointsEarnInLastOperation]];
        

    }else if(self.game.pointsEarnInLastOperation < 0){

        for(Card *matchedCard in self.game.cardsInlastOperation){
            lastFlipResult = [lastFlipResult stringByAppendingString:matchedCard.contents];
            if(![[self.game.cardsInlastOperation lastObject] isEqual:matchedCard]){
                lastFlipResult = [lastFlipResult stringByAppendingString:@" & "];
            }
        }
        lastFlipResult = [lastFlipResult stringByAppendingString:@" don't mach!"];
        lastFlipResult = [lastFlipResult stringByAppendingString:[NSString stringWithFormat:@" %d points penalty!", abs(self.game.pointsEarnInLastOperation)]];

        
    }
    
    self.lastFlipResultLabel.text = lastFlipResult;





}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    
    /*
    sender.titleLabel.text = @"";
    [UIView animateWithDuration:0.5f animations:^{
        sender.layer.transform = CATransform3DMakeRotation(M_PI,0.0,1.0,0.0);
    } completion:^(BOOL finished){
        sender.layer.transform = CATransform3DMakeRotation(M_PI,0.0,0.0,0.0);
        [self updateUI];
        self.flipCount++;
    }];
    */
    
    
    [UIView beginAnimations:@"flipbutton" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:sender cache:YES];
    
    //[self setBackgroundImage:image forState:UIControlStateNormal];
    
    [UIView commitAnimations];
    [self updateUI];
    self.flipCount++;
    
}

@end
