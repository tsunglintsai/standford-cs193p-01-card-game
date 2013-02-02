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
@property (weak, nonatomic) IBOutlet UISegmentedControl *cardMatchNumberSegmentedControll;
@property (strong, nonatomic) UIImage *cardBackImage;
@property (strong, nonatomic) NSMutableArray *flipHistory;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UISlider *replaySlider;
@property (weak, nonatomic) IBOutlet UIButton *replayButton;

#define Disable_Alpha 0.6

@end

@implementation CardGameViewController
@synthesize flipHistory = _flipHistory;

-(NSTimer*) timer{
    if(!_timer){
        double timerInterval = 0.5;
        _timer = [NSTimer scheduledTimerWithTimeInterval: timerInterval target:self selector:@selector(replay:) userInfo:nil repeats: YES];
        }
    return _timer;
}

-(void) replay:(NSTimer*) theTimer {
    
    int currentReplayIndex = floor(self.replaySlider.value);
    if(currentReplayIndex < [self.flipHistory count]){
        int indexOfCardFliped = [[self.flipHistory objectAtIndex:currentReplayIndex]integerValue];
        [self.game flipCardAtIndex:indexOfCardFliped];
        [self updateUI];
        self.flipCount++;
    }else{
        [self.timer invalidate];
        self.timer = nil;
        self.replayButton.enabled = YES;
        self.replayButton.alpha = 1.0;
        [self updateUI];
    }
    self.replaySlider.value += 1;    
}

-(NSMutableArray*)flipHistory{
    if(!_flipHistory){
        _flipHistory = [[NSMutableArray alloc]init];
    }
    return _flipHistory;
}
-(void)setFlipHistory:(NSMutableArray *)flipHistory{
    _flipHistory = flipHistory;
    self.replaySlider.value = [self.flipHistory count];
    self.replaySlider.maximumValue = [self.flipHistory count];
    self.flipCount = [self.flipHistory count];
}


-(UIImage*) cardBackImage{
    if(!_cardBackImage){
        _cardBackImage = [UIImage imageNamed:@"CardBack.png"];
    }
    return _cardBackImage;
}

-(CardMatchingGame*) game{
    if(!_game){
        _game = [[CardMatchingGame alloc]initWithWithCardCount:[self.cardButtons count] usingDeck:[[PlayingCardDeck alloc]init] withMatchCardNumber:self.cardMatchNumberSegmentedControll.selectedSegmentIndex+2];
    }
    return _game;
}

-(void) setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];    
}

- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %i",self.flipCount];
}

+ (NSString*) getFlipResultString:(CardMatchingGame*)game{
    NSString *lastFlipResult = @"";
    
    if(game.pointsEarnInLastOperation == FLIP_PENALTY ){
        
        Card *flippedCard = [game.cardsInlastOperation lastObject];
        lastFlipResult = [@"Flipped up " stringByAppendingString:flippedCard.contents];
        
    }else if(game.pointsEarnInLastOperation > 0){
        
        lastFlipResult = @"Matched ";
        for(Card *matchedCard in game.cardsInlastOperation){
            lastFlipResult = [lastFlipResult stringByAppendingString:matchedCard.contents];
            if(![[game.cardsInlastOperation lastObject] isEqual:matchedCard]){
                lastFlipResult = [lastFlipResult stringByAppendingString:@" & "];
            }
        }
        lastFlipResult = [lastFlipResult stringByAppendingString:[NSString stringWithFormat:@" for %d points", game.pointsEarnInLastOperation]];
        
        
    }else if(game.pointsEarnInLastOperation < 0){
        
        for(Card *matchedCard in game.cardsInlastOperation){
            lastFlipResult = [lastFlipResult stringByAppendingString:matchedCard.contents];
            if(![[game.cardsInlastOperation lastObject] isEqual:matchedCard]){
                lastFlipResult = [lastFlipResult stringByAppendingString:@" & "];
            }
        }
        lastFlipResult = [lastFlipResult stringByAppendingString:@" don't mach!"];
        lastFlipResult = [lastFlipResult stringByAppendingString:[NSString stringWithFormat:@" %d points penalty!", abs(game.pointsEarnInLastOperation)]];
        
        
    }
    
    return lastFlipResult;
}

- (void)updateUI{
    
    for(UIButton *button in self.cardButtons){
        Card *card = [self.game cardAtIndex: [self.cardButtons indexOfObject:button]];
        [button setTitle:card.contents forState:UIControlStateSelected];
        [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        [button setTitle:card.contents forState:UIControlStateNormal ];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [button setImage:card.isFaceup? nil : self.cardBackImage forState:UIControlStateNormal];

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
        
        if(floor(self.replaySlider.value)==floor(self.replaySlider.maximumValue)){
            button.userInteractionEnabled = YES;
        }else{
            button.userInteractionEnabled = NO;
        }

    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score:%d",self.game.score];
    
    self.lastFlipResultLabel.text = [CardGameViewController getFlipResultString:self.game];
    
    if(floor(self.replaySlider.value)==floor(self.replaySlider.maximumValue)){
        self.lastFlipResultLabel.alpha = 1.0;
    }else{
        self.lastFlipResultLabel.alpha = Disable_Alpha;
    }
    
}

- (IBAction)flipCard:(UIButton *)sender {
    self.replayButton.enabled = YES;
    self.replayButton.alpha = 1.0;
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
    self.flipCount++;
    [self.flipHistory addObject:[NSNumber numberWithInteger:[self.cardButtons indexOfObject:sender]]];
    self.replaySlider.maximumValue = [self.flipHistory count];
    self.replaySlider.value = [self.flipHistory count];
    self.cardMatchNumberSegmentedControll.enabled = NO;

}

- (IBAction)dealButtonClicked:(id)sender {
    self.replayButton.enabled = NO;
    self.replayButton.alpha = Disable_Alpha;
    [self.timer invalidate];
    self.timer = nil;
    self.game = nil;
    self.flipHistory=nil;
    self.cardMatchNumberSegmentedControll.enabled = YES;
    [self updateUI];
}

- (IBAction)replaySliderValueChange:(UISlider *)sender {
    self.replayButton.enabled = YES;
    self.replayButton.alpha = 1.0;
    
    [self.timer invalidate];
    self.timer = nil;
    [self.game resetGame];
    self.flipCount = 0;
    for(int i =0; i < floor(sender.value); i++){
        int indexOfCardFliped = [[self.flipHistory objectAtIndex:i]integerValue];
        [self.game flipCardAtIndex:indexOfCardFliped];
        self.flipCount ++;
    }
    [self updateUI];
}

- (IBAction)replayButtonClicked:(UIButton *)sender {
    self.replayButton.enabled = NO;
    self.replayButton.alpha = Disable_Alpha;
    
    [self.timer invalidate];
    self.timer = nil;
    [self.game resetGame];
    [self updateUI];
    self.flipCount = 0;
    self.replaySlider.value = 0;
    [self.timer fire];
}
@end
