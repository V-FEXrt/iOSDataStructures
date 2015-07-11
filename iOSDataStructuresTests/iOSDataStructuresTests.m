//
//  iOSDataStructuresTests.m
//  iOSDataStructuresTests
//
//  Created by V-FEXrt on 7/11/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "DSBinaryTreeNode.h"

@interface iOSDataStructuresTests : XCTestCase

@end

@implementation iOSDataStructuresTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDSBinaryTreeNode {
    
    DSBinaryTreeNode *node;
    DSBinaryTreeNode *node2;
    DSBinaryTreeNode *node3;
    DSBinaryTreeNode *node4;
    
    
    node = [DSBinaryTreeNode node];
    
    XCTAssertNil(node.data, "Verify the data property is nil");
    XCTAssertNil(node.leftChild, "Verify the left child is nil");
    XCTAssertNil(node.rightChild, "Verify the right child is nil");
    
    
    NSString* data = @"Test Data";
    node2 = [DSBinaryTreeNode nodeWithData:data];
    
    XCTAssertEqual(node2.data, data, "Verify the data property is equal to the specified data");
    XCTAssertNil(node2.leftChild, "Verify the left child is nil");
    XCTAssertNil(node2.rightChild, "Verify the right child is nil");
    
    
    NSNumber* data2 = @123;
    node3 = [DSBinaryTreeNode nodeWithData:data2];
    
    XCTAssertEqual(node3.data, data2, "Verify the data property is equal to the specified data");
    XCTAssertNil(node3.leftChild, "Verify the left child is nil");
    XCTAssertNil(node3.rightChild, "Verify the right child is nil");
    
    
    NSDictionary *data3 = @ { @"key" : @"data" };
    node4 = [DSBinaryTreeNode nodeWithData:data3 LeftChild:node2 RightChild:node3];
    
    XCTAssertEqual(node4.data, data3, "Verify the data property is equal to the specified data");
    XCTAssertEqual(node4.leftChild, node2, "Verify nodes are equal as passed");
    XCTAssertEqual(node4.rightChild, node3, "Verify nodes are equal as passed");
    
}


@end
