//
//  SearchTableViewCell.m
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SearchTableViewCell.h"

@interface SearchTableViewCell ()

@property (nonatomic, strong) UIImageView *headIcon;

@property (nonatomic, strong) UIImageView *rightIcon;

@property (nonatomic, strong) UIView *line;

@end

@implementation SearchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self initView];
    }
    return self;
}

- (void)initView
{
    [self.contentView addSubview:self.headIcon];
    [self.contentView addSubview:self.rightIcon];
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.timeLab];
    [self.contentView addSubview:self.line];
}

#pragma mark --- getter

- (UIImageView *)headIcon
{
    if (!_headIcon)
    {
        _headIcon = [[UIImageView alloc] initWithFrame:CGRectMake(QZMAKEOF6(25), 22 - QZMAKEOF6(11.5)/2, QZMAKEOF6(11), QZMAKEOF6(11.5))];
        _headIcon.image = [UIImage imageNamed:@"search_people"];
    }
    return _headIcon;
}

- (UIImageView *)rightIcon
{
    if (!_rightIcon)
    {
        _rightIcon = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - QZMAKEOF6(19), 22 - QZMAKEOF6(11)/2, QZMAKEOF6(7), QZMAKEOF6(11))];
        _rightIcon.image = [UIImage imageNamed:@"CellArrow"];
    }
    return _rightIcon;
}

- (UILabel *)nameLab
{
    if (!_nameLab)
    {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(_headIcon.right + QZMAKEOF6(10), 22 - QZMAKEOF6(7), QZMAKEOF6(100), QZMAKEOF6(14))];
        _nameLab.font = fontWithSize(QZMAKEOF6(14));
        _nameLab.text = @"陈春";
    }
    return _nameLab;
}

- (UILabel *)timeLab
{
    if (!_timeLab)
    {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(_rightIcon.left - QZMAKEOF6(105), 22 - QZMAKEOF6(7), QZMAKEOF6(100), QZMAKEOF6(14))];
        _timeLab.font = fontWithSize(QZMAKEOF6(12));
        _timeLab.text = @"2015.10.22";
        _timeLab.textAlignment = NSTextAlignmentRight;
    }
    return _timeLab;
}

- (UIView *)line
{
    if (!_line)
    {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, ScreenWidth, 0.5)];
        _line.backgroundColor = RGB(237, 237, 237, 1);
    }
    return _line;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
