//
//  DisplaySetting.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "DisplaySetting.h"


@implementation DisplaySetting

// 기기의 화면 크기를 가져온다. (이강용)
+(CGSize)getSize
{
    return [CCDirector sharedDirector].viewSize;
}

// 기기가 3.5인치보다 크면 YES, 그렇지 않으면 NO를 리턴한다.
+(BOOL)isWide
{
    if ([DisplaySetting getSize].height == 568.0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

@end
