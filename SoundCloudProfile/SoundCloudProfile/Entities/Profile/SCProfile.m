#import "SCProfile.h"

@interface SCProfile ()

@property (nonatomic, copy, nonnull) SCUser *user;
@property (nonatomic, copy, nullable) NSArray *tracks;

@end

@implementation SCProfile

#pragma mark - Initialization

- (instancetype)initWithUser:(nonnull SCUser *)user tracks:(nullable NSArray *)tracks {
    self = [super init];
    if (self != nil) {
        self.user = user;
        self.tracks = tracks;
    }
    return self;
}

@end
