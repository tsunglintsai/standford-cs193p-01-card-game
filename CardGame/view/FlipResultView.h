//
//  FlipResultView.h
//  CardGame
//
//  Created by Daniela on 2/20/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipResultView : UIView
@property (strong,nonatomic) NSString *prefixString;
@property (strong,nonatomic) NSString *sufixString;
-(void) addCardView:(UIView*)cardView;
-(void) removeAllCardViews;
@end
