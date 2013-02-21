//
//  PlayingCardViewCell.m
//  CardGame
//
//  Created by Henry on 2/18/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "PlayingCardViewCell.h"
#import "PlayingCardView.h"

@interface PlayingCardViewCell()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end
@implementation PlayingCardViewCell


-(void) setSuit:(NSString *)suit{
    _suit = suit;
    self.playingCardView.suit = suit;
}

-(void) setRank:(NSUInteger)rank{
    _rank = rank;
    self.playingCardView.rank = rank;
}

-(void) setFaceup:(BOOL)faceup{
    _faceup = faceup;
    self.playingCardView.faceup = faceup;
}



#pragma mark - Initialization

-(void)setup{
    // do inialization here
    
}

-(void)awakeFromNib{
    [self setup];
    
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
