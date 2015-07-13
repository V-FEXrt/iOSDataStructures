//
//  DSLinkedListCell.m
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/12/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import "DSLinkedListCell.h"

@implementation DSLinkedListCell

- (id)init{
    
    if( (self=[super init]) ) {
        self.next = nil;
        self.data = nil;
    }
    return self;
    
}

- (id)initWithData:(id)data Next:(DSLinkedListCell *)next{
    
    if( (self=[super init]) ) {
        self.next = next;
        self.data = data;
    }
    return self;
    
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToLinkedListCell:other];
}

- (BOOL)isEqualToLinkedListCell:(DSLinkedListCell*)other {
    if (self == other)
        return YES;
    return ([self.data isEqual:other.data] && [self.next isEqual:other.next]);
}



+ (id)cell{
    return [[DSLinkedListCell alloc]init];
}

+ (id)cellWithData:(id)data Next:(DSLinkedListCell *)next{
    return [[DSLinkedListCell alloc]initWithData:data Next:next];
}

@end
