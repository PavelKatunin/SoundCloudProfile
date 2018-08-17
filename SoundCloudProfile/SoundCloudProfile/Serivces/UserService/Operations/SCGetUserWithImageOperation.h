#import <Foundation/Foundation.h>
#import "SCAsynchronousOperation.h"
#import "SCUser.h"

@interface SCGetUserWithImageOperation : SCAsynchronousOperation

//input
@property (nonatomic, readonly, nonnull) NSNumber *userId;

//output
@property (nonatomic, readonly, nullable) SCUser *user;
@property (nonatomic, readonly, nullable) NSData *imageData;
@property (nonatomic, readonly, nullable) NSError *error;

@end
