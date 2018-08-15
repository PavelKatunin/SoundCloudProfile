#import <Foundation/Foundation.h>
#import "SCUser.h"

@interface SCProfile : NSObject

//required
@property (nonatomic, readonly, nonnull) SCUser *user;

//optional
@property (nonatomic, readonly, nullable) NSArray *tracks;

- (instancetype)initWithUser:(nonnull SCUser *)user
                      tracks:(nullable NSArray *)tracks;

@end
