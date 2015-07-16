//
//  DSQueue.m
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/15/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import "DSQueue.h"


@interface DSQueue()

@property (readwrite) int count;
@property (readwrite) int index;

@property (nonatomic, readwrite, retain)NSMutableArray *queueArray;

@end

@implementation DSQueue

- (id)init{
    
    if( (self=[super init]) ) {
        self.count = 0;
        self.index = 0;
        self.queueArray = [[NSMutableArray alloc]init];
        
        //add 5 empty objects
        for (int i = 0; i < 5; i++) {
            [self.queueArray addObject:[NSNull null]];
        }
    }
    return self;
    
}

- (void)enqueue:(id)object
{
    if(self.count == [self.queueArray count])
    {
        //double the size of the array
        NSUInteger arrayCount = [self.queueArray count];
        for (int i = 0; i < arrayCount; i++) {
            [self.queueArray insertObject:[NSNull null] atIndex:(self.index + self.count)];
        }
        
    }
    
    if (self.index + self.count < [self.queueArray count])
    {
        self.queueArray[self.index + self.count] = object;
        
        self.count++;
    }
    else
    {
        self.queueArray[(self.index + self.count) - [self.queueArray count]] = object;
        self.count++;
        
    }
}

- (id)peak
{
    if (self.count > 0)
    {
        return self.queueArray[self.index];
    }
    else
    {
        return nil;
    }
}

- (id)dequeue
{
    id obj = [self peak];
    
    if (obj) {
        self.queueArray[self.index] = [NSNull null];
        self.count--;
        self.index++;
        self.index %= [self.queueArray count];
    }

    return obj;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToQueue:other];
}

- (BOOL)isEqualToQueue:(DSQueue *)other{
    if (self == other)
        return YES;
    return ((self.count == other.count) && [self.queueArray isEqualToArray:other.queueArray]);
}

+ (id)queue{
    return [[DSQueue alloc]init];
}

@end
