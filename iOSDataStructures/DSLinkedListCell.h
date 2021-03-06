//
//  DSLinkedListCell.h
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/12/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  A linked list has a <data> property to represent the value for the current cell, and a <next> property to access the next cell
 */
@interface DSLinkedListCell : NSObject

/**
 *  the data stored in the current cell
 */
@property (nonatomic, readwrite, retain) id data;

/**
 *  A reference to the next linked list cell
 */
@property (nonatomic, readwrite, retain) DSLinkedListCell *next;

/**
 *  Initialzies a cell with nil for the data and next properites
 *
 *  @return The linked list cell
 */
- (id)init;

/**
 *  Initializes a cell
 *
 *  @param data The value for the data property
 *  @param next the value for the next property
 *
 *  @return The linked list cell
 */
- (id)initWithData: (id)data Next: (DSLinkedListCell *)next;

/**
 *  Returns a Boolean value that indicates whether the receiver and a given LinkedListCell are equal.
 *
 *  @param other cell to be verified against
 *
 *  @return Returns true if the cells are equal, otherwise false
 */
-(BOOL)isEqualToLinkedListCell:(DSLinkedListCell*)other;

/**
 *  Initialzies a cell with nil for the data and next properites
 *
 *  @return The linked list cell
 */
+ (id)cell;

/**
 *  Initializes a cell
 *
 *  @param data The value for the data property
 *  @param next the value for the next property
 *
 *  @return The linked list cell
 */
+ (id)cellWithData: (id)data Next: (DSLinkedListCell *)next;

@end
