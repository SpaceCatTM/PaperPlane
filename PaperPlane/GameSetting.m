//
//  GameParameters.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 21..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "GameSetting.h"

@implementation GameSetting

+(CGPoint) playerInitialPosition
{
    // 비행기 초기 위치 (0.0 ~ 1.0 범위로 설정)
    return CGPointMake(0.5f, 0.2f);
}

+(CGFloat) playerMass
{
    // 비행기 질량 값
    return 10;
}

+(CGFloat) angularForce
{
    // 좌/우로 이동할 때 가해질 회전력
    return 3430.0;
}

+(CGFloat) verticalForce
{
    // 화면 위로 전진하고자 하는 힘 값
    return 1.0;
}

+(CGFloat) horizonalForce
{
    // 좌/우로 가해질 힘 값 (0.0 ~ 1.0 범위로 설정)
    return 500.0;
}

+(CGFloat) maximumScrollSpeed
{
    // 최대 스크롤 속도
    return 0.012;
}

+(CGFloat) decraseScrollSpeedOnCollision
{
    // 충돌 했을 때 스크롤 속도 감소
    return 0.005;
}

@end
