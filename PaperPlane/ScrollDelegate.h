//
//  ScrollDelegate.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 5. 11..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ScrollDelegate <NSObject>

// 스크롤
-(void)scroll:(CGFloat)speed;

@end
