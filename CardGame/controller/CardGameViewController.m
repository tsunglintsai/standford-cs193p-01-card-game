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
#import "QuartzCore/QuartzCore.h"
#import "GameResult.h"

@interface CardGameViewController()
@property (strong, nonatomic) GameResult *gameResult;

@end

@implementation CardGameViewController


-(GameResult*) gameResult{
    if(!_gameResult){
        _gameResult = [[GameResult alloc]initWithGameName:self.gameName];
    }
    return _gameResult;
}

-(CardMatchingGame*) game{
    if(!_game){
        _game = [[CardMatchingGame alloc]initWithWithCardCount:[self initialCardNumber] usingDeck:[self getCardDeck] withMatchCardNumber:self.numberOfMatchedCardInGame];
    }
    return _game;
}

- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %i",self.flipCount];
}


- (void)updateUI{
    self.scoreLabel.text = [NSString stringWithFormat:@"score:%d",self.game.score];
}

- (IBAction)flipCard:(UIButton *)sender {
    //[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.gameResult.score = self.game.score;
    [self updateUI];
    self.flipCount++;
}

- (IBAction)dealButtonClicked:(id)sender {
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    [self updateUI];
}

-(NSString*) gameName{
    return @"";
}

- (Deck*)getCardDeck{
    return nil;
}

- (NSUInteger)initialCardNumber{
    return 0;
}


@end
