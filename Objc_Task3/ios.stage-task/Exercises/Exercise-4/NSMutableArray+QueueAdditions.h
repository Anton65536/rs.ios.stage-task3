//
//  NSMutableArray+QueueAdditions.h
//  ios.stage-task
//
//  Created by Anton Petrash on 21/05/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (QueueAdditions)

- (id) dequeue;
- (void) enqueue:(id)obj;

@end

NS_ASSUME_NONNULL_END
