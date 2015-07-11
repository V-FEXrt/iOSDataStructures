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

- (id)initWithData:(NSObject*)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*) rightChild{

    if( (self=[super init]) ) {
        self.leftChild = leftChild;
        self.rightChild  = rightChild;
        self.data = data;
    }
    return self;
    
}

+ (id)node{
    
    return [[DSBinaryTreeNode alloc]init];
    
}

+ (id)nodeWithData(NSObject*)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*)rightChild{
    
    return [[DSBinaryTreeNode alloc] initWithData:data LeftChild:leftChild RightChild:rightChild];
    
}

@end
