//
//  NSMutableArray+QueueAdditions.m
//  ios.stage-task
//
//  Created by Anton Petrash on 21/05/2021.
//

#import "NSMutableArray+QueueAdditions.h"

@implementation NSMutableArray (QueueAdditions)


- (id) dequeue {
    if ([self count] == 0) return nil; // to avoid raising exception (Quinn)
    id headObject = [self objectAtIndex:0];
    if (headObject != nil) {
        [self removeObjectAtIndex:0];
    }
    return headObject;
}


- (void) enqueue:(id)anObject {
    [self addObject:anObject];
    
}

@end
