//
//  STKAudioPlayerManager.m
//  EverythingInArt
//
//  Created by qianfeng0 on 16/3/1.
//  Copyright © 2016年 XuhuiW. All rights reserved.
//

#import "STKAudioPlayerManager.h"

static STKAudioPlayerManager * playerManager = nil;


@implementation STKAudioPlayerManager


+ (instancetype)shareSingleton {

    if (!playerManager) {
        playerManager = [[STKAudioPlayerManager alloc] init];
    }
    return playerManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
      //  //NSLog(@"这是一个单例");
        self.player = [[STKAudioPlayer alloc] initWithOptions:(STKAudioPlayerOptions){ .flushQueueOnSeek = YES, .enableVolumeMixer = YES, .equalizerBandFrequencies = {50, 100, 200, 400, 800, 1600, 2600, 16000} }];
        //下面的初始化也可以,但设置不了enableVolumeMixer,就无法调节音量
        //self.player = [[STKAudioPlayer alloc] init];
        //  self.player.delegate = self;
        self.player.volume = 0.5;
    }
    return self;
}

-(void)play:(NSString *)urlString {
    if (!playerManager) {
        //NSLog(@"播放音乐");
        playerManager = [STKAudioPlayerManager shareSingleton];
        
    }
    [playerManager.player play:urlString];
    //NSLog(@"%@", urlString);

    self.URLLL = urlString;
}



-(void)playURL:(NSURL *)url {

    if (!playerManager) {
        playerManager = [STKAudioPlayerManager shareSingleton];
        
    }
    [playerManager.player playURL:url];

}

- (void)play
{
    if (!playerManager) {
        playerManager = [STKAudioPlayerManager shareSingleton];
    }
    
    [playerManager.player play:self.URLLL];
}

-(void)pause {
    if (!playerManager) {
        playerManager = [STKAudioPlayerManager shareSingleton];
       
    }
     [playerManager.player pause];
   // [playerManager.player.state STKAudioPlayerStatePaused];
    
}

- (void)resume {
    if (!playerManager) {
        playerManager = [STKAudioPlayerManager shareSingleton];
            }
    [playerManager.player resume];

    
}

- (void)stop {
    if (!playerManager) {
        playerManager = [STKAudioPlayerManager shareSingleton];
        
    }
    [playerManager.player stop];
    
}

- (void)mute {
    if (!playerManager) {
        playerManager = [STKAudioPlayerManager shareSingleton];
       
    }
     [playerManager.player mute];
    
}

- (void)unmute {
    if (!playerManager) {
        playerManager = [STKAudioPlayerManager shareSingleton];
        [playerManager.player unmute];
    }
    
}

- (void)dispose {
    if (!playerManager) {
        playerManager = [STKAudioPlayerManager shareSingleton];
        [playerManager.player dispose];
    }
    
}



@end
