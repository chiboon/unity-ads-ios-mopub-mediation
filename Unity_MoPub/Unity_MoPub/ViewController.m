//
//  ViewController.m
//  Unity_MoPub
//
//  Created by Chi Boon on 3/5/17.
//  Copyright © 2017 Chi Boon. All rights reserved.
//

#import "ViewController.h"
#import "MoPub.h"

@interface ViewController () <MPRewardedVideoDelegate, MPInterstitialAdControllerDelegate>

@property (nonatomic, retain) MPInterstitialAdController *interstitial;

@property (weak, nonatomic) IBOutlet UIButton *PlayRewardedVideoButton;
@property (weak, nonatomic) IBOutlet UIButton *PlayInterstitialButton;

@end

@implementation ViewController

static NSString *const kUnityAdsRewardedVideoAdUnitID = @"f89821455f784e2bb22f236c21c56d9e";
static NSString *const kUnityAdsInterstitialAdUnitID = @"0a013c1e58584a4ea2fae0cc863fb248";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Init Unity Rewarded Video
    [[MoPub sharedInstance] initializeRewardedVideoWithGlobalMediationSettings:nil delegate:self];
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:kUnityAdsRewardedVideoAdUnitID withMediationSettings:nil];
    
    // Init Unity Interstitial
    self.interstitial = [MPInterstitialAdController
                         interstitialAdControllerForAdUnitId:kUnityAdsInterstitialAdUnitID];
    self.interstitial.delegate = self;
    [self.interstitial loadAd];
}

- (IBAction)didTapShowRewardedVideoButton:(id)sender
{
    [MPRewardedVideo presentRewardedVideoAdForAdUnitID:kUnityAdsRewardedVideoAdUnitID fromViewController:self withReward:nil];
}

- (IBAction)didTapShowInterstitialButton:(id)sender
{
    if (self.interstitial.ready) {
        [self.interstitial showFromViewController:self];
    } else {
        // The interstitial wasn't ready, so continue as usual.
    }
}

#pragma mark - <MPRewardedVideoDelegate>
- (void)rewardedVideoAdDidLoadForAdUnitID:(NSString *)adUnitID {
    if ([adUnitID isEqualToString:kUnityAdsRewardedVideoAdUnitID]) {
        _PlayRewardedVideoButton.enabled = YES;
    }
}
- (void)rewardedVideoAdDidFailToPlayForAdUnitID:(NSString *)adUnitID error:(NSError *)error {
    
}
- (void)rewardedVideoAdWillAppearForAdUnitID:(NSString *)adUnitID {
    
}
- (void)rewardedVideoAdDidAppearForAdUnitID:(NSString *)adUnitID {
    
}
- (void)rewardedVideoAdWillDisappearForAdUnitID:(NSString *)adUnitID {
    
}
- (void)rewardedVideoAdDidDisappearForAdUnitID:(NSString *)adUnitID {
    [MPRewardedVideo loadRewardedVideoAdWithAdUnitID:kUnityAdsRewardedVideoAdUnitID withMediationSettings:nil];
}
- (void)rewardedVideoAdDidExpireForAdUnitID:(NSString *)adUnitID {
    
}
- (void)rewardedVideoAdDidReceiveTapEventForAdUnitID:(NSString *)adUnitID {
    
}
- (void)rewardedVideoAdShouldRewardForAdUnitID:(NSString *)adUnitID reward:(MPRewardedVideoReward *)reward {
    
}
- (void)rewardedVideoAdWillLeaveApplicationForAdUnitID:(NSString *)adUnitID {
    
}


#pragma mark - <MPInterstitialAdControllerDelegate>
- (void)interstitialWillAppear:(MPInterstitialAdController *)interstitial {

}

- (void)interstitialDidDisappear:(MPInterstitialAdController *)interstitial {

}

@end
