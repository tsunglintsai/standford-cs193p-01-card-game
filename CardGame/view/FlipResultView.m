//
//  FlipResultView.m
//  CardGame
//
//  Created by Daniela on 2/20/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "FlipResultView.h"
@interface FlipResultView()

@property (weak, nonatomic) IBOutlet UILabel *prefixLabel;
@property (weak, nonatomic) IBOutlet UILabel *sufixLabel;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cardViewCollection;
@property (strong, nonatomic) NSMutableArray *cardViewList;
@end
@implementation FlipResultView

-(void)setPrefixString:(NSString *)prefixString{
    _prefixString = prefixString;
    self.prefixLabel.text = prefixString;
}

-(void)setSufixString:(NSString *)sufixString{
    _sufixString = sufixString;
    self.sufixLabel.text = sufixString;
}

-(void) addCardView:(UIView*)cardView{
    [self.carViewList insertObject:cardView atIndex:0];
    [self updateUI];
}

-(void) removeAllCardViews{
    [self.cardViewList removeAllObjects];
    [self updateUI];
}


-(void) updateUI{
    for(UIView *view in self.cardViewCollection){
        for(UIView *subView in [view subviews]){
            [subView removeFromSuperview];
        }
        int index = [self.cardViewCollection indexOfObject:view];
        if(index < [self.carViewList count]){
            UIView *cardView = [self.carViewList objectAtIndex:index];
            cardView.frame = view.bounds;
            cardView.backgroundColor = [UIColor clearColor];
            [view addSubview:cardView];
            [cardView setNeedsDisplay];
        }
    }
}

-(NSMutableArray*) carViewList{
    if(!_cardViewList){
        _cardViewList = [[NSMutableArray alloc]init];
    }
    return _cardViewList;
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
