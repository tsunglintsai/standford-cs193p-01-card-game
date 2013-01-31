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


@interface CardGameViewController()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;

@end


@implementation CardGameViewController


-(Deck*) deck{
    if(!_deck){
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}


- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %i",self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    [sender setTitle:[self.deck drawRandomCard].contents forState:UIControlStateSelected];
    sender.selected = !sender.selected;
    self.flipCount++;
}

@end
