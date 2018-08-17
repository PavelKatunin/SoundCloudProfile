#import "SCTracksJSONParser.h"

static NSString *const kIdentifierKey = @"id";
static NSString *const kTitleKey = @"title";
static NSString *const kDurationKey = @"duration";
static NSString *const kArtworkKey = @"artwork";
static NSString *const kGenreKey = @"genre";

@implementation SCTracksJSONParser

- (nullable NSArray<SCTrack *> *)tracksFromData:(NSData *)data error:(NSError **)error {
    NSArray<SCTrack *> *tracks = nil;
    NSError *jsonParsingError = nil;
    id tracksObject = [NSJSONSerialization JSONObjectWithData:data
                                                      options:0
                                                        error:&jsonParsingError];
    
    if (tracksObject != nil && jsonParsingError == nil) {
        if ([tracksObject isKindOfClass:[NSArray class]]) {
            NSArray *trackDictionaries = tracksObject;
            NSMutableArray<SCTrack *> *parsedTracks = [[NSMutableArray alloc] init];
            [trackDictionaries enumerateObjectsUsingBlock:^(id  _Nonnull obj,
                                                            NSUInteger idx,
                                                            BOOL * _Nonnull stop) {
                
                NSDictionary *trackDictionary = obj;
                NSError *trackParsingError = nil;
                SCTrack *track = [self trackFromDictionary:trackDictionary error:&trackParsingError];
                if (track != nil) {
                    [parsedTracks addObject:track];
                }
            }];
            tracks = parsedTracks;
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
    
    return tracks;
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
