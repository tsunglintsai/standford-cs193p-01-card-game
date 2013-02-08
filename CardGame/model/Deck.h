//
//  Deck.h
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

/**
 * A Deck object represents a collection of Card objects handles Card abstract concept in game.
 *
 **/
@interface Deck : NSObject


///---------------------------------------------------------------------------------------
/// @name Add & remove cards from deck 
///---------------------------------------------------------------------------------------

/**
 * Inserts a given card either at the top of the Deck or in the bottom of the Deck.
 *
 * @param card Card object that will be inserted.
 * @param atTop Speicified wheather inserted Card object should be in the bottom or in the top.
 **/
-(void) addCard:(Card*)card atTop:(BOOL)atTop;

/**
 * Returns a random card from the Deck object and remove it from the Deck object.
 *
 * @return Returns a Card object.
 **/
-(Card*) drawRandomCard;

@end
