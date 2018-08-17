#import <Foundation/Foundation.h>
#import "SCUserService.h"
#import "SCAsynchronousOperation.h"

@interface SCGetUserOperation : SCAsynchronousOperation

//input
@property (nonatomic, readonly, nonnull) NSNumber *userId;

//output
@property (nonatomic, readonly, nullable) SCUser *user;
@property (nonatomic, readonly, nullable) NSError *error;

- (instancetype)initWithUserService:(nonnull id <SCUserService>)userService
                             userId:(nonnull NSNumber *)userId;


@end
