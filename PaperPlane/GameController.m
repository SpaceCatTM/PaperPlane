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
    
    self.isGameOver = NO;
    self.score = 0;
    self.scrollSpeed = GameSetting.maximumScrollSpeed * 0.7;
    
    return self;
}

@end
