#import <Foundation/Foundation.h>
#import "SCUserService.h"
#import "SCAsynchronousOperation.h"

@interface SCGetUserOperation : SCAsynchronousOperation

//input
@property (readonly, nonnull) NSNumber *userId;

//output
@property (readonly, nullable) SCUser *user;
@property (readonly, nullable) NSError *error;

- (instancetype)initWithUserService:(nonnull id <SCUserService>)userService
                             userId:(nonnull NSNumber *)userId;


@end
