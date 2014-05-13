//
//  SpawnController.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 26..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "SpawnController.h"
#import "Meteor.h"

@implementation SpawnController

-(void)addSpawnObject:(id)object
{
    [_spawnObjects addObject:object];
    [self.parent addChild:object];
}

-(void)removeSpawnObject:(id)object
{
    if ([_spawnObjects containsObject:object] == YES)
    {
        [_spawnObjects removeObject:object];
        [object removeFromParentAndCleanup:YES];
    }
}

-(void)spawnObject
{
    NSInteger randomNumber = (random() % 100);
    
    if (randomNumber > 10)
    {
        Meteor *meteor = [Meteor node];
    
        // 객체를 리스트에 추가한다.
        [self addSpawnObject:meteor];
        
        // 객체를 화면에 표시했을 때 이벤트를 실행한다.
        [meteor spawn];
    }
    
    for (CCNode *object in self.children)
    {
        if (object.position.y < 0.1f)
        {
            [self removeSpawnObject:object];
        }
    }
}

-(void)startSpawn
{
    [self schedule:@selector(spawnObject) interval:0.7];
}

-(void)stopSpawn
{
    [self unschedule:@selector(spawnObject)];
}

-(id)init
{
    self = [super init];
    if (!self) return (nil);
    
    return self;
}

@end
