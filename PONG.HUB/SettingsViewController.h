//
//  SettingsViewController.h
//  PONG.HUB
//
//  Created by Daniel Cruz on 5/7/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface SettingsViewController : UIViewController <FBLoginViewDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet FBLoginView *fbLoginView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end
