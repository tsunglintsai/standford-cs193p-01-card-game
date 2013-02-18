//
//  SetGameCard.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SetGameCard.h"

@interface SetGameCard()

@property (readwrite, nonatomic) NSUInteger number;
@property (readwrite, nonatomic) NSUInteger symbol;
@property (readwrite, nonatomic) NSUInteger shading;
@property (readwrite, nonatomic) NSUInteger color;

@end
@implementation SetGameCard

- (id)initWithNumber:(NSUInteger)number withSymbol:(NSUInteger)symbol withShading:(NSUInteger)shading withColor:(NSUInteger)color{
    self = [super init];
    if(self){
        
        self.number = number;
        self.symbol = symbol;
        self.shading = shading;
        self.color = color;

        // if any value is not valid, then return nil
        if( self.number >= [[self class]maxNumber] || self.symbol >= [[self class]maxSymbol] || self.shading >= [[self class]maxShading] || self.color >= [[self class]maxColor] ){
            self = nil;
        }
    }
    return self;
}


-(int) match:(NSArray*) cardArray{
    int score = 0;
    if([cardArray count]==2){ // set game must compare 3 cards, one itself and two other cards
        
        NSMutableArray *allThreeCards = [cardArray mutableCopy];
        [allThreeCards addObject:self];
        NSUInteger sumOfSymbol=0,sumOfNumber=0,sumOfShading=0,sumOfColor=0;
        for(id card in allThreeCards){
            if([card isKindOfClass:[SetGameCard class]]){
                SetGameCard *setGameCard = card;
                sumOfSymbol += setGameCard.symbol;
                sumOfNumber += setGameCard.number;
                sumOfShading += setGameCard.shading;
                sumOfColor += setGameCard.color;
                NSLog(@"process card:%@",setGameCard);
                NSLog(@"sums:%@",[@[@(sumOfSymbol),@(sumOfNumber),@(sumOfShading),@(sumOfColor)] componentsJoinedByString:@","]);
                
            }else{ // if any object in array is not set game card,then return 0
                return 0;
            }
        }
        NSLog(@"sums:%@",[@[@(sumOfSymbol),@(sumOfSymbol),@(sumOfShading),@(sumOfColor)] componentsJoinedByString:@","]);
        score = (sumOfSymbol % 3 == 0 && sumOfNumber % 3 == 0 && sumOfShading % 3 == 0 && sumOfColor % 3 == 0) ? 10 :0;
    }
    return score;
}

+(NSUInteger) maxNumber{
    return 3;
}

+(NSUInteger) maxSymbol{
    return 3;
}

+(NSUInteger) maxShading{
    return 3;
}

+(NSUInteger) maxColor{
    return 3;
}

-(NSString*) description{
    return [@[@(self.number),@(self.symbol),@(self.shading),@(self.color)]componentsJoinedByString:@","];
}

@end
