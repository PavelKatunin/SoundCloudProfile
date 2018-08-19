#import <Foundation/Foundation.h>
#import "SCTrack.h"

typedef enum : NSUInteger {
    kSCIncorrectTracksFormat,
    kSCIncorrectTracksDataFormat,
    kSCNoRequiredTracksFields
} SCTracksParserError;

extern NSString *const kTracksParserErrorDomain;

@protocol SCTracksParser <NSObject>

- (nullable NSArray<SCTrack *> *)tracksFromData:(NSData *)data error:(NSError **)error;
- (nullable SCTrack *)trackFromData:(NSData *)data error:(NSError **)error;

@end
