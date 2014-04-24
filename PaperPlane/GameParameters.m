//
//  GameParameters.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 21..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "GameParameters.h"

@implementation GameParameters

+(CGFloat) getRestorePositionInterval
{
    // 비행기 초기 위치로 돌아가도록 하기 위해서 주기적으로 내부에서 스케쥴러가 감시하게 되는데, 여기에 주기를 설정한다. (초 단위)
    return 0.3;
}

+(CGFloat) getRestoreHorizonalForce
{
    // 비행기 초기 위치로 돌아가기 위해서 좌/우로 가해질 힘 값 (0.0 ~ 1.0 범위로 설정)
    return 0.01f;
}

+(CGPoint) getPlayerInitialPosition
{
    // 비행기 초기 위치 (0.0 ~ 1.0 범위로 설정)
    return CGPointMake(0.2f, 0.5f);
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
