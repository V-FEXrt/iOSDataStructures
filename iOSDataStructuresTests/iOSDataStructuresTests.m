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
#import "DSQueue.h"

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
    
    [stack push:@"Test"];
    [stack push:@"going"];
    [stack push:@"past"];
    [stack push:@"the initial"];
    [stack push:@"array size of 5"];
    [stack push:data0];
    [stack push:data1];
    [stack push:data2];
    [stack push:data3];
    
    XCTAssertEqual(stack.count, 9, "Verify the count matches the number of objects");
    XCTAssertEqual([stack pop], data3, "Verify poping returns the last item added");
    XCTAssertEqual(stack.count, 8, "Verify the count is one lower");
    XCTAssertEqual([stack peak], data2, "Verify peaking return the next item");
    XCTAssertEqual(stack.count, 8, "Verify the count is the same");
    XCTAssertEqual([stack pop], data2, "Verify peaking doesn't remove the object");
    XCTAssertNotEqual([stack peak], data2, "Verify poping moves to the next item");
    XCTAssertEqual([stack pop], data1, "Verify correct object retrieval");
    XCTAssertEqual([stack pop], data0, "Verify correct object retrieval");
    
    //Empty the stack
    [stack pop];
    [stack pop];
    [stack pop];
    [stack pop];
    XCTAssertEqual([stack pop], @"Test", "Verify the last return item was the first entered");
    
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
    XCTAssertNotEqual(stack2, stack, "Verify equality functionality");
    XCTAssertFalse(stack2 == stack);
    
    /* The objects are equal in property, therefore equal at the data level                 */
    XCTAssertTrue([stack2 isEqualToStack:stack], "Verify equality functionality");
    XCTAssertTrue([stack2 isEqual:stack], "Verify equality functionality");
    
    stack = [DSStack stack];
    stack2 = [DSStack stack];
    [stack push:data0];
    [stack push:data2];

    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(stack2, stack, "Verify equality functionality");
    XCTAssertFalse(stack2 == stack);
    
    /* The objects are  not equal in property, therefore not equal at the data level                 */
    XCTAssertFalse([stack2 isEqualToStack:stack], "Verify equality functionality");
    XCTAssertFalse([stack2 isEqual:stack], "Verify equality functionality");
}

-(void)testDSQueue{
    DSQueue *queue = [DSQueue queue];
    XCTAssertEqual(queue.count, 0, "Verify the count is at 0 when initialized");
    XCTAssertNil([queue peak], "Verify peaking with no data returns nil");
    XCTAssertNil([queue dequeue], "Verify dequeue with no data returns nil");
    
    NSString *data0 = @"Some Data";
    NSString *data1 = @"Other Data";
    NSString *data2 = @"YADS";
    NSNumber *data3 = @1;
    
    [queue enqueue:data0];
    [queue enqueue:data1];
    [queue enqueue:data2];
    [queue enqueue:data3];
    [queue enqueue:@"Test"];
    [queue enqueue:@"going"];
    [queue enqueue:@"past"];
    [queue enqueue:@"the initial"];
    [queue enqueue:@"array size of 5"];
    
    XCTAssertEqual(queue.count, 9, "Verify the count matches the number of objects");
    XCTAssertEqual([queue dequeue], data0, "Verify dequeue returns the last item added");
    XCTAssertEqual(queue.count, 8, "Verify the count is one lower");
    XCTAssertEqual([queue peak], data1, "Verify peaking return the next item");
    XCTAssertEqual(queue.count, 8, "Verify the count is the same");
    XCTAssertEqual([queue dequeue], data1, "Verify peaking doesn't remove the object");
    XCTAssertNotEqual([queue peak], data1, "Verify dequeue moves to the next item");
    XCTAssertEqual([queue dequeue], data2, "Verify correct object retrieval");
    XCTAssertEqual([queue dequeue], data3, "Verify correct object retrieval");
    
    //Empty out the queue
    [queue dequeue];
    [queue dequeue];
    [queue dequeue];
    [queue dequeue];
    XCTAssertEqual([queue dequeue], @"array size of 5", "Verify the last item was the last item added");
    
    XCTAssertEqual(queue.count, 0, "Verify the queue is now empty");
    XCTAssertNil([queue peak], "Verify peaking with no data returns nil");
    XCTAssertNil([queue dequeue], "Verify dequeue with no data return nil");
    
    queue = [DSQueue queue];
    DSQueue *queue2 = [DSQueue queue];
    [queue enqueue:data0];
    [queue enqueue:data2];
    [queue2 enqueue:data0];
    [queue2 enqueue:data2];
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(queue2, queue, "Verify equality functionality");
    XCTAssertFalse(queue2 == queue);
    
    /* The objects are equal in property, therefore equal at the data level                 */
    XCTAssertTrue([queue2 isEqualToQueue:queue], "Verify equality functionality");
    XCTAssertTrue([queue2 isEqual:queue], "Verify equality functionality");
    
    queue = [DSQueue queue];
    queue2 = [DSQueue queue];
    [queue enqueue:data0];
    [queue enqueue:data2];
    
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(queue2, queue, "Verify equality functionality");
    XCTAssertFalse(queue2 == queue);
    
    /* The objects are  not equal in property, therefore not equal at the data level                 */
    XCTAssertFalse([queue2 isEqualToQueue:queue], "Verify equality functionality");
    XCTAssertFalse([queue2 isEqual:queue], "Verify equality functionality");
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
    XCTAssertNotEqual(cell5, cell3, "Verify equality functionality");
    XCTAssertFalse(cell5 == cell3);
    
    /* The objects are equal in property, therefore equal at the data level                 */
    XCTAssertTrue([cell5 isEqualToLinkedListCell:cell3], "Verify equality functionality");
    XCTAssertTrue([cell5 isEqual:cell3], "Verify equality functionality");
    
    
    cell5 = [DSLinkedListCell cellWithData:data2 Next:cell2];
    cell3 = [DSLinkedListCell cell];
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(cell5, cell3, "Verify equality functionality");
    XCTAssertFalse(cell5 == cell3);
    
    /* The objects are not equal in property, therefore not equal at the data level                 */
    XCTAssertFalse([cell5 isEqualToLinkedListCell:cell3], "Verify equality functionality");
    XCTAssertFalse([cell5 isEqual:cell3], "Verify equality functionality");
    
    
    
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
    XCTAssertNotEqual(node5, node4, "Verify equality functionality");
    XCTAssertFalse(node5 == node4, "Verify equality functionality");
    
    /* The objects are equal in property, therefore equal at the data level                 */
    XCTAssertTrue([node5 isEqualToBinaryTreeNode:node4], "Verify equality functionality");
    XCTAssertTrue([node5 isEqual:node4], "Verify equality functionality");
    
    node5 = [DSBinaryTreeNode nodeWithData:data3 LeftChild:node2 RightChild:node3];
    node4 = [DSBinaryTreeNode node];
    /* The objects are allocated differently therefore should be not equal at object level  */
    XCTAssertNotEqual(node5, node4, "Verify equality functionality");
    XCTAssertFalse(node5 == node4, "Verify equality functionality");
    
    /* The objects are not equal in property, therefore not equal at the data level                 */
    XCTAssertFalse([node5 isEqualToBinaryTreeNode:node4], "Verify equality functionality");
    XCTAssertFalse([node5 isEqual:node4], "Verify equality functionality");
    
    /* Test the add node function  */
    node = [DSBinaryTreeNode nodeWithData:@"S"];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"A"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"B"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"U"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"T"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"Z"]];
    XCTAssertEqual(node.leftChild.data, @"A", "Verify 'A' was added in correct location");
    XCTAssertTrue([node.leftChild.rightChild.data isEqualToString: @"B"], "Verify 'B' was added correct location");
    XCTAssertTrue([node.rightChild.data isEqualToString: @"U"], "Verify 'U' was added correct location");
    XCTAssertTrue([node.rightChild.leftChild.data isEqualToString: @"T"], "Verify 'T' was added correct location");
    XCTAssertTrue([node.rightChild.rightChild.data isEqualToString: @"Z"], "Verify 'Z' was added correct location");

    XCTAssertThrows([node addNode:[DSBinaryTreeNode nodeWithData:nil LeftChild:node2 RightChild:node3]], "Verify an exception is throw if data is nil, but children are not");
    
    /* Test the removeNodeAndChildren function  */
    node = [DSBinaryTreeNode nodeWithData:@"S"];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"A"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"B"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"U"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"T"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"Z"]];
    
    [node removeNodeAndChildren:[DSBinaryTreeNode nodeWithData:@"B"]];
    XCTAssertNil(node.leftChild.rightChild, "Verify the 'B' node no longer exists");
    
    [node removeNodeAndChildren:[DSBinaryTreeNode nodeWithData:@"U"]];
    XCTAssertNil(node.rightChild, "Verify the 'U' node no longer exists");
    XCTAssertFalse([node nodeExists:[DSBinaryTreeNode nodeWithData:@"T"]], "Verify the 'T' node was also removed" );
    XCTAssertFalse([node nodeExists:[DSBinaryTreeNode nodeWithData:@"Z"]], "Verify the 'Z' node was also removed" );
    
    node = [DSBinaryTreeNode node];
    XCTAssertThrows([node removeNodeAndChildren:node], "Verify removing self throws an execption");
    
    node = [DSBinaryTreeNode nodeWithData:@"A"];
    XCTAssertNoThrow([node removeNodeAndChildren:[DSBinaryTreeNode nodeWithData:@"B"]], "Verify removing a non existant node is handled");
    
    
    /* Test the removeNode function */
    node = [DSBinaryTreeNode nodeWithData:@"S"];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"A"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"B"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"U"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"T"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"Z"]];
    
    [node removeNode:[DSBinaryTreeNode nodeWithData:@"A"]];
    XCTAssertFalse([node.leftChild.data isEqualToString:@"A"], "Verify that the left child is no longer 'A'");
    XCTAssertTrue([node.leftChild.data isEqualToString:@"B"], "Verify that the left child is now 'B'");
    
    [node removeNode:[DSBinaryTreeNode nodeWithData:@"U"]];
    XCTAssertFalse([node.rightChild.data isEqualToString:@"U"], "Verify that the right child is no longer 'U'");
    XCTAssertTrue([node.rightChild.data isEqualToString:@"T"], "Verify that the right child is now 'T'");
    XCTAssertTrue([node.rightChild.rightChild.data isEqualToString:@"Z"], "Verify 'Z' was added correct location");
    
    node = [DSBinaryTreeNode node];
    XCTAssertThrows([node removeNode:node], "Verify removing self throws an execption");
    
    node = [DSBinaryTreeNode nodeWithData:@"A"];
    XCTAssertNoThrow([node removeNode:[DSBinaryTreeNode nodeWithData:@"B"]], "Verify removing a non existant node is handled");
    
    /* Test the merge function      */
    node = [DSBinaryTreeNode nodeWithData:@"T"];
    node3 = [DSBinaryTreeNode merge:node With:nil];
    XCTAssertTrue([node.data isEqualToString:node3.data], "Verify handles nil params");
    
    node = [DSBinaryTreeNode nodeWithData:@"T"];
    node3 = [DSBinaryTreeNode merge:nil With:node];
    XCTAssertTrue([node.data isEqualToString:node3.data], "Verify handles nil params");
    
    node = [DSBinaryTreeNode node];
    node2 = [DSBinaryTreeNode node];
    
    [node addNode:[DSBinaryTreeNode nodeWithData:@"A"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"F"]];
    [node addNode:[DSBinaryTreeNode nodeWithData:@"O"]];
    
    [node2 addNode:[DSBinaryTreeNode nodeWithData:@"D"]];
    [node2 addNode:[DSBinaryTreeNode nodeWithData:@"I"]];
    [node2 addNode:[DSBinaryTreeNode nodeWithData:@"T"]];
    [node2 addNode:[DSBinaryTreeNode nodeWithData:@"Z"]];
    
    node3 = [DSBinaryTreeNode merge:node With:node2];
    XCTAssertTrue([node.data isEqualToString:@"A"], "Verify that 'A' was added in correct location");
    XCTAssertTrue([node.rightChild.leftChild.data isEqualToString:@"D"], "Verify that 'D' was added in correct location");
    XCTAssertTrue([node.rightChild.data isEqualToString:@"F"], "Verify that 'F' was added in correct location");
    XCTAssertTrue([node.rightChild.rightChild.data isEqualToString:@"O"], "Verify that 'O' was added in correct location");
    XCTAssertTrue([node.rightChild.leftChild.rightChild.data isEqualToString:@"I"], "Verify that 'I' was added in correct location");
    XCTAssertTrue([node.rightChild.leftChild.rightChild.rightChild.data isEqualToString:@"T"], "Verify that 'T' was added in correct location");
    XCTAssertTrue([node.rightChild.leftChild.rightChild.rightChild.rightChild.data isEqualToString:@"Z"], "Verify that 'Z' was added in correct location");
    
    /* Test the exists function     */
    
    node = [DSBinaryTreeNode nodeWithData:@"A"];
    XCTAssertTrue([node nodeExists:node], "Verify returns true when passed itself");
    XCTAssertFalse([node nodeExists:[DSBinaryTreeNode node]], "Verify handles nil node");
    [node addNode:[DSBinaryTreeNode node]];
    XCTAssertTrue([node nodeExists:[DSBinaryTreeNode node]], "Verify handles nil node");
    [node addNode:[DSBinaryTreeNode nodeWithData:@"J"]];
    XCTAssertTrue([node nodeExists:[DSBinaryTreeNode nodeWithData:@"J"]], "Verify true for node that exists");
    XCTAssertFalse([node nodeExists:[DSBinaryTreeNode nodeWithData:@"Q"]], "Verify false for node that doesn't exist");
    
    
    /* Test the compare function    */
    node = [DSBinaryTreeNode nodeWithData:@"A"];
    node2 = [DSBinaryTreeNode nodeWithData:@"B"];
    node3 = [DSBinaryTreeNode nodeWithData:@"C"];
    
    XCTAssertTrue([node compare:node2] == NSOrderedAscending, "Verify true that A->B is ascending");
    XCTAssertTrue([node3 compare:node2] == NSOrderedDescending, "Verify true that C->B is descending");
    XCTAssertTrue([node2 compare:node2] == NSOrderedSame, "Verify true that B->B is the same");
    
}


@end
