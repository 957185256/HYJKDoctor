//
//  OrderDetailsTableViewCell.m
//  HYJKDoctor
//
//  Created by shown on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderDetailsTableViewCell.h"

@implementation OrderDetailsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _lab = [[UILabel alloc] initWithFrame:CGRectMake(QZMAKEOF6(12), 22 - QZMAKEOF6(7), ScreenWidth/5, QZMAKEOF6(14))];
        _lab.font = fontWithSize(QZMAKEOF6(14));
        _lab.textColor = RGB(134, 134, 134, 1);
        [self.contentView addSubview:_lab];
        
        _value = [[UILabel alloc] initWithFrame:CGRectMake(_lab.right, 22 - QZMAKEOF6(8), ScreenWidth/5 * 4, QZMAKEOF6(16))];
        _value.font = fontWithSize(QZMAKEOF6(14));
        _value.textColor = RGB(134, 134, 134, 1);
        [self.contentView addSubview:_value];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(_lab.right, 43.5, ScreenWidth/5 * 4, 0.5)];
        line.backgroundColor = RGB(247, 247, 247, 1);
        [self.contentView addSubview:line];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
