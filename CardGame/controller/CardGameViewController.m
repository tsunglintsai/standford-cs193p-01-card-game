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
#import "FlipResultView.h"

#define PLAYABLE_CARD_SECTION 0
#define PLAYDONE_CARD_SECTION 1


@interface CardGameViewController()
@property (strong, nonatomic) GameResult *gameResult;
@property (strong, nonatomic) NSMutableArray *cardsDonePlay;
@property (weak, nonatomic) IBOutlet UIButton *drawMoreCardButton;
@property (weak, nonatomic) IBOutlet FlipResultView *flipResultView;

@end

@implementation CardGameViewController


-(NSMutableArray *) cardsDonePlay{
    if(!_cardsDonePlay){
        _cardsDonePlay = [[NSMutableArray alloc]init];
    }
    return _cardsDonePlay;
}

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
    self.gameResult.score = self.game.score;
    if( [self.game pointsEarnInLastOperation] == FLIP_PENALTY ){ // flip a card
        self.flipResultView.prefixString = @"";
        self.flipResultView.sufixString = @"flipped";
        [self.cardCollectionView reloadData];
    }else if( [self.game pointsEarnInLastOperation] < 0 ){ // found no match
        self.flipResultView.prefixString = @"";
        self.flipResultView.sufixString = @"don’t match! 2 point penalty!";
        [self.cardCollectionView reloadData];
    }else if( [self.game pointsEarnInLastOperation] > 0 ){ // found a match
        self.flipResultView.prefixString = @"Matched";
        self.flipResultView.sufixString = @"for 4 points";
        
        NSArray *cardsToBeRemoved = [self.game cardsInlastOperation];
        NSMutableArray *cardIndexesToBeDeleted = [[NSMutableArray alloc]init];
        NSMutableArray *cardIndexesToBeAdded = [[NSMutableArray alloc]init];
        NSMutableArray *removedCard = [[NSMutableArray alloc]init];
        
        // get indexes of card in collection to be removed
        for(Card *card in cardsToBeRemoved){
            // remove card from model
            [cardIndexesToBeDeleted addObject:[NSIndexPath indexPathForItem:[self.game indexOfCard:card] inSection:PLAYABLE_CARD_SECTION]];
        }
        
        // remove card from model
        for(Card *card in cardsToBeRemoved){
            [self.game removeCard:card];
            [removedCard addObject:card];
        }
        
        // add cards to doneplay card list
        [cardIndexesToBeAdded addObject:[NSIndexPath indexPathForItem:[self.cardsDonePlay count] inSection:PLAYDONE_CARD_SECTION]];
        [self.cardsDonePlay addObject:[removedCard copy]];
        
        // remove card from collection view
        [self.cardCollectionView performBatchUpdates:^{
            [self.cardCollectionView deleteItemsAtIndexPaths:cardIndexesToBeDeleted];
            //[self.cardCollectionView insertItemsAtIndexPaths:cardIndexesToBeAdded];
        } completion:^(BOOL finished) {
            [self.cardCollectionView reloadData];
        }];
    }else{
        self.flipResultView.prefixString = @"";
        self.flipResultView.sufixString = @"";
        [self.cardCollectionView reloadData];
    }
    [self.flipResultView removeAllCardViews];        
    for( Card *card in [self.game cardsInlastOperation]){
        //NSLog(@"put %@ in result view",card);
        [self.flipResultView addCardView:[self createCardViewUsingCard:card]];
    }
    
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
    self.drawMoreCardButton.enabled = YES;
    [self.drawMoreCardButton setTitle:@"Draw Cards" forState:UIControlStateNormal];
    [self updateUI];
}

- (IBAction)drawMoreCards:(id)sender {
    NSArray *cardDrawed = [self.game drawMoreCardWithCardCount:3];

    if([cardDrawed count]==0){
        [self.drawMoreCardButton setTitle:@"Empty Deck" forState:UIControlStateDisabled];
        [self.drawMoreCardButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        self.drawMoreCardButton.enabled = NO;
    }
    // update ui collection view
    NSMutableArray *indexesToBeAdded = [[NSMutableArray alloc]init];
    for(Card *card in cardDrawed){
        [indexesToBeAdded addObject:[NSIndexPath indexPathForItem:[self.game indexOfCard:card] inSection:PLAYABLE_CARD_SECTION]];
    }
    [self.cardCollectionView performBatchUpdates:^{
        [self.cardCollectionView insertItemsAtIndexPaths:indexesToBeAdded];
    } completion:^(BOOL finished) {
        [self.cardCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem: [self.cardCollectionView numberOfItemsInSection:PLAYABLE_CARD_SECTION]-1 inSection:PLAYABLE_CARD_SECTION] atScrollPosition: UICollectionViewScrollPositionNone animated:YES];
    }];
    
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
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(section == PLAYABLE_CARD_SECTION){ // playing cards
        NSLog(@"numberOfItemsInSection 1:%i",[self.game playableCardCount]);
        return [self.game playableCardCount];
    }else if(section == PLAYDONE_CARD_SECTION){ // cards that done play
        //NSLog(@"numberOfItemsInSection 2:%i",[self.cardsDonePlay count]);
        return [self.cardsDonePlay count];
    }else{
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"cellForItemAtIndexPath indexPath:%@",indexPath);
    UICollectionViewCell *cell;
    if(indexPath.section == PLAYABLE_CARD_SECTION){
        cell = [self.cardCollectionView dequeueReusableCellWithReuseIdentifier:@"CardCell" forIndexPath:indexPath];
        [self updateCell:cell useringCard:[self.game cardAtIndex:indexPath.item]];

    }else if(indexPath.section == PLAYDONE_CARD_SECTION){
        NSLog(@"%@",indexPath);
        cell = [self.cardCollectionView dequeueReusableCellWithReuseIdentifier:@"CardSetCell" forIndexPath:indexPath];
        //[self updateCell:cell useringCardSet:[self.cardsDonePlay objectAtIndex:indexPath.item]];
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

#pragma mark - ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
#pragma mark - ┃ gesture recoginzer         {  ┃
#pragma mark - ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
- (IBAction)cardCellClicked:(UITapGestureRecognizer *)gesture {
    NSLog(@"userCellClicked");
    CGPoint tapLocation = [gesture locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if(indexPath){
        [self.game flipCardAtIndex:indexPath.item];
        [self updateUI];        
    }
}

#pragma mark - ╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
#pragma mark - ┃ gesture recoginzer         }  ┃
#pragma mark - ╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯


- (void) updateCell:(UICollectionViewCell*) cell useringCard:(Card*)card{
    // abstract
}

- (void) updateCell:(UICollectionViewCell*) cell useringCardSet:(NSArray*)cardSet{
    // abstract
}

- (UIView*) createCardViewUsingCard:(Card*) card{
    // abstract
    return nil;
}
@end
