//
//  DSStack.m
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/14/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import "DSStack.h"

@interface DSStack()

@property (readwrite) int count;
@property (nonatomic, readwrite, retain)NSMutableArray *stackArray;

@end

@implementation DSStack

- (id)init{
    
    if( (self=[super init]) ) {
        self.count = 0;
        self.stackArray = [[NSMutableArray alloc]init];
        
        //add 5 empty objects
        for (int i = 0; i < 5; i++) {
            [self.stackArray addObject:[NSNull null]];
        }
    }
    return self;
    
}

- (id)peak{
    if(self.count <= 0){
        return nil;
    }else{
        return self.stackArray[self.count];
    }
}

- (id)pop{
    id stackObject = [self peak];
    self.stackArray[self.count] = [NSNull null];
    
    if (stackObject) {
            self.count--;
    }

    return stackObject;
}

- (void)push: (id)object{
    
    if ([self.stackArray count] == self.count + 1) {
        //Double the size of the array
        NSUInteger arraySize = [self.stackArray count];
        for (int i = 0; i < arraySize; i++) {
            [self.stackArray addObject:[NSNull null]];
        }
    }
    
    self.count++;
    
    self.stackArray[self.count] = object;
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToStack:other];
}

- (BOOL)isEqualToStack:(DSStack *)other{
    if (self == other)
        return YES;
    return ((self.count == other.count) && [self.stackArray isEqualToArray:other.stackArray]);
}

+(id)stack{
    return [[DSStack alloc]init];
}

@end
