//
//  ObstacleEvents.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ObstacleEvents

// 아래로 내려오는 경우
-(void)moveDown;

// 공격 하는 경우
-(void)attack;

// 죽는 경우
-(void)dead;

@end
