//
//  SearchFooterView.m
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SearchFooterView.h"

@interface SearchFooterView ()

@end

@implementation SearchFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initView];
    }
    return self;
}

- (void)initView
{
    [self addSubview:self.cleanBtn];
}

- (void)cleanBtnAction
{
    if (_footBlock) {
        _footBlock();
    }
}

- (UIButton *)cleanBtn
{
    if (!_cleanBtn)
    {
        _cleanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cleanBtn.frame = CGRectMake(0, 0, self.width, self.height);
        [_cleanBtn setTitle:@"清楚全部浏览记录" forState:UIControlStateNormal];
        [_cleanBtn setImage:[UIImage imageNamed:@"search_delete"] forState:UIControlStateNormal];
        [_cleanBtn setTitleColor:CustomThemeColor forState:UIControlStateNormal];
        _cleanBtn.titleLabel.font = fontWithSize(QZMAKEOF6(14));
        [_cleanBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, QZMAKEOF6(3), 0, 0)];
        [_cleanBtn setImageEdgeInsets:UIEdgeInsetsMake(0, QZMAKEOF6(-3), 0, 0)];
        [_cleanBtn addTarget:self action:@selector(cleanBtnAction) forControlEvents:UIControlEventTouchUpInside];
        _cleanBtn.hidden = YES;
    }
    return _cleanBtn;
}


@end
