//
//  GameResult.m
//  CardGame
//
//  Created by Daniela on 2/11/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "GameResult.h"
@interface GameResult()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;

@end

@implementation GameResult

#define ALL_RESULTS_KEY @"GameResult_ALL"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"
#define GAME_NAME_KEY @"GameName"


+(NSArray *)allGameResults{
    NSMutableArray *allGameResults = [[NSMutableArray alloc]init];
    for(id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY]allValues]){
        GameResult *result = [[GameResult alloc]initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    return allGameResults;
}

+(void)deleteAllGameResults{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

-(id)initWithGameName:(NSString*)gameName{
    self = [self init];
    if(self){
        self.gameName = gameName? gameName : @"";
    }
    return self;
}

-(id)initFromPropertyList:(id)plist{
    self = [self init];
    if(self){
        if([plist isKindOfClass:[NSDictionary class]]){
            NSDictionary *resultDictionaray = (NSDictionary *)plist;
            _start = resultDictionaray[START_KEY];
            _end = resultDictionaray[END_KEY];
            _score = [resultDictionaray[SCORE_KEY] intValue];
            _gameName = resultDictionaray[GAME_NAME_KEY];
            if(!_start || !_end) self = nil;
        }
    }
    return self;
}

-(void)synchronize{
    NSMutableDictionary *mutableGameResulsFromUserDefaults = [[[NSUserDefaults standardUserDefaults]dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if(!mutableGameResulsFromUserDefaults){
        mutableGameResulsFromUserDefaults = [[NSMutableDictionary alloc]init];
    }
    mutableGameResulsFromUserDefaults[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResulsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
}



-(id) asPropertyList{
    return @{ GAME_NAME_KEY : self.gameName ,START_KEY : self.start , END_KEY : self.end , SCORE_KEY : @(self.score)};
}

-(id) init{
    self = [super init];
    if(self){
        _start = [NSDate date];
        _end = [NSDate date];
        _gameName = @"";
    }
    return self;
}

-(NSTimeInterval) duration{
    return [self.end timeIntervalSinceDate: self.start];
}

-(void)setScore:(int)score{
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
    
}

@end
