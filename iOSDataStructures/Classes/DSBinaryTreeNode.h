//
//  DSBinaryTreeNode.h
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/11/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSBinaryTreeNode : NSObject{
    DSBinaryTreeNode *leftChild;
    DSBinaryTreeNode *rightChild;
    NSObject *data;
}

@property (nonatomic, readonly, retain) DSBinaryTreeNode *leftChild;
@property (nonatomic, readonly, retain) DSBinaryTreeNode *rightChild;
@property (nonatomic, readonly, retain) NSObject *data;

- (id)init;
- (id)initWithData:(NSObject*)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*) rightChild;

+ (id)node;
+ (id)nodeWithData(NSObject*)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*)rightChild;

@end
