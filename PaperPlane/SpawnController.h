//
//  SpawnController.h
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 26..
//  Copyright 2014년 이강용. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SpawnController : CCNode
{
    @private NSMutableArray *_spawnObjects;
}

-(void)startSpawn;
-(void)stopSpawn;

@end
