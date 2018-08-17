#import "SCUser.h"

@interface SCUser ()

//required
@property (nonatomic, copy, nonnull) NSNumber *identifier;
@property (nonatomic, copy, nonnull) NSString *userName;

//optional
@property (nonatomic, copy, nullable) NSString *fullName;
@property (nonatomic, copy, nullable) NSString *userDescription;
@property (nonatomic, copy, nullable) NSURL *avatarUrl;
@property (nonatomic, copy, nullable) NSString *country;
@property (nonatomic, copy, nullable) NSString *city;

@end

@implementation SCUser

#pragma mark - Initialization

- (instancetype)initWithIdentifier:(nonnull NSNumber *)identifier
                          userName:(nonnull NSString *)userName
                          fullName:(nullable NSString *)fullName
                   userDescription:(nullable NSString *)userDescription
                         avatarUrl:(nullable NSURL *)avatarUrl
                           country:(nullable NSString *)country
                              city:(nullable NSString *)city {
    self = [super init];
    if (self != nil) {
        self.identifier = identifier;
        self.userName = userName;
        self.fullName = fullName;
        self.userDescription = userDescription;
        self.avatarUrl = avatarUrl;
        self.country = country;
        self.city = city;
    }
    return self;
}

@end
