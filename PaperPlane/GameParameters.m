//
//  GameParameters.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 21..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "GameParameters.h"

@implementation GameParameters

+(CGPoint) getPlayerInitialPosition
{
    // 비행기 초기 위치 (0.0 ~ 1.0 범위로 설정)
    return CGPointMake(0.5f, 0.2f);
}

+(CGFloat) getVerticalForce
{
    // 화면 위로 전진하고자 하는 힘 값 (0.0 ~ 1.0 범위로 설정)
    return 0.05f;
}

+(CGFloat) getHorizonalForce
{
    // 좌/우로 가해질 힘 값 (0.0 ~ 1.0 범위로 설정)
    return 0.05f;
}

@end
