#import <Foundation/Foundation.h>
#import "SCProfile.h"

typedef void (^SCProfileSuccess)(SCProfile *profile);
typedef void (^SCProfileFail)(NSError *error);

@protocol SCProfileService <NSObject>

- (void)getProfileByUserId:(NSNumber *)identifier
                   success:(SCProfileSuccess)success
                      fail:(SCProfileFail)fail;

@end
