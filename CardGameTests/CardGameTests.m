//
//  CardGameTests.m
//  CardGameTests
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "CardGameTests.h"
#import "SetGameCard.h"

@interface CardGameTests();
@property (nonatomic,strong) NSMutableArray *cardsWithNoSet;
@property (nonatomic,strong) NSMutableArray *cardsWith1SetSameNumber;
@property (nonatomic,strong) NSMutableArray *cardsWith1SetDifferentNumber;
@property (nonatomic,strong) NSMutableArray *cardsWith1SetSameSymbol;
@property (nonatomic,strong) NSMutableArray *cardsWith1SetDifferentSymbol;
@property (nonatomic,strong) NSMutableArray *cardsWith2Set;
@property (nonatomic,strong) NSMutableArray *cardsWith3Set;
@property (nonatomic,strong) NSMutableArray *cardsWith4Set;

@end

@implementation CardGameTests

-(NSMutableArray*) cardsWithNoSet{
    if(!_cardsWithNoSet){
        _cardsWithNoSet = [[NSMutableArray alloc]initWithCapacity:3];
        SetGameCard *card;

        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberOne) withSymbol: SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWithNoSet addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberOne) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWithNoSet addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberThree) withSymbol:SetGameSymbolSquiggle withShading:SetGameShadingOpen withColor:SetGameColorPurple];
        [_cardsWithNoSet addObject:card];
    }
    return [_cardsWithNoSet copy];
}
-(NSMutableArray*) cardsWith1SetSameNumber{
    if(!_cardsWith1SetSameNumber){
        _cardsWith1SetSameNumber = [[NSMutableArray alloc]initWithCapacity:3];
        SetGameCard *card;
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith1SetSameNumber addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith1SetSameNumber addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolSquiggle withShading:SetGameShadingOpen withColor:SetGameColorPurple];
        [_cardsWith1SetSameNumber addObject:card];
    }
    return [_cardsWith1SetSameNumber copy];
}

-(NSMutableArray*) cardsWith2Set{
    if(!_cardsWith2Set){
        _cardsWith2Set = [[NSMutableArray alloc]initWithCapacity:3];
        SetGameCard *card;
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith2Set addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith2Set addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingOpen withColor:SetGameColorPurple];
        [_cardsWith2Set addObject:card];
    }
    return [_cardsWith2Set copy];
}

-(NSMutableArray*) cardsWith3Set{
    if(!_cardsWith3Set){
        _cardsWith3Set = [[NSMutableArray alloc]initWithCapacity:3];
        SetGameCard *card;
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith3Set addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith3Set addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorPurple];
        [_cardsWith3Set addObject:card];
    }
    return [_cardsWith3Set copy];
}

-(NSMutableArray*) cardsWith4Set{
    if(!_cardsWith4Set){
        _cardsWith4Set = [[NSMutableArray alloc]initWithCapacity:3];
        SetGameCard *card;
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorGreen];
        [_cardsWith4Set addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith4Set addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorPurple];
        [_cardsWith4Set addObject:card];
    }
    return [_cardsWith4Set copy];
}

-(NSMutableArray*) cardsWith1SetDifferentNumber{
    if(!_cardsWith1SetDifferentNumber){
        _cardsWith1SetDifferentNumber = [[NSMutableArray alloc]initWithCapacity:3];
        SetGameCard *card;
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberThree) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith1SetDifferentNumber addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberOne) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith1SetDifferentNumber addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolSquiggle withShading:SetGameShadingOpen withColor:SetGameColorPurple];
        [_cardsWith1SetDifferentNumber addObject:card];
    }
    return [_cardsWith1SetDifferentNumber copy];
}

-(NSMutableArray*) cardsWith1SetSameSymbol{
    if(!_cardsWith1SetSameSymbol){
        _cardsWith1SetSameSymbol = [[NSMutableArray alloc]initWithCapacity:3];
        SetGameCard *card;
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberOne) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith1SetSameSymbol addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith1SetSameSymbol addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingOpen withColor:SetGameColorPurple];
        [_cardsWith1SetSameSymbol addObject:card];
    }
    return [_cardsWith1SetSameSymbol copy];
}

-(NSMutableArray*) cardsWith1SetDifferentSymbol{
    if(!_cardsWith1SetDifferentSymbol){
        _cardsWith1SetDifferentSymbol = [[NSMutableArray alloc]initWithCapacity:3];
        SetGameCard *card;
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberOne) withSymbol:SetGameSymbolDiamond withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith1SetDifferentSymbol addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolOval withShading:SetGameShadingSolid withColor:SetGameColorRed];
        [_cardsWith1SetDifferentSymbol addObject:card];
        
        card = [[SetGameCard alloc]initWithNumber:@(SetGameNumberTwo) withSymbol:SetGameSymbolSquiggle withShading:SetGameShadingOpen withColor:SetGameColorPurple];
        [_cardsWith1SetDifferentSymbol addObject:card];
    }
    return [_cardsWith1SetDifferentSymbol copy];
} 

- (void)testSetGameCardScore1{
    if(true){
        NSMutableArray *cardToCompared = [self.cardsWithNoSet mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@0, @(score), @"score is not right");
    }
    
    if(true){
        NSMutableArray *cardToCompared = [self.cardsWith1SetSameNumber mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@2, @(score), @"score is not right");
    }

    if(true){
        NSMutableArray *cardToCompared = [self.cardsWith1SetSameSymbol mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@2, @(score), @"score is not right");
    }
    
    if(true){
        NSMutableArray *cardToCompared = [self.cardsWith1SetDifferentSymbol mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@2, @(score), @"score is not right");
    }
    
    if(true){
        NSMutableArray *cardToCompared = [self.cardsWith2Set mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@4, @(score), @"score is not right");
    }
    
    if(true){
        NSMutableArray *cardToCompared = [self.cardsWith3Set mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@8, @(score), @"score is not right");
    }

    if(true){
        NSMutableArray *cardToCompared = [self.cardsWith4Set mutableCopy];
        NSLog(@"cards to be comapred %@",cardToCompared);
        SetGameCard *card = [cardToCompared lastObject];
        [cardToCompared removeLastObject];
        int score = [card match:cardToCompared];
        STAssertEqualObjects(@16, @(score), @"score is not right");
    }
}

@end
