//
//  STKAudioPlayerManager.h
//  EverythingInArt
//
//  Created by qianfeng0 on 16/3/1.
//  Copyright © 2016年 XuhuiW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STKAudioPlayer.h"

typedef enum
{
    STKAudioPlayerStateManagerReady,
    STKAudioPlayerStateManagerRunning = 1,
    STKAudioPlayerStateManagerPlaying = (1 << 1) | STKAudioPlayerStateManagerRunning,
    STKAudioPlayerStateManagerBuffering = (1 << 2) | STKAudioPlayerStateManagerRunning,
    STKAudioPlayerStateManagerPaused = (1 << 3) | STKAudioPlayerStateManagerRunning,
    STKAudioPlayerStateManagerStopped = (1 << 4),
    STKAudioPlayerStateManagerError = (1 << 5),
    STKAudioPlayerStateManagerDisposed = (1 << 6)
}
STKAudioPlayerStateManager;

@interface STKAudioPlayerManager : NSObject

@property (nonatomic, strong) STKAudioPlayer * player;

@property(nonatomic,strong) NSString *URLLL;

+ (instancetype)shareSingleton;


/// Plays an item from the given URL string (all pending queued items are removed).
/// The NSString is used as the queue item ID
-(void) play:(NSString*)urlString;

/// Plays an item from the given URL (all pending queued items are removed)
//-(void) play:(NSString*)urlString withQueueItemID:(NSObject*)queueItemId;

- (void)play;

/// Plays an item from the given URL (all pending queued items are removed)
/// The NSURL is used as the queue item ID
-(void) playURL:(NSURL*)url;

/// Plays an item from the given URL (all pending queued items are removed)
//-(void) playURL:(NSURL*)url withQueueItemID:(NSObject*)queueItemId;


/// Pauses playback
-(void) pause;

/// Resumes playback from pause
-(void) resume;

/// Stops playback of the current file, flushes all the buffers and removes any pending queued items
-(void) stop;

/// Mutes playback
-(void) mute;

/// Unmutes playback
-(void) unmute;

/// Disposes the STKAudioPlayer and frees up all resources before returning
-(void) dispose;

@end
