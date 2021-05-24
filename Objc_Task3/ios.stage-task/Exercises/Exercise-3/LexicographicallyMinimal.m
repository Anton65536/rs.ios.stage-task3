#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal



-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *mString1 = [NSMutableString stringWithString:string1];
    NSMutableString *mString2 = [NSMutableString stringWithString:string2];
    NSMutableString *resultString = [NSMutableString string];
    do {
      
        if ([mString1 length] == 0) {
            [resultString appendString:mString2];
            break;
        } else if ([mString2 length] == 0){
            [resultString appendString:mString1];
            break;
        }
        
        NSString* f1 = [mString1 substringToIndex:1];
        NSString* f2 = [mString2 substringToIndex:1];
        
            NSComparisonResult compRes = [f1 compare:f2 options:NSLiteralSearch ];
                if (compRes ==  NSOrderedAscending || compRes == NSOrderedSame) {
        
                    [resultString insertString:[mString1 substringToIndex:1] atIndex:[resultString length]];
                    [mString1 deleteCharactersInRange:NSMakeRange(0, 1)];
                    
                } else if(compRes ==  NSOrderedDescending ){
 
                    [resultString insertString:[mString2 substringToIndex:1] atIndex:[resultString length]];
                     [mString2 deleteCharactersInRange:NSMakeRange(0, 1)];
                    
                }
        
      
        
    } while ([mString1 length]   || [mString2 length]);
    
    

    
    return [resultString copy];
}

@end



