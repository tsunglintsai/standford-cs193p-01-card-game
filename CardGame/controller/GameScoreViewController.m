//
//  GameScoreViewController.m
//  CardGame
//
//  Created by Daniela on 2/11/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "GameScoreViewController.h"
#import "GameResult.h"

@interface GameScoreViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation GameScoreViewController

-(void) updateUI{
    NSString *displayText = @"";
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    
    
    for(GameResult *result in [GameResult allGameResults]){
        NSString* formattedDate = [formatter stringFromDate:result.end];
        displayText = [displayText stringByAppendingFormat:@"%@ Score: %d (%@ for %g sec)\n",result.gameName, result.score, formattedDate, round(result.duration)];
    }
    if([displayText length]==0){
        displayText = @"There is no game score available! go to play some games.";
    }
    self.display.text = displayText;
}

-(void)setup{
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
}

-(void)awakeFromNib{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}


@end
