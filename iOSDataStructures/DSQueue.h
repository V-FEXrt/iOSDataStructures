//
//  DSQueue.h
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/15/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A queue is First In First Out (FIFO), and the first object added will be the first removed
 
 <dequeue> is called to get and remove the object at the front of the queue.
 <peak> is called to get, but not remove the object at the front of the queue.
 <enqueue:> will added the given object to the end of the queue.
 
 */
@interface DSQueue : NSObject
/**
 *  The total number of items in the queue
 */
@property (readonly) int count;

/**
 *  Initializes a queue instance
 *
 *  @return the queue instance
 */
- (id)init;

/**
 *  Returns the object at the front of the queue without removing it
 *
 *  @return The object at the front of the queue
 */
- (id)peak;

/**
 *  Returns and removes the object at the front of the queue
 *
 *  @return The object at the front of the queue
 */
- (id)dequeue;

/**
 *  Adds the object to the back of the queue
 *
 *  @param object Object to be added to the queue
 */
- (void)enqueue:(id)object;

/**
 *  Returns a Boolean value that indicates whether the receiver and a given queue are equal.
 *
 *  @param other queue to be verified against
 *
 *  @return Returns true if the queue are equal, otherwise false
 */
-(BOOL)isEqualToQueue:(DSQueue*)other;

/**
 *  Initializes a queue instance
 *
 *  @return the queue instance
 */
+ (id)queue;

@end
