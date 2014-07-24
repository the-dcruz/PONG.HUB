//
//  ProfileViewController.m
//  PONG.HUB
//
//  Created by Daniel Cruz on 4/30/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import "ProfileViewController.h"
#import "UserProfileTableViewCell.h"
#import "User.h"

@interface ProfileViewController ()
@end

@implementation ProfileViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureRestKit];
    [self loadUsers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if (indexPath.row == 0) {
        cell = (UserProfileTableViewCell*)([tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath]);
        
        ((UserProfileTableViewCell*)cell).username.text = self.loggedInUser.name;
        ((UserProfileTableViewCell*)cell).username.adjustsFontSizeToFitWidth = YES;
        [((UserProfileTableViewCell*)cell).username setFont:[UIFont fontWithName:@"GeosansLight" size:25.0]];
        
        //Set Image
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?width=100&height=100", self.loggedInUser.id]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        [((UserProfileTableViewCell*)cell).picture setImage:img];
        
    } else if (indexPath.row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"statsNav" forIndexPath:indexPath];
    } else if (indexPath.row == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"pointerCell" forIndexPath:indexPath];
    } else if (indexPath.row == 3) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cupRatio" forIndexPath:indexPath];
    } else if (indexPath.row == 4) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"mainStats" forIndexPath:indexPath];
    } else if (indexPath.row == 5) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"gamesPlayed" forIndexPath:indexPath];
    } else if (indexPath.row == 6) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"winPercent" forIndexPath:indexPath];
    } else if (indexPath.row == 7) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"dividerLine" forIndexPath:indexPath];
    } else if (indexPath.row == 8) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cupsSank" forIndexPath:indexPath];
    } else if (indexPath.row == 9) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"beersDrank" forIndexPath:indexPath];
    } else if (indexPath.row == 10) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"endCell" forIndexPath:indexPath];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        return 75;
    else if (indexPath.row == 1)
        return 55;
    else if (indexPath.row == 2)
        return 15;
    else if (indexPath.row == 3)
        return 35;
    else if (indexPath.row == 4)
        return 90;
    else if (indexPath.row == 5)
        return 25;
    else if (indexPath.row == 6)
        return 40;
    else if (indexPath.row == 7)
        return 2;
    else if (indexPath.row == 8)
        return 23;
    else if (indexPath.row == 9)
        return 30;
    else if (indexPath.row == 10)
        return 20;
    return 0;
}

- (void)configureRestKit
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"http://ec2-54-191-92-95.us-west-2.compute.amazonaws.com"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // setup object mappings
    RKObjectMapping *userMapping = [RKObjectMapping mappingForClass:[User class]];
    [userMapping addAttributeMappingsFromArray:@[@"fbId",@"fullName",@"displayName",@"location"]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:userMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:@"/getusers.php"
                                                keyPath:@"users"
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
}

- (void)loadUsers
{
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/getusers.php" parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  self.users = mappingResult.array;
                                                  NSLog(@"User 1: %@",((User*)self.users[0]).fullName);
                                                  NSLog(@"User 2: %@",((User*)self.users[1]).fullName);
                                                  NSLog(@"User 3: %@",((User*)self.users[2]).fullName);
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  NSLog(@"What do you mean by 'there are no users': %@", error);
                                              }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
