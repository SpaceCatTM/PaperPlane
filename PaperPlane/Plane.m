//
//  Plane.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import "Plane.h"
#import "GameSetting.h"

@implementation Plane

-(void)controlVelocity
{
    if (self.physicsBody.velocity.x > 0)
    {
        [self.physicsBody applyImpulse:CGPointMake(-1, 0)];
    }
    else if (self.physicsBody.velocity.x < 0)
    {
        [self.physicsBody applyImpulse:CGPointMake(1, 0)];
    }
}

-(void)controlRotation
{
    if (self.rotation < 0)
    {
        [self setRotation:self.rotation + 1];
    }
    else if (self.rotation > 0)
    {
        [self setRotation:self.rotation - 1];
    }
    
    if (self.rotation > 45)
    {
        [self setRotation:45];
    }
    else if(self.rotation < -45)
    {
        [self setRotation:-45];
    }
}

-(void)controlHorizontalPosition
{
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

-(void)controlVerticalPosition
{
    CGFloat initialPosition = GameSetting.playerInitialPosition.y;
    
    if (self.position.y < initialPosition)
    {
        [self.physicsBody applyImpulse:CGPointMake(0, 1)];
    }
    else if (self.position.y > initialPosition)
    {
        [self.physicsBody applyImpulse:CGPointMake(0, -1)];
    }
}

-(void)update:(CCTime)delta
{
    [self controlVelocity];
    [self controlRotation];
    [self controlHorizontalPosition];
    [self controlVerticalPosition];
}

// 왼쪽으로 이동하는 경우
-(void)moveLeft;
{
    CCLOG(@"moveLeft");
 
    if (self.rotation > 0)
    {
        [self runAction:[CCActionRotateBy actionWithDuration:0.3f angle:-self.rotation - 22.5f]];
    }
    else
    {
        [self runAction:[CCActionRotateBy actionWithDuration:0.3f angle:self.rotation - 22.5f]];
    }
    
    [self.physicsBody applyImpulse:CGPointMake(-GameSetting.horizonalForce, 0)];
}

// 오른쪽으로 이동하는 경우
-(void)moveRight
{
    CCLOG(@"moveRight");
    
    if (self.rotation < 0)
    {
        [self runAction:[CCActionRotateBy actionWithDuration:0.3f angle:-self.rotation + 22.5f]];
    }
    else
    {
        [self runAction:[CCActionRotateBy actionWithDuration:0.3f angle:self.rotation + 22.5f]];
    }
    
    [self.physicsBody applyImpulse:CGPointMake(GameSetting.horizonalForce, 0)];
}

// 공격을 받았을 경우
-(void)getDamage
{
    return;
}

// 죽는 경우
-(void)dead
{
    return;
}

// 초기화
-(id)init
{
    self = [super init];
    if (!self) return (nil);

    self = [self initWithImageNamed:@"plane.png"];
    self.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:(self.contentSizeInPoints.width / 2) andCenter:self.anchorPointInPoints];
    self.physicsBody.mass = GameSetting.playerMass;
    self.physicsBody.collisionType = @"playerCollision";
    self.scale = 0.1;
    
    return self;
}

@end
