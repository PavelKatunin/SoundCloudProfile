#import <Foundation/Foundation.h>

@protocol SCTracksService <NSObject>

- (void)getFavoritTracksForUser:(NSString *)userId
                        success:()
                           fail:()

@end
