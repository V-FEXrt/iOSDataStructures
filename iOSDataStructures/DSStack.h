//
//  DSStack.h
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/14/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A stack is First In Last Out (FILO), and the most recent object added to a stack will be the first object removed
 
 <pop> is called to get and remove the object at the top of the stack.
 <peak> is called to get, but not remove the object at the top of the stack.
 <push:> will add the given object to the top of the stack.
 
 */
@interface DSStack : NSObject
/**
 *  The total number of items in the stack
 */
@property (readonly) int count;

/**
 *  Initializes a stack instance
 *
 *  @return the stack instance
 */
- (id)init;

/**
 *  Returns the object at the top of the stack without removing it
 *
 *  @return The object at the top of the stack
 */
- (id)peak;

/**
 *  Returns and removes the object at the top of the stack
 *
 *  @return The object at the top of the stack
 */
- (id)pop;

/**
 *  Adds the object to the top of the stack
 *
 *  @param object Object to be added to the stack
 */
- (void)push:(id)object;

/**
 *  Returns a Boolean value that indicates whether the receiver and a given stack are equal.
 *
 *  @param other stack to be verified against
 *
 *  @return Returns true if the stacks are equal, otherwise false
 */
-(BOOL)isEqualToStack:(DSStack*)other;

/**
 *  Initializes a stack instance
 *
 *  @return the stack instance
 */
+ (id)stack;

@end
