#import "SCTracksJSONParser.h"

static NSString *const kIdentifierKey = @"id";
static NSString *const kTitleKey = @"title";
static NSString *const kDurationKey = @"duration";
static NSString *const kArtworkKey = @"artwork";
static NSString *const kGenreKey = @"genre";

@implementation SCTracksJSONParser

- (nullable NSArray<SCTrack *> *)tracksFromData:(NSData *)data error:(NSError **)error {
    return nil;
}

- (nullable SCTrack *)trackFromData:(NSData *)data error:(NSError **)error {
    SCTrack *track = nil;
    NSError *jsonParsingError = nil;
    id trackObject = [NSJSONSerialization JSONObjectWithData:data
                                                    options:0
                                                      error:&jsonParsingError];
    
    if (trackObject != nil && jsonParsingError == nil) {
        if ([trackObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *trackDictionary = trackObject;
            track = [self trackFromDictionary:trackDictionary error:error];
        }
        else {
            *error = [NSError errorWithDomain:kTracksParserErrorDomain
                                         code:kSCIncorrectTracksFormat
                                     userInfo:nil];
        }
    }
    else {
        NSLog(@"Parsing error: %@", jsonParsingError);
        *error = [NSError errorWithDomain:kTracksParserErrorDomain
                                     code:kSCIncorrectTracksDataFormat
                                 userInfo:nil];
    }
    
    return track;
}

- (nullable SCTrack *)trackFromDictionary:(NSDictionary *)dictionary error:(NSError **)error {
    SCTrack *track = nil;
    NSNumber *identifier = dictionary[kIdentifierKey];
    NSString *title = dictionary[kTitleKey];
    NSNumber *duration = dictionary[kDurationKey];
    NSString *genre = dictionary[kGenreKey];
    NSString *artworkUrlString = dictionary[kArtworkKey];
    NSURL *artwork = [NSURL URLWithString:artworkUrlString];
    
    if (identifier != nil && title != nil) {
        track = [[SCTrack alloc] initWithIdentifier:identifier
                                              title:title
                                           duration:duration
                                            artwork:artwork
                                              genre:genre];
    }
    else {
        *error = [NSError errorWithDomain:kTracksParserErrorDomain
                                     code:kSCNoRequiredTracksFields
                                 userInfo:nil];
    }
    return track;
}

@end
