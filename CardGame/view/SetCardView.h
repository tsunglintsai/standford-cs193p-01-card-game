//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Wilken Hustedt on 13.02.13.
//  Copyright (c) 2013 whustedt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCardView : UIView

@property (nonatomic) int number;
@property (nonatomic) int shape;
@property (nonatomic) int color;
@property (nonatomic) int fill;
@property (nonatomic) BOOL drawSelected;
@end
