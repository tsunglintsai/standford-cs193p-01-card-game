//
//  PlayingCard.m
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard()
@end

@implementation PlayingCard

-(NSString*) contents{
    return [[[PlayingCard rankStrings]objectAtIndex:self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // because we provide setter AND getter

+(NSArray*) validSuits{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

-(void) setSuit:(NSString*)suit{
    if([PlayingCard.validSuits containsObject:suit]){
        _suit = suit;
    }
}

-(NSString*) suit{
    return _suit ? _suit : @"?";
}

+(NSArray*) rankStrings{
    return @[@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger) maxRank{
    return PlayingCard.rankStrings.count-1;
}

-(void) setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}



@end
