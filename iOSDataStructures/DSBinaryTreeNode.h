//
//  DSBinaryTreeNode.h
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/11/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 From wikipedia: In computer science, a binary tree is a tree data structure in which each node has at most two children, which are referred to as the left child and the right child.
 
 Beyond that each binary node has a data property for the given node.
 
 Note: This binary tree node class is immutable, once a node has been constructed it can only be changed by creating a new node.
 */
@interface DSBinaryTreeNode : NSObject

/**
 *  Left child of the binary tree node
 */
@property (nonatomic, readonly, retain) DSBinaryTreeNode *leftChild;

/**
 *  Right child of the binary tree node
 */
@property (nonatomic, readonly, retain) DSBinaryTreeNode *rightChild;

/**
 *  Data property of the binary tree node
 */
@property (nonatomic, readonly, retain) id data;

/**
 *  Initializes a binary tree node with both children and data as nil
 *
 *  @return The binary tree node instance
 */
- (id)init;

/**
 *  Initializes a binary tree node with both children as nil
 *
 *  @param data The data to associate with the node
 *
 *  @return The binary tree node instance
 */
- (id)initWithData:(id)data;

/**
 *  Initializes a binary tree node with the given children and data
 *
 *  @param data       The value represented by the binary tree node
 *  @param leftChild  the left child of the node. Can be passed as nil
 *  @param rightChild the right child of the node. Can be passed as nil
 *
 *  @return The binary tree node instance
 */
- (id)initWithData:(id)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*) rightChild;

/**
 *  Adds a node to the calling node in order.
 *
 * Note: The data type must implement compare: and all nodes should have the same type for data
 *
 *  @param node Node to be added to the calling node
 */
-(void)addNode:(DSBinaryTreeNode*)node;

/**
 *  Removes a node from the calling node and keeps all the children
 *
 * Note: The data type must implement compare: and all nodes should have the same type for data
 *
 *  @param node Node to be deleted
 */
-(void)removeNode:(DSBinaryTreeNode*)node;

/**
 *  Removes a node and its children from the calling node
 *
 * Note: The data type must implement compare: and all nodes should have the same type for data
 *
 *  @param node Node to be deleted
 */
-(void)removeNodeAndChildren:(DSBinaryTreeNode*)node;

/**
 *  Returns true if the given node exists in the calling node, otherwise returns false
 *
 *  @param node Node to be searched for
 *
 *  @return Returs true if node exists, otherwise false
 */
-(BOOL)nodeExists:(DSBinaryTreeNode*)node;


/**
 *  Compares the data property of two nodes
 *
 * Note: The data type must implement compare: and all nodes should have the same type for data
 *
 *  @param other Node to be compared againstd
 *
 *  @return NSOrdered type. NSOrderedSame if equal, NSOrderedAccending if the second is larger. NSOrderedDecending if the second is smaller
 */
- (NSComparisonResult)compare:(DSBinaryTreeNode*)other;

/**
 *  Returns a Boolean value that indicates whether the receiver and a given BinaryTreeNode are equal.
 *
 *  @param other node to be verified against
 *
 *  @return Returns true if the nodes are equal, otherwise false
 */
- (BOOL)isEqualToBinaryTreeNode:(DSBinaryTreeNode*)other;

/**
 *  Initializes a binary tree node with both children as nil
 *
 *  @return The binary tree node instance
 */
+ (id)node;

/**
 *  Initializes a binary tree node with both children as nil
 *
 *  @param data The data to associate with the node
 *
 *  @return The binary tree node instance
 */
+ (id)nodeWithData:(id)data;

/**
 *  Initializes a binary tree node with the given children and data
 *
 *  @param data       The value represented by the binary tree node
 *  @param leftChild  the left child of the node. Can be passed as nil
 *  @param rightChild the right child of the node. Can be passed as nil
 *
 *  @return The binary tree node instance
 */
+ (id)nodeWithData: (id)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*)rightChild;

/**
 *  Merges to binary tree nodes and returns the resulting binary tree node
 *
 *  @param node      First node to be merged
 *  @param otherNode Second node to be merged
 *
 *  @return The node represented by the merging of the two node parameters
 */
+(DSBinaryTreeNode *)merge:(DSBinaryTreeNode*)node With:(DSBinaryTreeNode*)otherNode;

@end
