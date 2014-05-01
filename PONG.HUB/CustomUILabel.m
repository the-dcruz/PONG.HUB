//
//  CustomUILabel.m
//  PONG.HUB
//
//  Created by Sean Pryor on 4/30/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import "CustomUILabel.h"

@implementation CustomUILabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.text = @"helloworld";
        self.font = [UIFont fontWithName:@"GeosansLight-Regular" size:15];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
