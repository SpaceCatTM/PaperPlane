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

-(void)update:(CCTime)delta
{
    // 이동 방향의 반대 방향으로 감속을 준다.
    if (self.physicsBody.velocity.x > 0)
    {
        [self.physicsBody applyImpulse:CGPointMake(-1.0f, 0.0f)];
    }
    else if (self.physicsBody.velocity.x < 0)
    {
        [self.physicsBody applyImpulse:CGPointMake(1.0f, 0.0f)];
    }
    
    // 기울어진 각도에 반대의 힘으로 각도를 준다.
    [self.physicsBody applyAngularImpulse:self.rotation];

    // 좌, 우 이동 범위 지정
    if (self.position.x < 0.05)
    {
        self.position = CGPointMake(0.05, self.position.y);
    }
    else if (self.position.x > 0.95)
    {
        self.position = CGPointMake(0.95, self.position.y);
    }
}

// 왼쪽으로 이동하는 경우
-(void)moveLeft;
{
    CCLOG(@"moveLeft");

    [self.physicsBody applyAngularImpulse:50];
    [self.physicsBody applyImpulse:CGPointMake(-50.0f, 0.0f)];
}

// 오른쪽으로 이동하는 경우
-(void)moveRight
{
    CCLOG(@"moveRight");
 
    [self.physicsBody applyAngularImpulse:-50];
    [self.physicsBody applyImpulse:CGPointMake(50.0f, 0.0f)];
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
    self.physicsBody = [CCPhysicsBody bodyWithRect:self.boundingBox cornerRadius:0];
    self.scale = 0.1;
    
    return self;
}

@end
