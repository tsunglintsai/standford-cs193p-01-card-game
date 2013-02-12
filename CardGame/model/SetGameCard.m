//
//  SetGameCard.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SetGameCard.h"

@interface SetGameCard()
@property (strong,nonatomic) UIImage *setGameCardImage;
@end
@implementation SetGameCard

/**
 * List of card constant
 **/
NSUInteger  const SetGameNumberOne      = 1;
NSUInteger  const SetGameNumberTwo      = 2;
NSUInteger  const SetGameNumberThree    = 3;
NSString  *const SetGameSymbolDiamond  = @"diamond";
NSString  *const SetGameSymbolSquiggle = @"squiggle";
NSString  *const SetGameSymbolOval     = @"oval";
NSString  *const SetGameShadingSolid   = @"solid";
NSString  *const SetGameShadingStriped = @"striped";
NSString  *const SetGameShadingOpen    = @"open";
NSString  *const SetGameColorRed       = @"red";
NSString  *const SetGameColorGreen     = @"green";
NSString  *const SetGameColorPurple    = @"purple";

- (id)initWithNumber:(NSNumber*)number withSymbol:(NSString*)symbol withShading:(NSString*)shading withColor:(NSString*)color{
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
    if([cardArray count]==2){ // game set must compare 3 cards, one itself and two other cards
        
        NSMutableArray *allThreeCards = [cardArray mutableCopy];
        [allThreeCards addObject:self];
        score =
        [[self class]isSet:[[self class] getSameItemFromCards: allThreeCards withSelector: @selector(number)]]  &&
        [[self class]isSet:[[self class] getSameItemFromCards: allThreeCards withSelector: @selector(number)]]  &&
        [[self class]isSet:[[self class] getSameItemFromCards: allThreeCards withSelector: @selector(shading)]] &&
        [[self class]isSet:[[self class] getSameItemFromCards: allThreeCards withSelector: @selector(color)]]
        ? 10 :0;
        
    }
    return score;
}

/**
 * Returns list of object in same group of each card in card array
 * @param cards a SetGameCard array
 * @return array of item in same group
 **/
+(NSArray*) getSameItemFromCards:(NSArray*)cards withSelector:(SEL)getter{
    NSMutableArray *result = [[NSMutableArray alloc]init];
    for(id card in cards){
        if ([card isKindOfClass:[SetGameCard class]]){
            SetGameCard *setGameCard = card;
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            id attribute = [setGameCard performSelector:getter];
            #pragma clang diagnostic pop
            [result addObject:attribute];
        }
    }
    return result;
}


/**
 * Returns a boolean value to specifiy weather elements in array is a set or not.
 * @param array array to be evluated
 * @return if group of elements is a set or not.
 **/
+(BOOL) isSet:(NSArray*) array{
    BOOL result = true;
    for(id token in array){
        int tokenCountInArray = [[array indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            return [obj isEqual:token];
        }]count];
        if(tokenCountInArray == 1  || tokenCountInArray == [array count]){
            // do nothing
        }else{
            result = false;
        }
    }
    return result;
}

-(NSAttributedString*) getContentAsAttributedString{
    // TODO: Add logic here
    return nil;
}

-(void)setNumber:(NSNumber*)number{
    if([[[self class]validNumbers] containsObject: number]){
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
    return[[[NSOrderedSet alloc] initWithArray: @[ @(SetGameNumberOne), @(SetGameNumberTwo), @(SetGameNumberThree) ]]copy];
}

+(NSSet*) validSymbol{
    return [[[NSOrderedSet alloc] initWithArray: @[ SetGameSymbolDiamond, SetGameSymbolSquiggle , SetGameSymbolOval]]copy];
}

+(NSSet*) validShading{
    return [[[NSOrderedSet alloc] initWithArray: @[ SetGameShadingSolid, SetGameShadingStriped, SetGameShadingOpen]]copy];
}

+(NSSet*) validColor{
    return [[[NSOrderedSet alloc] initWithArray: @[ SetGameColorRed, SetGameColorGreen, SetGameColorPurple]]copy];
}

-(NSString*) description{
    return [@[self.number,self.symbol,self.shading,self.color]componentsJoinedByString:@","] ;
}

-(UIImage*) setGameCardImage{
    if(!_setGameCardImage){
        NSString *filePrefix = @"SetGameCard";
        if(filePrefix){
            NSString *fileName = [@[filePrefix,self.symbol,self.shading,self.color,self.number] componentsJoinedByString:@"_"];
            _setGameCardImage = [UIImage imageNamed:fileName];
        }
    }
    return _setGameCardImage;
}

-(UIImage*) cardImage{
    return self.setGameCardImage;
}
@end
