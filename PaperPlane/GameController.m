//
//  GameController.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 5. 11..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import "GameController.h"
#import "GameSetting.h"

@implementation GameController

-(id)init
{
    self = [super init];
    if (!self) return (nil);
    
    [self Reset];
    
    return self;
}

static GameController *_instance = NULL;

-(void)Reset
{
    self.isGameOver = NO;
    self.score = 0;
    self.scrollSpeed = GameSetting.maximumScrollSpeed * 0.7;
    self.windDirection = ccp(0.0, 0.0);
}

+(GameController *)sharedInstance
{
    if (_instance == NULL)
    {
        _instance = [GameController new];
    }

    return _instance;
}

@end
