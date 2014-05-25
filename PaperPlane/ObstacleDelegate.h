//
//  ObstacleEvents.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ObstacleDelegate

@property(nonatomic, assign) CGFloat speed;
@property(nonatomic, assign) CGFloat weight;

@property(nonatomic, assign) BOOL isIgnoreWind;
@property(nonatomic, assign) BOOL isIgnoreScroll;

-(void)spawn:(CGPoint)position;
-(void)move;
-(void)dead;

@end
