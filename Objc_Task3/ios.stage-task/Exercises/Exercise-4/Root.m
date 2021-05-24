//
//  Root.m
//  ios.stage-task
//
//  Created by Anton Petrash on 24/05/2021.
//

#import "Root.h"

@implementation Root


- (instancetype) initWithValue:(NSNumber*) value{
    
    self = [super init];
    if (self) {
        _value = value;
    }
    return  self;
}

@end
