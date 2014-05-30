//
//  UserProfileTableViewCell.m
//  PONG.HUB
//
//  Created by Daniel Cruz on 5/29/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import "UserProfileTableViewCell.h"

@implementation UserProfileTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
