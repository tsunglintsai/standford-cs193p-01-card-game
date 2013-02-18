//
//  Card.h
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A Card object represents a card abstract concept in matching game.
 * This is an abstract class of Card in game. It can be any kind of card.
 *
 **/
@interface Card : NSObject

///---------------------------------------------------------------------------------------
/// @name Card Attributes
///---------------------------------------------------------------------------------------

/** 
 * A NSString value of card content. Parsing are implementaion class's responsibility.
 **/
@property(strong,nonatomic) NSString *contents;

/** 
 * A Boolean value that determines weather the Card object is facing up or not.
 **/
@property(nonatomic, getter = isFaceup) BOOL faceup;

/** 
 * A Boolean value that determines weather the Card object can be flip or not.
 **/
@property(nonatomic, getter = isUnplayable) BOOL unplayable;

///---------------------------------------------------------------------------------------
/// @name Comparing Card
///---------------------------------------------------------------------------------------

/** 
 * Returns a match score of this Card object and other cards.
 *
 * This is usually a abtstract implementation. It returns 1 when card is matcted with any card that in cards array.
 *
 * @param cardArray A Card array to compared with.
 * @return Returns comparing score.
 **/
-(int) match:(NSArray*) cardArray;
              
@end
