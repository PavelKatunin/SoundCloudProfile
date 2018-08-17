#import "SCProfile.h"

@interface SCProfile ()

//required
@property (nonatomic, strong, nonnull) SCUser *user;

//optional
@property (nonatomic, strong, nullable) NSArray *tracks;
@property (nonatomic, strong, nullable) NSData *avtarImageData;

@end

@implementation SCProfile

#pragma mark - Initialization

- (instancetype)initWithUser:(nonnull SCUser *)user
                      tracks:(nullable NSArray *)tracks
             avatarImageData:(nullable NSData *)imageData {
    self = [super init];
    if (self != nil) {
        self.user = user;
        self.tracks = tracks;
        self.avtarImageData = imageData;
    }
    return self;
}

@end
