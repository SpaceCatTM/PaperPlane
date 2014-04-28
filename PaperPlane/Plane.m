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

// 정점 리스트
-(CGPoint *)getPoints
{
    return (CGPoint[])
    {
        228.1, -168.0,
        141.3, 41.4,
        47.4, 264.9,
        32.7, 291.5,
        16.9, 297.9,
        3.9, 287.4,
        -24.2, 230.2,
        -91.2, 85.1,
        -152.6, -49.1,
        -198.2, -148.7,
        -224.3, -208.1,
        -217.9, -221.7,
        -201.1, -229.1,
        -74.3, -183.6,
        38.3, -293.7,
        50.8, -285.9,
        48.9, -167.7,
        208.7, -190.2,
        222.7, -182.4,
        226.6, -166.6
    };
};

-(void)update:(CCTime)delta
{
    // 이동 방향의 반대 방향으로 감속을 준다.
    if (self.physicsBody.velocity.x > 0)
    {
        [self.physicsBody applyImpulse:CGPointMake(-1, 0)];
    }
    else if (self.physicsBody.velocity.x < 0)
    {
        [self.physicsBody applyImpulse:CGPointMake(1, 0)];
    }
    
    // 기울어진 각도에 반대의 힘으로 각도를 준다.
    [self.physicsBody applyAngularImpulse:self.rotation];
    
    // 좌, 우 이동 범위 지정
    if (self.position.x < 0.05)
    {
        self.physicsBody.velocity = CGPointZero;
        self.position = CGPointMake(0.05, self.position.y);
    }
    else if (self.position.x > 0.95)
    {
        self.physicsBody.velocity = CGPointZero;
        self.position = CGPointMake(0.95, self.position.y);
    }
}

// 왼쪽으로 이동하는 경우
-(void)moveLeft;
{
    CCLOG(@"moveLeft");

    [self.physicsBody applyAngularImpulse:25];
    [self.physicsBody applyImpulse:CGPointMake(-500, 0)];
}

// 오른쪽으로 이동하는 경우
-(void)moveRight
{
    CCLOG(@"moveRight");
 
    [self.physicsBody applyAngularImpulse:-25];
    [self.physicsBody applyImpulse:CGPointMake(500, 0)];
}

// 공격을 받았을 경우
-(void)getDamage
{

}

// 죽는 경우
-(void)dead
{

}

// 초기화
-(id)init
{
    self = [super init];
    if (!self) return (nil);

    self = [self initWithImageNamed:@"plane.png"];
    self.physicsBody = [CCPhysicsBody bodyWithPolylineFromPoints:[self getPoints] count:20 cornerRadius:0 looped:YES];
    self.physicsBody.type = CCPhysicsBodyTypeDynamic;
    self.physicsBody.sensor = YES;
    self.scale = 0.1;
    
    return self;
}

@end
