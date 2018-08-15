#import <Foundation/Foundation.h>
#import "SCTrack.h"

@protocol SCTracksParser <NSObject>

- (nullable NSArray<SCTrack *> *)tracksFromData:(NSData *)data error:(NSError **)error;

@end
