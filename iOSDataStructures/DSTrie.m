//
//  DSTrie.m
//  iOSDataStructures
//
//  Created by V-FEXrt on 7/23/15.
//  Copyright (c) 2015 V-FEXrt. All rights reserved.
//

#import "DSTrie.h"

@interface DSTrie()
@property BOOL isEnd;
@property (nonatomic, strong)NSMutableArray *children;
@end

@implementation DSTrie

- (id)init{
    
    if( (self=[super init]) ) {
        self.isEnd = false;
        
        self.children = [[NSMutableArray alloc]init];
        
        //add 26 empty objects
        for (int i = 0; i < 26; i++) {
            [self.children addObject:[NSNull null]];
        }
    }
    return self;
    
}

-(BOOL)contains:(NSString*)string{
    if([string isEqualToString:@""]){
        return self.isEnd;
    }
    else if ([string characterAtIndex:0] > 'z' || [string characterAtIndex:0] < 'a'){
        return false;
    }
    else if(self.children[[string characterAtIndex:0] - 'a'] == [NSNull null]){
        return false;
    }
    else{
        return [self.children[[string characterAtIndex:0] - 'a'] contains:[string substringFromIndex:1]];
    }
}

-(void)add:(NSString*)string{
    if ([string isEqualToString: @""])
    {
        self.isEnd = true;
    }
    else if ([string characterAtIndex:0] > 'z' | [string characterAtIndex:0] < 'a')
    {
        [NSException raise:@"Invalid Parameter Execption" format:@"The strings added to the trie can currently only be alphabetical chars"];
    }
    else
    {
        if (self.children[[string characterAtIndex:0] - 'a'] == [NSNull null])
        {
            self.children[[string characterAtIndex:0] - 'a'] = [DSTrie trie];
        }
        
        [self.children[[string characterAtIndex:0] - 'a'] add:[string substringFromIndex:1]];
    }
}

+(id)trie{
    return [[DSTrie alloc]init];
}

@end
