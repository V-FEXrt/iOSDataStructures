//
//  DSTrie.h
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/23/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSTrie : NSObject
#warning DSTrie will be under heavy development in the next couple days, and is currently not tested, or documented
#warning unexpected results may occur. Full implementation, tests, and documentation can be expected in the coming days

- (id)init;
- (BOOL)contains:(NSString*)string;
- (void)add:(NSString*)string;

- (BOOL)isEqualToTrie:(DSTrie *)other;

+(id)trie;

@end
