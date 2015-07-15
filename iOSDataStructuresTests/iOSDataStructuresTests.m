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
#import "DSLinkedListCell.h"
#import "DSStack.h"

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

-(void)testDSStack{
    DSStack *stack = [DSStack stack];
    XCTAssertEqual(stack.count, 0, "Verify the count is at 0 when initialized");
    XCTAssertNil([stack peak], "Verify peaking with no data returns nil");
    XCTAssertNil([stack pop], "Verify poping with no data return nil");
    
    NSString *data0 = @"Some Data";
    NSString *data1 = @"Other Data";
    NSString *data2 = @"YADS";
    NSNumber *data3 = @1;
    
    [stack push:data0];
    [stack push:data1];
    [stack push:data2];
    [stack push:data3];
    XCTAssertEqual(stack.count, 4, "Verify the count matches the number of objects");
    XCTAssertEqual([stack pop], data3, "Verify poping returns the last item added");
    XCTAssertEqual(stack.count, 3, "Verify the count is one lower");
    XCTAssertEqual([stack peak], data2, "Verify peaking return the next item");
    XCTAssertEqual(stack.count, 3, "Verify the count is the same");
    XCTAssertEqual([stack pop], data2, "Verify peaking doesn't remove the object");
    XCTAssertNotEqual([stack peak], data2, "Verify poping moves to the next item");
    XCTAssertEqual([stack pop], data1, "Verify correct object retrieval");
    XCTAssertEqual([stack pop], data0, "Verify correct object retrieval");
    XCTAssertEqual(stack.count, 0, "Verify the stack is now empty");
    XCTAssertNil([stack peak], "Verify peaking with no data returns nil");
    XCTAssertNil([stack pop], "Verify poping with no data return nil");
    
    stack = [DSStack stack];
    DSStack *stack2 = [DSStack stack];
    [stack push:data0];
    [stack push:data2];
    [stack2 push:data0];
    [stack2 push:data2];
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(stack2, stack, "Verify equality functinality");
    XCTAssertFalse(stack2 == stack);
    
    /* The objects are equal in property, therefore equal at the data level                 */
    XCTAssertTrue([stack2 isEqualToStack:stack], "Verify equality functinality");
    XCTAssertTrue([stack2 isEqual:stack], "Verify equality functinality");
    
    stack = [DSStack stack];
    stack2 = [DSStack stack];
    [stack push:data0];
    [stack push:data2];

    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(stack2, stack, "Verify equality functinality");
    XCTAssertFalse(stack2 == stack);
    
    /* The objects are  not equal in property, therefore not equal at the data level                 */
    XCTAssertFalse([stack2 isEqualToStack:stack], "Verify equality functinality");
    XCTAssertFalse([stack2 isEqual:stack], "Verify equality functinality");
}

-(void)testDSLinkedListCell{
    DSLinkedListCell *cell;
    DSLinkedListCell *cell2;
    DSLinkedListCell *cell3;
    DSLinkedListCell *cell4;
    DSLinkedListCell *cell5;
    
    cell = [DSLinkedListCell cell];
    XCTAssertNil(cell.data, "Verify data property is nil");
    XCTAssertNil(cell.next, "Verify next property is nil");
    
    UIView *data0 = [[UIView alloc]init];
    cell2 = [DSLinkedListCell cellWithData:data0 Next:nil];
    XCTAssertEqual(data0, cell2.data, "Verify the data property is equal to the specified data");
    XCTAssertNil(cell2.next, "Verify next property is nil");
    
    NSString *data1 = @"Test Data";
    cell2 = [DSLinkedListCell cellWithData:data1 Next:nil];
    XCTAssertEqual(data1, cell2.data, "Verify the data property is equal to the specified data");
    XCTAssertNil(cell2.next, "Verify next property is nil");
    
    NSString *data2 = @"New data";
    cell3 = [DSLinkedListCell cellWithData:data2 Next:cell2];
    XCTAssertEqual(cell3.data, data2, "Verify the data property is equal to the specified data");
    XCTAssertEqual(cell3.next, cell2, "Verify the next property is equal to the specified data");
    
    NSString *data3 = @"Another data set";
    cell2.next = cell;
    cell.data = data3;
    XCTAssertEqual(cell2.next, cell, "Verify the properties get properly reassigned");
    XCTAssertEqual(cell.data, data3, "Verify the properties get properly reassigned");
    
    cell4 = cell3;
    while (cell4.next != nil) {
        XCTAssertNotNil(cell4.data, "Verify that the list can be iterated though, and that values were assigned");
        XCTAssertNotNil(cell4.next, "Verify that the list can be itereated though");
        cell4 = cell4.next;
    }
    
    cell5 = [DSLinkedListCell cellWithData:data2 Next:cell2];
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(cell5, cell3, "Verify equality functinality");
    XCTAssertFalse(cell5 == cell3);
    
    /* The objects are equal in property, therefore equal at the data level                 */
    XCTAssertTrue([cell5 isEqualToLinkedListCell:cell3], "Verify equality functinality");
    XCTAssertTrue([cell5 isEqual:cell3], "Verify equality functinality");
    
    
    cell5 = [DSLinkedListCell cellWithData:data2 Next:cell2];
    cell3 = [DSLinkedListCell cell];
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(cell5, cell3, "Verify equality functinality");
    XCTAssertFalse(cell5 == cell3);
    
    /* The objects are not equal in property, therefore not equal at the data level                 */
    XCTAssertFalse([cell5 isEqualToLinkedListCell:cell3], "Verify equality functinality");
    XCTAssertFalse([cell5 isEqual:cell3], "Verify equality functinality");
    
    
    
}

- (void)testDSBinaryTreeNode {
    
    DSBinaryTreeNode *node;
    DSBinaryTreeNode *node2;
    DSBinaryTreeNode *node3;
    DSBinaryTreeNode *node4;
    DSBinaryTreeNode *node5;
    
    
    node = [DSBinaryTreeNode node];
    
    XCTAssertNil(node.data, "Verify the data property is nil");
    XCTAssertNil(node.leftChild, "Verify the left child is nil");
    XCTAssertNil(node.rightChild, "Verify the right child is nil");
    

    UIView* data0 = [[UIView alloc]init];
    node2 = [DSBinaryTreeNode nodeWithData:data0];
    
    XCTAssertEqual(node2.data, data0, "Verify the data property is equal to the specified data");
    XCTAssertNil(node2.leftChild, "Verify the left child is nil");
    XCTAssertNil(node2.rightChild, "Verify the right child is nil");
    
    NSString* data1 = @"Test Data";
    node2 = [DSBinaryTreeNode nodeWithData:data1];
    
    XCTAssertEqual(node2.data, data1, "Verify the data property is equal to the specified data");
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
    
    node5 = [DSBinaryTreeNode nodeWithData:data3 LeftChild:node2 RightChild:node3];
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(node5, node4, "Verify equality functinality");
    XCTAssertFalse(node5 == node4, "Verify equality functinality");
    
    /* The objects are equal in property, therefore equal at the data level                 */
    XCTAssertTrue([node5 isEqualToBinaryTreeNode:node4], "Verify equality functinality");
    XCTAssertTrue([node5 isEqual:node4], "Verify equality functinality");
    
    node5 = [DSBinaryTreeNode nodeWithData:data3 LeftChild:node2 RightChild:node3];
    node4 = [DSBinaryTreeNode node];
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(node5, node4, "Verify equality functinality");
    XCTAssertFalse(node5 == node4, "Verify equality functinality");
    
    /* The objects are not equal in property, therefore not equal at the data level                 */
    XCTAssertFalse([node5 isEqualToBinaryTreeNode:node4], "Verify equality functinality");
    XCTAssertFalse([node5 isEqual:node4], "Verify equality functinality");
    
    
}


@end
