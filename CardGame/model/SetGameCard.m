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

/**
 * List of card constant
 **/
NSString  *const SetGameNumberOne      = @"one";
NSString  *const SetGameNumberTwo      = @"two";
NSString  *const SetGameNumberThree    = @"three";
NSString  *const SetGameSymbolDiamond  = @"diamond";
NSString  *const SetGameSymbolSquiggle = @"squiggle";
NSString  *const SetGameSymbolOval     = @"oval";
NSString  *const SetGameShadingSolid   = @"solid";
NSString  *const SetGameShadingStriped = @"striped";
NSString  *const SetGameShadingOpen    = @"open";
NSString  *const SetGameColorRed       = @"red";
NSString  *const SetGameColorGreen     = @"green";
NSString  *const SetGameColorPurple    = @"purple";

- (id)initWithNumber:(NSString*)number withSymbol:(NSString*)symbol withShading:(NSString*)shading withColor:(NSString*)color{
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
        int setQualifiedCount = 0;
        setQualifiedCount+= [[self class]isSet:[[self class] getSameItemFromCards: allThreeCards withSelector: @selector(number)]] ? 1 : 0;
        setQualifiedCount+= [[self class]isSet:[[self class] getSameItemFromCards: allThreeCards withSelector: @selector(symbol)]] ? 1 : 0;
        setQualifiedCount+= [[self class]isSet:[[self class] getSameItemFromCards: allThreeCards withSelector: @selector(shading)]]? 1 : 0;
        setQualifiedCount+= [[self class]isSet:[[self class] getSameItemFromCards: allThreeCards withSelector: @selector(color)]]  ? 1 : 0;
        
        score = setQualifiedCount==0 ? 0 : 1*pow(2,setQualifiedCount);
        NSLog(@"score :%i with Deck %@",score,allThreeCards);

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
 * get array of tokens from a SetGameCard object.
 * @param setGameCard a SetGameCard
 * @return Array of tokens. returns nil if input is not valid array of SetGameCard. 
 **/
+(NSArray*)tokenArrayFromSetGameCard:(NSArray*)setGameCardArray{
    NSMutableArray *tokenArray = [[NSMutableArray alloc]init];
    for( id instance in setGameCardArray){
        SetGameCard *setGameCard = (SetGameCard*)instance;
        if([setGameCard isKindOfClass:[SetGameCard class]]){
            if (setGameCard.number) {[tokenArray addObject:setGameCard.number];}
            if (setGameCard.symbol) {[tokenArray addObject:setGameCard.symbol];}
            if (setGameCard.shading){[tokenArray addObject:setGameCard.shading];}
            if (setGameCard.color)  {[tokenArray addObject:setGameCard.color];}
        }
    }
    NSLog(@"token count:%i",[tokenArray count]);
    if([tokenArray count]!=3*4){
        tokenArray = nil;
    }
    return [tokenArray copy];
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

-(void)setNumber:(NSString*)number{
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
    return[[[NSOrderedSet alloc] initWithArray: @[ @"one", @"two", @"three" ]]copy];
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

-(NSString*) description{
    return [@[self.number,self.symbol,self.shading,self.color]componentsJoinedByString:@","] ;
}
@end
