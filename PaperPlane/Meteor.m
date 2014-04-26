//
//  Meteor.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import "Meteor.h"

@implementation Meteor

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

@end
