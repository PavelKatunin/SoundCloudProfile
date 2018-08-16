#import <Foundation/Foundation.h>
#import "SCUser.h"

typedef void (^SCUserSuccess)(SCUser *user);
typedef void (^SCUserFail)(NSError *error);

@protocol SCUserService <NSObject>

- (void)getUserById:(NSNumber *)identifier
            success:(SCUserSuccess)success
               fail:(SCUserFail)fail;

@end
