#import "SCServicesProvider.h"
#import <Foundation/Foundation.h>


@interface SCServices : NSObject <SCServicesProvider>

+ (SCServices *)shared;

@end
