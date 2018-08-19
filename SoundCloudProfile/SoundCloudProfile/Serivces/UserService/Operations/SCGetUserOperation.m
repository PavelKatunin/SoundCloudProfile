#import "SCGetUserOperation.h"

@interface SCGetUserOperation ()

@property (strong, nonnull) id <SCUserService> userService;
@property (copy, nonnull) NSNumber *userId;
@property (strong, nullable) SCUser *user;
@property (strong, nullable) NSError *error;

@end

@implementation SCGetUserOperation

#pragma mark - Initialization

- (instancetype)initWithUserService:(id <SCUserService>)userService
                             userId:(NSNumber *)userId {
    self = [super init];
    if (self != nil) {
        self.userService = userService;
        self.userId = userId;
    }
    return self;
}

#pragma mark - Async task

- (void)execute {
    [self.userService getUserById:self.userId
                          success:^(SCUser *user) {
                              self.user = user;
                              NSLog(@"%@", self.user.fullName);
                              [self completeOperation];
                          } fail:^(NSError *error) {
                              self.error = error;
                              NSLog(@"%@", error);
                              [self completeOperation];
                          }];
}

@end
