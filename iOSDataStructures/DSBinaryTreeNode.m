//
//  DSBinaryTreeNode.m
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/11/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import "DSBinaryTreeNode.h"

@interface DSBinaryTreeNode()

@property (nonatomic, readwrite, retain) DSBinaryTreeNode *leftChild;
@property (nonatomic, readwrite, retain) DSBinaryTreeNode *rightChild;
@property (nonatomic, readwrite, retain) NSObject *data;

@end

@implementation DSBinaryTreeNode

- (id)init{
    
    if( (self=[super init]) ) {
        self.leftChild = nil;
        self.rightChild  = nil;
        self.data = nil;
    }
    return self;
    
}

- (id)initWithData:(NSObject*)data{
    
    if( (self=[super init]) ) {
        self.leftChild = nil;
        self.rightChild  = nil;
        self.data = data;
    }
    return self;
    
}

- (id)initWithData:(NSObject*)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*) rightChild{

    if( (self=[super init]) ) {
        self.leftChild = leftChild;
        self.rightChild  = rightChild;
        self.data = data;
    }
    return self;
    
}

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![other isKindOfClass:[self class]])
        return NO;
    return [self isEqualToBinaryTreeNode:other];
}

- (BOOL)isEqualToBinaryTreeNode:(DSBinaryTreeNode*)other {
    if (self == other)
        return YES;
    return ([self.data isEqual:other.data] && [self.leftChild isEqual:other.leftChild] && [self.rightChild isEqual:other.rightChild]);
}


+ (id)node{
    
    return [[DSBinaryTreeNode alloc]init];
    
}

+ (id)nodeWithData:(NSObject*)data{
    
    return [[DSBinaryTreeNode alloc]initWithData:data];
    
}

+ (id)nodeWithData:(NSObject*)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*)rightChild{
    
    return [[DSBinaryTreeNode alloc] initWithData:data LeftChild:leftChild RightChild:rightChild];
    
}

@end
