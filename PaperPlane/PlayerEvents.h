//
//  PlaneAction.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlayerEvents <NSObject>

// 죄로 움직이는 경우
-(void)moveLeft;

// 위로 움직이는 경우
-(void)moveRight;

// 데미지를 받는 경우
-(void)getDamage;

// 죽는 경우
-(void)dead;

@end
