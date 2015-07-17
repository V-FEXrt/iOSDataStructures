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
@property (nonatomic, readwrite, retain) id data;

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

- (id)initWithData:(id)data{
    
    if( (self=[super init]) ) {
        self.leftChild = nil;
        self.rightChild  = nil;
        self.data = data;
    }
    return self;
    
}

- (id)initWithData:(id)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*) rightChild{

    if( (self=[super init]) ) {
        if(data == nil && (leftChild != nil || rightChild != nil)){
            [NSException raise:@"Unexpected results occur when data is nil, but the children have values" format:nil];
        }
        else{
            self.leftChild = leftChild;
            self.rightChild  = rightChild;
            self.data = data;
        }
    }
    return self;
    
}

- (void)addNode:(DSBinaryTreeNode*)node{
    if (self.data == nil) {
        self.data = node.data;
        self.leftChild = node.leftChild;
        self.rightChild = node.rightChild;
    }
    //This currently adds nodes with equal data to the right child
    else if([self compare:node] == NSOrderedDescending){
        if (self.leftChild == nil) {
            self.leftChild = [DSBinaryTreeNode nodeWithData:node.data LeftChild:node.leftChild RightChild:node.rightChild];
        }
        else{
            [self.leftChild addNode:node];
        }
    }
    else{
        if (self.rightChild == nil) {
            self.rightChild = [DSBinaryTreeNode nodeWithData:node.data LeftChild:node.leftChild RightChild:node.rightChild];
        }
        else{
            [self.rightChild addNode:node];
        }
    }
    
}

- (void)removeNode:(DSBinaryTreeNode*)node{
    switch ([self compare:node]) {
        case NSOrderedSame:
            [NSException raise:@"Node to be removed is the only node in the tree" format:nil];
            break;
            
        case NSOrderedAscending:
            if ([self.rightChild compare:node] == NSOrderedSame) {
                self.rightChild = [DSBinaryTreeNode merge:self.rightChild.leftChild With:self.rightChild.rightChild];
            }
            else{
                [self.rightChild removeNode:node];
            }
            break;
            
        case NSOrderedDescending:
            if ([self.leftChild compare:node] == NSOrderedSame) {
                self.leftChild = [DSBinaryTreeNode merge:self.leftChild.leftChild With:self.leftChild.rightChild];
            }
            else{
                [self.leftChild removeNode:node];
            }
            break;
            
            
        default:
            break;
    }
}

- (void)removeNodeAndChildren:(DSBinaryTreeNode*)node{
    switch ([self compare:node]) {
        case NSOrderedSame:
            [NSException raise:@"Node to be removed is the only node in the tree" format:nil];
            break;
            
        case NSOrderedAscending:
            if ([self.rightChild compare:node] == NSOrderedSame) {
                self.rightChild = nil;
            }
            else{
                [self.rightChild removeNodeAndChildren:node];
            }
            break;
            
        case NSOrderedDescending:
            if ([self.leftChild compare:node] == NSOrderedSame) {
                self.leftChild = nil;
            }
            else{
                [self.leftChild removeNodeAndChildren:node];
            }
            break;

            
        default:
            break;
    }
}

- (BOOL)nodeExists:(DSBinaryTreeNode*)node{
    switch ([self compare:node]) {
        case NSOrderedSame:
            return true;
            break;

        case NSOrderedAscending:
            if (self.rightChild == nil) {
                return false;
            }
            else{
                return [self.rightChild nodeExists:node];
            }
            break;
            
        case NSOrderedDescending:
            if (self.leftChild == nil) {
                return false;
            }
            else{
                return [self.leftChild nodeExists:node];
            }
            break;
            
        default:
            return false;
            break;
    }
}

- (NSComparisonResult)compare:(DSBinaryTreeNode*)other{
    return [self.data compare:other.data];
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

+ (id)nodeWithData:(id)data{
    
    return [[DSBinaryTreeNode alloc]initWithData:data];
    
}

+ (id)nodeWithData:(id)data LeftChild:(DSBinaryTreeNode*)leftChild RightChild:(DSBinaryTreeNode*)rightChild{
    
    return [[DSBinaryTreeNode alloc] initWithData:data LeftChild:leftChild RightChild:rightChild];
    
}

+ (DSBinaryTreeNode *)merge:(DSBinaryTreeNode*)node With:(DSBinaryTreeNode*)otherNode{
    if (node == nil) {
        return otherNode;
    }
    else if(otherNode == nil){
        return node;
    }else{
        //This currently adds nodes with equal data to the left child
        if ([node.data compare:otherNode.data] == NSOrderedAscending) {
            node.rightChild = [DSBinaryTreeNode merge:node.rightChild With:otherNode];
            return node;
        }
        else{
            node.leftChild = [DSBinaryTreeNode merge:node.leftChild With:otherNode];
            return node;
        }
    }
}

@end
