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

@interface SetGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
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
@end
