//
//  SetGameViewController.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetGameDeck.h"

@interface SetGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) SetGameDeck *setGameDeck;
@end

@implementation SetGameViewController

-(SetGameDeck*)setGameDeck{
    if(!_setGameDeck){
        _setGameDeck = [[SetGameDeck alloc]init];
    }
    return _setGameDeck;
}

-(NSUInteger)numberOfMatchedCardInGame{
    return 3;
}

-(Deck*)deck{
    return self.setGameDeck;
}

- (void)updateUI{
    NSLog(@"ui update");

    for(UIButton *button in self.cardButtons){
        Card *card = [self.game cardAtIndex: [self.cardButtons indexOfObject:button]];
        /*
        [button setTitle:card.contents forState:UIControlStateSelected];
        [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        [button setTitle:card.contents forState:UIControlStateNormal ];
        */
        
        [button setTitle:[[NSNumber numberWithInt:[self.cardButtons indexOfObject:button]]description] forState:UIControlStateSelected];
        [button setTitle:[[NSNumber numberWithInt:[self.cardButtons indexOfObject:button]]description] forState:UIControlStateSelected|UIControlStateDisabled];
        [button setTitle:[[NSNumber numberWithInt:[self.cardButtons indexOfObject:button]]description] forState:UIControlStateNormal ];
        //NSLog(@"%i  isFacedUP:%i",[self.cardButtons indexOfObject:button], card.isFaceup);
        

        button.backgroundColor = card.isFaceup ? [UIColor redColor]:[UIColor clearColor];
        button.highlighted = card.isFaceup;
        button.selected = card.isFaceup;
        button.enabled = !card.isUnplayable;
        button.alpha = card.isUnplayable ? Disable_Alpha : 1;
        //NSLog(@"is button hilighted :%i",button.highlighted);

        

        
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score:%d",self.game.score];
    
    //self.lastFlipResultLabel.text = [[self class] getFlipResultString:self.game];
    
}
@end
