//
//  Plane.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import "Plane.h"
#import "GameParameters.h"
#import "PlayerEvents.h"

@implementation Plane

-(void)goCenter
{
    if (self.position.x > 0.49f && self.position.x < 0.51f)
    {
        [self setPosition:CGPointMake(0.5f, self.position.y)];
        [self unschedule:@selector(goCenter)];
    }
    else if (self.position.x < 0.5f)
    {
        [self setPosition:CGPointMake(self.position.x + [GameParameters getRestoreHorizonalForce], self.position.y)];
    }
    else if (self.position.x > 0.5f)
    {
        [self setPosition:CGPointMake(self.position.x - [GameParameters getRestoreHorizonalForce], self.position.y)];
    }
}

// 왼쪽으로 이동하는 경우
-(void)moveLeft;
{
    CCLOG(@"moveLeft");

    [self setPosition:CGPointMake(self.position.x - [GameParameters getHorizonalForce], self.position.y)];

    if (self.position.x != 0.5f)
    {
        [self unschedule:@selector(goCenter)];
        [self schedule:@selector(goCenter) interval:[GameParameters getRestorePositionInterval]];
    }
}

// 오른쪽으로 이동하는 경우
-(void)moveRight
{
    CCLOG(@"moveRight");
 
    [self setPosition:CGPointMake(self.position.x + [GameParameters getHorizonalForce], self.position.y)];

    if (self.position.x != 0.5f)
    {
        [self unschedule:@selector(goCenter)];
        [self schedule:@selector(goCenter) interval:[GameParameters getRestorePositionInterval]];
    }
}

// 공격을 받았을 경우
-(void)getDamage
{

}

// 죽는 경우
-(void)dead
{

}

@end
