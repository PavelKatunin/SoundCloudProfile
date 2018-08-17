#import <Foundation/Foundation.h>
#import "SCTrack.h"

typedef enum : NSUInteger {
    kSCIncorrectTracksFormat,
    kSCIncorrectTracksDataFormat,
    kSCNoRequiredTracksFields
} SCTracksParserError;

//TODO: move to m
static NSString *const kTracksParserErrorDomain = @"track.parser.scoundCloud";

@protocol SCTracksParser <NSObject>

- (nullable NSArray<SCTrack *> *)tracksFromData:(NSData *)data error:(NSError **)error;
- (nullable SCTrack *)trackFromData:(NSData *)data error:(NSError **)error;

@end
