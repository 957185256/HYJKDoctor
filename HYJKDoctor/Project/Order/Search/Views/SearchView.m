//
//  SearchView.m
//  HYJKDoctor
//
//  Created by 刘朝涛 on 16/6/5.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "SearchView.h"

@interface SearchView ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIImageView *bgImageViewLine;

@end

@implementation SearchView

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
    [self addSubview:self.bgImageView];
    [self addSubview:self.bgImageViewLine];
    [self addSubview:self.searchBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTextFiledText) name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark --- event
- (void)changeTextFiledText
{
    if (_searchF.text.length > 0)
    {
        [_searchBtn setImage:[UIImage imageNamed:@"search_btn_p"] forState:UIControlStateNormal];
        _searchBtn.userInteractionEnabled = YES;
    }
    else
    {
        [_searchBtn setImage:[UIImage imageNamed:@"search_btn_n"] forState:UIControlStateNormal];
        _searchBtn.userInteractionEnabled = NO;
    }
}

- (void)searchBtnAction
{
    if (_searchViewBlock)
    {
        _searchViewBlock(_searchF.text);
    }
    if (_searchF.isFirstResponder) {
        [_searchF resignFirstResponder];
    }
    _searchF.text = @"";
    [_searchBtn setImage:[UIImage imageNamed:@"search_btn_n"] forState:UIControlStateNormal];
    _searchBtn.userInteractionEnabled = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark --- getter
- (UIImageView *)bgImageView
{
    if (!_bgImageView)
    {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        _bgImageView.image = [UIImage imageNamed:@"search_bg"];
    }
    return _bgImageView;
}

- (UIImageView *)bgImageViewLine
{
    if (!_bgImageViewLine)
    {
        _bgImageViewLine = [[UIImageView alloc] initWithFrame:CGRectMake(QZMAKEOF6(25), QZMAKEOF6(8), QZMAKEOF6(296), QZMAKEOF6(35))];
        _bgImageViewLine.image = [UIImage imageNamed:@"search_bg_line"];
        _bgImageViewLine.userInteractionEnabled = YES;
        [_bgImageViewLine addSubview:self.searchF];
    }
    return _bgImageViewLine;
}

- (UIButton *)searchBtn
{
    if (!_searchBtn)
    {
        _searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchBtn setImage:[UIImage imageNamed:@"search_btn_n"] forState:UIControlStateNormal];
        _searchBtn.frame = CGRectMake(self.width - QZMAKEOF6(25) - QZMAKEOF6(53.5), QZMAKEOF6(8), QZMAKEOF6(53.5), QZMAKEOF6(35));
        [_searchBtn addTarget:self action:@selector(searchBtnAction) forControlEvents:UIControlEventTouchUpInside];
        _searchBtn.userInteractionEnabled = NO;
    }
    return _searchBtn;
}

 - (UITextField *)searchF
{
    if (!_searchF)
    {
        _searchF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, QZMAKEOF6(280), QZMAKEOF6(35))];
        _searchF.placeholder = @"请输入订单号或者是患者姓名进行搜索";
        _searchF.font = fontWithSize(QZMAKEOF6(13));
        _searchF.delegate = self;
        _searchF.clearButtonMode = UITextFieldViewModeWhileEditing;
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, QZMAKEOF6(15), _searchF.height)];
        _searchF.leftView = leftView;
        _searchF.leftViewMode = UITextFieldViewModeAlways;
        _searchF.returnKeyType = UIReturnKeyDone;
    }
    return _searchF;
}

@end
