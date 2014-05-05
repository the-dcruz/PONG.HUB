//
//  ProfileViewController.h
//  PONG.HUB
//
//  Created by Daniel Cruz on 4/30/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>


@interface ProfileViewController : UIViewController
@property (strong, nonatomic) id<FBGraphUser> loggedInUser;

@end
