//
//  SCAsynchronousOperation.m
//  SoundCloudProfile
//
//  Created by Pavel Katunin on 8/17/18.
//  Copyright © 2018 PavelKatunin. All rights reserved.
//

#import "SCAsynchronousOperation.h"

@interface SCAsynchronousOperation()
// 'executing' and 'finished' exist in NSOperation, but are readonly
@property (atomic, assign) BOOL _executing;
@property (atomic, assign) BOOL _finished;
@end

@implementation SCAsynchronousOperation

- (void)start {
    if ([self isCancelled]) {
        // Move the operation to the finished state if it is canceled.
        [self willChangeValueForKey:@"isFinished"];
        self._finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    // If the operation is not canceled, begin executing the task.
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    self._executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main {
    if ([self isCancelled]) {
        return;
    }
    [self execute];
}

- (void)execute {
    
}

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isExecuting {
    return self._executing;
}

- (BOOL)isFinished {
    return self._finished;
}

- (void)completeOperation {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    self._executing = NO;
    self._finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

@end
