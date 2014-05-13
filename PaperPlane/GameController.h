//
//  GameController.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 5. 11..
//  Copyright (c) 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property(nonatomic, assign) bool      isGameOver;
@property(nonatomic, assign) CGFloat   scrollSpeed;
@property(nonatomic, assign) NSInteger score;

@end
