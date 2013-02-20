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
#import "CardHeaderView.h"

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
        _game = [[CardMatchingGame alloc] initWitCardCount:[self startingCardCount] usingDeck:[self getCardDeck]  withMatchCardNumber:[self numberOfMatchedCardInGame]];
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

- (NSUInteger)startingCardCount{
    return 0;
}

#pragma mark - ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
#pragma mark - ┃ collection view datasource {  ┃
#pragma mark - ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section==0){
        return [self startingCardCount];
    }else{
        return [self startingCardCount];
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"cellForItemAtIndexPath indexPath:%@",indexPath);
    UICollectionViewCell *cell;
    if(indexPath.section==0){

        cell = [self.cardCollectionView dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];
        [self updateCell:cell useringCard:[self.game cardAtIndex:indexPath.item]];

    }else{
        cell = [self.cardCollectionView dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];
        [self updateCell:cell useringCard:[self.game cardAtIndex:indexPath.item]];
        
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CardHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CardHeaderView" forIndexPath:indexPath];
    //NSString *searchTerm = self.searches[indexPath.section];
    //[headerView setSearchText:searchTerm];
    return headerView;
}

#pragma mark - ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
#pragma mark - ┃ collection view datasource }  ┃
#pragma mark - ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯


- (void) updateCell:(UICollectionViewCell*) cell useringCard:(Card*)card{
    // abstract
}


@end
