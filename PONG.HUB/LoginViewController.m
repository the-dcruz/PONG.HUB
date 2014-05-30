//
//  LoginViewController.m
//  PONG.HUB
//
//  Created by Daniel Cruz on 4/30/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import "LoginViewController.h"
#import "ProfileViewController.h"
#import "NetworkService.h"

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
    
    // Register the facebook user in our backend
    NetworkService *networkService = [[NetworkService alloc] init];
    NSString *fbId = [user id];
    NSString *fullName = [[[user first_name] stringByAppendingString:@" " ] stringByAppendingString:[user last_name]];
    [networkService registerUser:fbId withName:fullName];
    
    [self performSegueWithIdentifier:@"loginToProfile" sender:self];
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
