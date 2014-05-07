//
//  Meteor.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import "Meteor.h"

@implementation Meteor

// 정점 리스트
-(CGPoint *)getVertices
{
    return (CGPoint[])
    {
        -17.7, 7.6,
        -1.8, 19.3,
        9.0, 15.8,
        16.1, 9.9,
        19.9, 2.0,
        20.0, -9.4,
        15.6, -15.0,
        5.9, -18.4,
        -5.3, -18.4,
        -10.0, -18.5,
        -14.2, -14.3,
        -18.2, -8.3,
        -18.3, -3.1,
        -18.7, 4.7
    };
};

// 충돌 체크
-(void)onCollision
{
    
}

// 아래로 내려오는 경우
-(void)moveDown
{
    CGPoint positionFrom = CGPointMake((random() % 100) / 100.0f, 1.0f);
    CGPoint positionTo   = CGPointMake(positionFrom.x, -0.1f);
    
    self.positionType = CCPositionTypeNormalized;
    self.position = positionFrom;
    
    [self runAction:[CCActionMoveTo actionWithDuration:5.0f position:positionTo]];
}

// 공격하는 경우
-(void)attack
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
    
    self = [self initWithImageNamed:@"rock.png"];
    self.physicsBody = [CCPhysicsBody bodyWithCircleOfRadius:(self.contentSizeInPoints.width / 2) andCenter:self.anchorPointInPoints];
    self.physicsBody.collisionType = @"obstacleCollision";
    
    return self;
}

@end
