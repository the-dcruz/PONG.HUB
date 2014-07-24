//
//  StatsNavTableViewCell.m
//  PONG.HUB
//
//  Created by Daniel Cruz on 7/17/14.
//  Copyright (c) 2014 PONG HUB. All rights reserved.
//

#import "StatsNavTableViewCell.h"

@implementation StatsNavTableViewCell

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
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    [self.record addTarget:self action:@selector(viewRecord:) forControlEvents:(UIControlEvents) UIControlEventTouchDown];
    [self.stats addTarget:self action:@selector(viewStats:) forControlEvents:(UIControlEvents) UIControlEventTouchDown];
    [self.compare addTarget:self action:@selector(viewCompare:) forControlEvents:(UIControlEvents) UIControlEventTouchDown];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)viewRecord:(id) sender
{
    [self.record setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.stats setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.compare setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}

- (void)viewStats:(id) sender
{
    [self.record setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.stats setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.compare setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
}

- (void)viewCompare:(id) sender
{
    [self.record setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.stats setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.compare setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

@end
