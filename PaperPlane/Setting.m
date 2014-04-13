//
//  Setting.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 13..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "Setting.h"

/* 
 Setting 클래스 관련 Code Convention

 1. 변수 이름 위에 설명과 이름을 쓸 것
 
 예> 게임 이동 속도 
    // 게임 이동 속도 (이강용)
    NSInteger GameMove;
*/
static Setting *_getInstance;
@implementation Setting
+(Setting *)getInstance
{
    @synchronized(self)
    {
        if(_getInstance == nil)
        {
            _getInstance = [[Setting alloc] init];
            return _getInstance;
        }
    }
    return _getInstance;
}
@end
