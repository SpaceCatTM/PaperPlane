//
//  ObstacleEvents.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 17..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ObstacleDelegate

-(void)spawn;
-(void)dead;

@end
