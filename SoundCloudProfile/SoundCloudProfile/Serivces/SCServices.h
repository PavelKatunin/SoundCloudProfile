#import <Foundation/Foundation.h>
#import "SCServicesProvider.h"

@interface SCServices : NSObject <SCServicesProvider>

+ (SCServices *)shared;

@end
