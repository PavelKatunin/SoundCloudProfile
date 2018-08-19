#import "SCTrack.h"

@interface SCTrack ()

//required
@property (nonatomic, copy, nonnull) NSNumber *identifier;
@property (nonatomic, copy, nonnull) NSString *title;

//optional
@property (nonatomic, copy, nullable) NSNumber *duration;
@property (nonatomic, copy, nullable) NSString *durationString;
@property (nonatomic, copy, nullable) NSURL *artwork;
@property (nonatomic, copy, nullable) NSString *genre;

//TODO: Implement mutable track
//@property (nonatomic, strong, nullable) NSData *artworkImageData;

@end

@implementation SCTrack

#pragma mark - Initialization

- (instancetype)initWithIdentifier:(nonnull NSNumber *)identifier
                             title:(nonnull NSString *)title
                          duration:(nullable NSNumber *)duration
                           artwork:(nullable NSURL *)artwork
                             genre:(nullable NSString *)genre
                    durationString:(nullable NSString *)durationString
                  artworkImageData:(nullable NSData *)artworkImageData {
    self = [super init];
    if (self != nil) {
        self.identifier = identifier;
        self.title = title;
        self.duration = duration;
        self.artwork = artwork;
        self.genre = genre;
        self.durationString = durationString;
        self.artworkImageData = artworkImageData;
    }
    return self;
}

@end
