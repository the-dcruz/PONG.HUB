//
//  User.h
//  PONG.HUB
//
//  Created by Daniel Cruz on 7/15/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong, nonatomic) NSString *fbId;
@property (strong, nonatomic) NSString *fullName;
@property (strong, nonatomic) NSString *displayName;
@property (strong, nonatomic) NSString *location;

@end
