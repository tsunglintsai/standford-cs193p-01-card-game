//
//  CardGameViewController.h
//  CardGame
//
//  Created by Henry on 1/26/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

/** A UIViewController that handles playing card game.
 
 Each instance describes a single source code comment for any object - class, category, protocol, method... As the comment is universal for each object, it contains properties for all fields applying to any kind of object. However not all are used in all cases. If a property is not used, it's value remains `nil`. Derived values are handled with:
 
 */
#define Disable_Alpha 0.4

@interface CardGameViewController : UIViewController
///---------------------------------------------------------------------------------------
/// @name CardGameViewController Attributes
///---------------------------------------------------------------------------------------

/**
 * The label showing flip counts.
 **/
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

/**
 * The flip count value.
 **/
@property (nonatomic) int flipCount;

/**
 * The UIButton array that presents as cards.
 **/
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

/**
 * The CardMachingGame engine object.
 **/
@property (strong, nonatomic) CardMatchingGame *game;

/**
 * The Deck object used for playing game.
 **/
@property (strong, nonatomic) Deck *deck;

/**
 * The number of card needed to be match in game in order to get points.
 **/
@property (nonatomic) NSUInteger numberOfMatchedCardInGame;

/**
 * The label showing current score.
 **/
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

/**
 * The label showing flip result.
 **/
@property (weak, nonatomic) IBOutlet UILabel *lastFlipResultLabel;

///---------------------------------------------------------------------------------------
/// @name Set Gameing Logic and UI visual
///---------------------------------------------------------------------------------------

/**
 * UI updated when flip is done
 **/
- (void)updateUI;

///---------------------------------------------------------------------------------------
/// @name Perform UI Target Action Call Back
///---------------------------------------------------------------------------------------

/**
 * The NSString value of of flip result.
 * @param game engine object
 * @return flip result
 **/
+ (NSString*) getFlipResultString:(CardMatchingGame*)game;
    
/**
 * perform action when a deal button is clicked
 * @param sender button that been clicked
 **/
- (IBAction)dealButtonClicked:(id)sender;

/**
 * perform action when a button is clicked
 * @param sender button that been clicked
 **/
- (IBAction)flipCard:(UIButton *)sender;

@end
