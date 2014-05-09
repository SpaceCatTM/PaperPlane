//
//  Plane.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import "Plane.h"

@implementation Plane

// 정점 리스트
-(CGPoint *)getVertices
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
        
        //[self.physicsBody applyAngularImpulse:-100];
        [self setRotation:self.rotation+1];
    }
    else if (self.rotation > 0)
    {
        //[self.physicsBody applyAngularImpulse:100];
        [self setRotation:self.rotation-1];
    }
    
    if(self.rotation >45)
    {
        [self setRotation:45];
    }
    else if(self.rotation <-45)
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
    CGFloat initialPosition = [GameParameters getPlayerInitialPosition].y;
    
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
 
      if(self.rotation >0)
      {
          [self runAction:[CCActionRotateBy actionWithDuration:0.3f angle:-self.rotation - 22.5f]];
      }
      else
      {
          [self runAction:[CCActionRotateBy actionWithDuration:0.3f angle:self.rotation - 22.5f]];
      }
    
    
    NSLog(@"self.ro1 : %f",self.rotation);

   [self.physicsBody applyImpulse:CGPointMake(-[GameParameters getHorizonalForce], 0)];
}

// 오른쪽으로 이동하는 경우
-(void)moveRight
{
    CCLOG(@"moveRight");
    
    if(self.rotation <0)
    {
        [self runAction:[CCActionRotateBy actionWithDuration:0.3f angle:-self.rotation + 22.5f]];
    }
    else
    {
        [self runAction:[CCActionRotateBy actionWithDuration:0.3f angle:self.rotation + 22.5f]];
    }
    
    
     NSLog(@"self.ro1 : %f",self.rotation);
    [self.physicsBody applyImpulse:CGPointMake([GameParameters getHorizonalForce], 0)];
    

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
    self.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:(self.contentSizeInPoints.width / 2) andCenter:self.anchorPointInPoints];
    self.physicsBody.mass = [GameParameters getPlayerMass];
    self.physicsBody.collisionType = @"playerCollision";
    self.scale = 0.1;
    
    return self;
}

@end
