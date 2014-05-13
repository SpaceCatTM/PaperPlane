//
//  GameController.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 5. 11..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import "GameController.h"
#import "GameParameters.h"

@implementation GameController

-(id)init
{
    self = [super init];
    if (!self) return (nil);
    
    // 게임 오버 상태
    self.isGameOver = NO;
    
    // 점수
    self.score = 0;
    
    // 스크롤 초기 속도
    self.scrollSpeed = [GameParameters getMaximumScrollSpeed] * 0.7;
    
    return self;
}

@end
