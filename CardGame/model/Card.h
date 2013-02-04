//
//  Card.h
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property(strong,nonatomic) NSString *contents;

@property(nonatomic, getter = isFaceup) BOOL faceup;
@property(nonatomic, getter = isUnplayable) BOOL unplayable;
@property(strong, nonatomic) UIImage *cardImage;

-(int) match:(NSArray*) cardArray;
              
@end
