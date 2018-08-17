#import <Foundation/Foundation.h>

@interface SCTrack : NSObject

//required
@property (nonatomic, readonly, nonnull) NSNumber *identifier;
@property (nonatomic, readonly, nonnull) NSString *title;

//optional
@property (nonatomic, readonly, nullable) NSNumber *duration;
@property (nonatomic, readonly, nullable) NSString *durationString;
@property (nonatomic, readonly, nullable) NSURL *artwork;
@property (nonatomic, readonly, nullable) NSString *genre;

- (instancetype)initWithIdentifier:(nonnull NSNumber *)identifier
                             title:(nonnull NSString *)title
                          duration:(nullable NSNumber *)duration
                           artwork:(nullable NSURL *)artwork
                             genre:(nullable NSString *)genre
                    durationString:(nullable NSString *)durationString;

@end
