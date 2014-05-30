//
//  phubRegisterUser.h
//  PONG.HUB
//
//  Created by GK on 5/28/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface phubRegisterUser : NSObject<NSURLConnectionDelegate>
{
    NSMutableData *_responseData;
}

- (void) registerUser:(NSString *)fbId withName:(NSString *) name;
@end
