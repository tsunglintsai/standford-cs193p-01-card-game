//
//  Card.m
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "Card.h"

@interface Card()
@end

@implementation Card

-(int) match:(NSArray*) cardArray{
    int score = 0;
    for(Card *card in cardArray){
        if([self.contents isEqualToString:card.contents]){
            score = 1;
        }
    }
    return score;
}

@end
