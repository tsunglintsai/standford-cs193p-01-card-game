//
//  SetGameCard.h
//  CardGame
//
//  Created by Daniela on 2/8/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "Card.h"

/**
 * A SetGameCard object is varying in four features: number (one, two, or three); symbol (diamond, squiggle, oval); shading (solid, striped, or open); and color (red, green, or purple).
 *
 **/
@interface SetGameCard : Card


///---------------------------------------------------------------------------------------
/// @name Get Card Content
///---------------------------------------------------------------------------------------

/**
 * The attributed string content of card.
 **/
-(NSAttributedString*) getContentAsAttributedString;
@end
