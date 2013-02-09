//
//  SetGameCard.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SetGameCard.h"
@interface SetGameCard()


@end
@implementation SetGameCard

- (id)initWithNumber:(NSUInteger)number withSymbol:(NSString*)symbol withShading:(NSString*)shading withColor:(NSString*)color{
    self = [super init];
    if(self){
        
        self.number = number;
        self.symbol = symbol;
        self.shading = shading;
        self.color = color;

        // if any value is not valid, then return nil
        if(!self.number |!self.symbol | !self.shading | !self.color ){
            self = nil;
        }
    }
    return self;
}

-(NSString*) contents{
    return self.symbol;
}

-(int) match:(NSArray*) cardArray{
    int score = 0;
    // TODO: Add logic here
    return score;
}

-(NSAttributedString*) getContentAsAttributedString{
    // TODO: Add logic here
    return nil;
}

-(void)setNumber:(NSUInteger)number{
    if([[[self class]validNumbers] containsObject: @(number)]){
        _number = number;
    }
}

-(void)setSymbol:(NSString *)symbol{
    if([[[self class]validSymbol] containsObject: symbol]){
        _symbol = symbol;
    }
}

-(void)setShading:(NSString *)shading{
    if([[[self class]validShading] containsObject: shading]){
        _shading = shading;
    }
}

-(void)setColor:(NSString *)color{
    if([[[self class]validColor] containsObject: color]){
        _color = color;
    }
}

+(NSSet*) validNumbers{
    return[[[NSOrderedSet alloc] initWithArray: @[ @1, @2, @3 ]]copy];
}

+(NSSet*) validSymbol{
    return [[[NSOrderedSet alloc] initWithArray: @[@"diamond",@"squiggle",@"oval"]]copy];
}

+(NSSet*) validShading{
    return [[[NSOrderedSet alloc] initWithArray:@[@"solid",@"striped",@"open"]]copy];
}

+(NSSet*) validColor{
    return [[[NSOrderedSet alloc] initWithArray:@[@"red",@"green",@"purple"]]copy];
}
@end
