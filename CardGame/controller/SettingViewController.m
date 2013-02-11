//
//  SettingViewController.m
//  CardGame
//
//  Created by Daniela on 2/11/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "SettingViewController.h"
#import "GameResult.h"

@interface SettingViewController ()
@property (strong,nonatomic) UIAlertView *alertView;
@end

@implementation SettingViewController

-(UIAlertView*)alertView{
    if(!_alertView){
        _alertView = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                          message:@"Are you sure you want delete all scores? this action cannot be undo."
                                                         delegate:self
                                                cancelButtonTitle:@"Cancel"
                                                otherButtonTitles:@"Yes, delete score",nil];
    }
    return _alertView;
}

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Cancel"]){
        // do nothing
    }
    else if([title isEqualToString:@"Yes, delete score"]){
        [GameResult deleteAllGameResults];
    }
}

- (IBAction)clearScoreButtonClicked:(UIButton *)sender {
    [self.alertView show];
}

@end
