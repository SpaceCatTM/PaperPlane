//
//  StaticValue.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 13..
//  Copyright 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface StaticValue : NSObject

//디바이스 높이 값
@property (nonatomic) CGFloat deviceHSize;

+(StaticValue *)getInstance;
@end
