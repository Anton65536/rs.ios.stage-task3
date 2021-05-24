#import "LevelOrderTraversal.h"
#import "Root.h"




NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    NSMutableArray <Root*>*queue  = [NSMutableArray array];
    NSMutableDictionary *level = [NSMutableDictionary dictionary];
    NSMutableArray *result = [NSMutableArray array];
    if ([tree count] == 0) {
        return  [NSArray array];
    }
    
    for (int i = 0; i < [tree count]; i++) {
        Root *root = [[Root alloc] initWithValue:tree[i]];
        if ([queue count] == 0) {
            if (![root.value isKindOfClass:[NSNull class]] ) {
                [queue addObject:root];
            }
        }else{
            for (int j = [queue count] - 1 ; j > -1; j--) {
                if ([[queue[j] left] isKindOfClass:[NSNull class]] != YES && [[queue[j] left] isKindOfClass:[NSNumber class]] != YES) {
                    queue[j].left = root.value;
                    break;
                }else if(![[queue[j] right] isKindOfClass:[NSNull class]] && ![[queue[j] right] isKindOfClass:[NSNumber class]]){
                    queue[j].right = root.value;
                    break;
                }
            }
            if (![root.value isKindOfClass:[NSNull class]]) {
                [queue addObject:root];
            }
        }
    }
    if ([queue count] == 0) {
        return  @[];
    }
    level[@(0)] = [@[[queue firstObject]] mutableCopy];
    NSNumber* index = @(0);
    while ([queue count] > 0) {
        for (int i = 0; i < [level[index] count]; i++) {
            Root * root = level[index][i];
            if (!level[@(index.intValue + 1)]) {
                level[@(index.intValue + 1)] = [@[] mutableCopy];
            }
        for (int j = 0 ; j < queue.count; j++) {
            if ([root.left isKindOfClass:NSNumber.class]) {
                if (queue[j].value == root.left) {
                    [level[@(index.intValue + 1)] addObject:queue[j]];
                }
            }
            if ([root.right isKindOfClass:NSNumber.class]) {
                if (queue[j].value == root.right) {
                    [level[@(index.intValue + 1)] addObject:queue[j]];
                }
            }
        }
    
        [queue removeObject:root];
    }
    index = @(index.intValue + 1);
    }
    
    for (int k = 0; k < [level count]; k++) {
        NSMutableArray* levels = [@[] mutableCopy];
        for (Root *root in level[@(k)]) {
            if ([root.value isKindOfClass:NSNumber.class]) {
                [levels addObject:root.value];
            }
        }
        if ([levels count] > 0) {
            [result addObject:levels];
        }
    }
    
    return [result copy];
}
