//
//  SetGameViewController.m
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetGameDeck.h"
#import "SetGameCard.h"

@interface SetGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) SetGameDeck *setGameDeck;
@end


@implementation SetGameViewController

-(SetGameDeck*)setGameDeck{
    if(!_setGameDeck){
        _setGameDeck = [[SetGameDeck alloc]init];
    }
    return _setGameDeck;
}

-(NSUInteger)numberOfMatchedCardInGame{
    return 3;
}

-(Deck*)deck{
    return self.setGameDeck;
}

-(void)setDeck:(Deck *)deck{
    if([deck isKindOfClass:[SetGameDeck class]] || !deck){
        _setGameDeck = (SetGameDeck*) deck;
    }
}

- (void)updateUI{

    for(UIButton *button in self.cardButtons){

        id card = [self.game cardAtIndex: [self.cardButtons indexOfObject:button]];
        if( [card isKindOfClass:[SetGameCard class]]){
            SetGameCard *setGameCard = card;
            [button setTitle:[[NSNumber numberWithInt:[self.cardButtons indexOfObject:button]]description] forState:UIControlStateSelected];
            [button setTitle:[[NSNumber numberWithInt:[self.cardButtons indexOfObject:button]]description] forState:UIControlStateSelected|UIControlStateDisabled];
            [button setTitle:[[NSNumber numberWithInt:[self.cardButtons indexOfObject:button]]description] forState:UIControlStateNormal ];
            [button setAttributedTitle:[[self class]attributedStringForCard:setGameCard] forState:UIControlStateSelected];
            [button setAttributedTitle:[[self class]attributedStringForCard:setGameCard] forState:UIControlStateSelected|UIControlStateDisabled];
            [button setAttributedTitle:[[self class]attributedStringForCard:setGameCard] forState:UIControlStateNormal];
            button.backgroundColor = setGameCard.isUnplayable ? [UIColor clearColor] : setGameCard.isFaceup ? [UIColor blueColor]:[UIColor clearColor];
            button.alpha = setGameCard.isUnplayable ? Disable_Alpha : 1;
        }
        
        
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score:%d",self.game.score];
    
    self.lastFlipResultLabel.attributedText = [[self class] getFlipResultAttributedString:self.game];
    
}

///---------------------------------------------------------------------------------------
/// @name Helper for get attributed string
///---------------------------------------------------------------------------------------

/**
 * The NSString value of of flip result.
 * @param game engine object
 * @return flip result
 **/
+ (NSAttributedString*) getFlipResultAttributedString:(CardMatchingGame*)game{
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc]init];
    
    
    if(game.pointsEarnInLastOperation == FLIP_PENALTY ){
        
        [result appendAttributedString:[[NSAttributedString alloc]initWithString:@"Flipped up "]];
        for( id card in [game cardsInlastOperation]){
            if([card isKindOfClass:[SetGameCard class]]){
                [result appendAttributedString:[[self class]attributedStringForCard:card]];
            }
        }
        
    }else if(game.pointsEarnInLastOperation > 0){
        
        [result appendAttributedString:[[NSAttributedString alloc]initWithString:@"Matched "]];
        for( id card in [game cardsInlastOperation]){
            if([card isKindOfClass:[SetGameCard class]]){
                [result appendAttributedString:[[self class]attributedStringForCard:card]];
                if(![[game.cardsInlastOperation lastObject] isEqual:card]){
                    [result appendAttributedString:[[NSAttributedString alloc]initWithString:@"& "]];
                }
            }
        }
        [result appendAttributedString:[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@" for %d points",abs(game.pointsEarnInLastOperation)]]];
        
        
    }else if(game.pointsEarnInLastOperation < 0){
        
        
        for( id card in [game cardsInlastOperation]){
            if([card isKindOfClass:[SetGameCard class]]){
                [result appendAttributedString:[[self class]attributedStringForCard:card]];
                if(![[game.cardsInlastOperation lastObject] isEqual:card]){
                    [result appendAttributedString:[[NSAttributedString alloc]initWithString:@" & "]];
                }
            }
        }
        [result appendAttributedString:[[NSAttributedString alloc]initWithString:@" don't mach!"]];        
        [result appendAttributedString:[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@" %d points penalty!",abs(game.pointsEarnInLastOperation)]]];

    }
    
    return [result copy];
}

+(NSAttributedString*) attributedStringForCard:(SetGameCard*)setGameCard{
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc]init];
    NSString *cardDisplayString = @"";
    for(int i=0 ; i < [setGameCard.number intValue] ; i++){
        cardDisplayString = [cardDisplayString stringByAppendingString:[[self class] displayStringForSymbol:setGameCard.symbol]];
    }
    [result setAttributedString:[[NSAttributedString alloc]initWithString:cardDisplayString]];
    
    NSDictionary *attribute = @{ NSFontAttributeName : [UIFont systemFontOfSize:17],
    NSForegroundColorAttributeName : [[self class]forgroundColorForCard:setGameCard],
    NSStrokeWidthAttributeName : @-10,
    NSStrokeColorAttributeName :  [[self class]strokeColorForCard:setGameCard] };
    
    [result setAttributes:attribute range:[[result string]rangeOfString:[result string]]];
    
    return result;
}

+(UIColor*)forgroundColorForCard:(SetGameCard*)card{
    NSDictionary *colorMap = @{
        [@[SetGameColorGreen    ,SetGameShadingOpen] componentsJoinedByString:@""]:[UIColor whiteColor],
        [@[SetGameColorRed      ,SetGameShadingOpen] componentsJoinedByString:@""]:[UIColor whiteColor],
        [@[SetGameColorPurple   ,SetGameShadingOpen] componentsJoinedByString:@""]:[UIColor whiteColor],

        [@[SetGameColorGreen    ,SetGameShadingSolid] componentsJoinedByString:@""]:[[self class]greenColor],
        [@[SetGameColorRed      ,SetGameShadingSolid] componentsJoinedByString:@""]:[[self class]redColor],
        [@[SetGameColorPurple   ,SetGameShadingSolid] componentsJoinedByString:@""]:[[self class]purpleColor],
    
        [@[SetGameColorGreen    ,SetGameShadingStriped] componentsJoinedByString:@""]:[[self class]lightGreenColor],
        [@[SetGameColorRed      ,SetGameShadingStriped] componentsJoinedByString:@""]:[[self class]lightRedColor],
        [@[SetGameColorPurple   ,SetGameShadingStriped] componentsJoinedByString:@""]:[[self class]lightPurpleColor],
    
    };
    return [colorMap valueForKey:[@[card.color,card.shading] componentsJoinedByString:@""]];
}

+(UIColor*)strokeColorForCard:(SetGameCard*)card{
    NSDictionary *colorMap = @{SetGameColorGreen:[[self class]greenColor],SetGameColorRed:[[self class]redColor],SetGameColorPurple:[[self class]purpleColor]};
    return [colorMap valueForKey:card.color];
}

+(NSString*) displayStringForSymbol:(NSString*)symbol{
    NSDictionary *symbolMap = @{SetGameSymbolDiamond:@"▲",SetGameSymbolOval:@"●",SetGameSymbolSquiggle:@"■"};
    return [symbolMap valueForKey:symbol] ? [symbolMap valueForKey:symbol] : symbol;
}

+(UIColor*) greenColor{       return [UIColor colorWithRed:0 green:1 blue:0 alpha:1]; }
+(UIColor*) redColor{         return [UIColor colorWithRed:1 green:0 blue:0 alpha:1]; }
+(UIColor*) purpleColor{      return [UIColor colorWithRed:0 green:0 blue:1 alpha:1]; }
+(UIColor*) lightGreenColor{  return [UIColor colorWithRed:0 green:1 blue:0 alpha:0.3]; }
+(UIColor*) lightRedColor{    return [UIColor colorWithRed:1 green:0 blue:0 alpha:0.3]; }
+(UIColor*) lightPurpleColor{ return [UIColor colorWithRed:0 green:0 blue:1 alpha:0.3]; }

@end
