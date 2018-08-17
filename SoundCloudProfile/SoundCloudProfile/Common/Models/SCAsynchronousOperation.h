//
//  SCAsynchronousOperation.h
//  SoundCloudProfile
//
//  Created by Pavel Katunin on 8/17/18.
//  Copyright © 2018 PavelKatunin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCAsynchronousOperation : NSOperation

- (void)completeOperation;
- (void)execute;

@end
