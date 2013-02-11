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
    for(GameResult *result in [GameResult allGameResults]){
        displayText = [displayText stringByAppendingFormat:@"%@ Score: %d (%@,%g)\n",result.gameName, result.score,result.end,round(result.duration)];
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
