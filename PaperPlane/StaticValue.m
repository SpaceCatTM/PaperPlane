//
//  StaticValue.m
//  PaperPlane
//
//  Created by 이강용 on 2014. 4. 13..
//  Copyright 2014년 이강용. All rights reserved.
//

#import "StaticValue.h"

static StaticValue *_getInstance;

@implementation StaticValue
@synthesize deviceHSize;

+(StaticValue *)getInstance
{
    @synchronized(self)
    {
        if(_getInstance == nil)
        {
            _getInstance = [[StaticValue alloc] init];
            return _getInstance;
        }
    }
    return _getInstance;
}


-(id)init
{
    self = [super init];
    if(self)
    {
        deviceHSize =[CCDirector sharedDirector].viewSize.height;
        
    }
    return self;
}
@end
