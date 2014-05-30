//
//  LoginViewController.m
//  PONG.HUB
//
//  Created by Daniel Cruz on 4/30/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import "LoginViewController.h"
#import "ProfileViewController.h"
#import "phubRegisterUser.h"

@interface LoginViewController ()

@property (strong, nonatomic) id<FBGraphUser> loggedInUser;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fbLoginView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    self.loggedInUser = user;
    [self performSegueWithIdentifier:@"loginToProfile" sender:self];
    
    // Register the facebook user in our backend
    phubRegisterUser *registerer = [[phubRegisterUser alloc] init];
    NSString *fbId = [user id];
    NSString *fullName = [[[user first_name] stringByAppendingString:@" " ] stringByAppendingString:[user last_name]];
    [registerer registerUser:fbId withName:fullName];
}

- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    [self performSegueWithIdentifier:@"loginToProfile" sender:self];
}

- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    // test to see if we can use the share dialog built into the Facebook application
    FBLinkShareParams *p = [[FBLinkShareParams alloc] init];
    p.link = [NSURL URLWithString:@"http://developers.facebook.com/ios"];
    
    self.loggedInUser = nil;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"loginToProfile"])
    {
        ProfileViewController *svc_obj = segue.destinationViewController;
        svc_obj.loggedInUser = self.loggedInUser;
    }
}

@end
