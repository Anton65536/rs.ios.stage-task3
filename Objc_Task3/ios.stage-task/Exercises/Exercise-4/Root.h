//
//  Root.h
//  ios.stage-task
//
//  Created by Anton Petrash on 24/05/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Root : NSObject

@property(nonatomic, nullable) Root* left;
@property(nonatomic, nullable) Root* right;
@property(nonatomic) NSNumber* value;

- (instancetype) initWithValue:(NSNumber*) value;

@end

NS_ASSUME_NONNULL_END
