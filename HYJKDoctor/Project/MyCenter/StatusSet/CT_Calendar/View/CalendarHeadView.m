//
//  CalendarHeadView.m
//
//
//  Created by 刘朝涛 on 16/1/7.
//
//  功能：预约日期

#import "CalendarHeadView.h"

@interface CalendarHeadView ()

@end

@implementation CalendarHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc] initWithCapacity:42];
    }
    
    _currentDate = [NSDate date];
    
    [self dateWith:_currentDate];
    
    [self addSubview:self.bgView];
    
    [self addSubview:self.bgView2];
    
    [self addSubview:self.collectionView];
    _collectionView.dateArr = _dataArr;
    
//    [self addSubview:self.bgView3];
    
//    [self addSubview:self.bgView4];
    
//    [self addSubview:self.selectedBtn];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _collectionView.bottom + QZMAKEOF6(10), self.width, 1)];
    line.backgroundColor = RGB(244, 244, 245, 1);
    [self addSubview:line];
    
    self.height = line.bottom;
}

- (void)dateWith:(NSDate *)oldDate {
    
    NSInteger days = [oldDate numberofDayInCurrentMonth];
    
    //本月第几天
    //    _dayWithWeek = [NSString stringWithFormat:@"%zi",[oldDate dayOrdinality]];
    
    //星期几
    NSInteger weekDay = [[oldDate firstDayOfCurrentMoth] weeklyOrdinality];
    
    //获取当前月份有几个星期
    //    _weeks = [oldDate numberOfWeeksInCurrentMonth];
    
    for (int i = 1; i < weekDay; i++) {
        CalenderModel *model = [[CalenderModel alloc] init];
        model.year = [NSString stringWithFormat:@"%zi",[oldDate currentYear]];
        model.month = [NSString stringWithFormat:@"%zi",[oldDate currentMonth]];
        model.day = @"";
        [_dataArr addObject:model];
    }
    
    for (int j = 0; j < days; j++) {
        CalenderModel *model = [[CalenderModel alloc] init];
        model.year = [NSString stringWithFormat:@"%zi",[oldDate currentYear]];
        model.month = [NSString stringWithFormat:@"%zi",[oldDate currentMonth]];
        model.day = [NSString stringWithFormat:@"%zi",j + 1];
        [_dataArr addObject:model];
    }
    
    NSInteger count = 42 - _dataArr.count;
    for (int z = 0; z <  count; z++) {
        CalenderModel *model = [[CalenderModel alloc] init];
        model.year = [NSString stringWithFormat:@"%zi",[oldDate currentYear]];
        model.month = [NSString stringWithFormat:@"%zi",[oldDate currentMonth]];
        model.day = @"";
        [_dataArr addObject:model];
    }
    
    if (_calendarTitleLab) {
        NSInteger month = [_currentDate currentMonth];
        if (month < 10) {
            _calendarTitleLab.text = [NSString stringWithFormat:@"%zi年0%zi月",[_currentDate currentYear],month];
        } else {
            _calendarTitleLab.text = [NSString stringWithFormat:@"%zi年%zi月",[_currentDate currentYear],month];
        }
    }
    
}

#pragma mark --- get

- (CalendarCollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        [flow setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
//        flow.minimumInteritemSpacing = QZMAKEOF6(2);
//        flow.minimumLineSpacing = QZMAKEOF6(2);
        flow.minimumInteritemSpacing = 0;
        flow.minimumLineSpacing = 0;
        flow.itemSize = CGSizeMake(self.width/7, self.width/7);
        
//        _collectionView = [[CalendarCollectionView alloc] initWithFrame:CGRectMake(ScreenWidth/2. - QZMAKEOF6(278)/2., _bgView2.bottom + QZMAKEOF6(5), QZMAKEOF6(278), QZMAKEOF6(40.5)*6) collectionViewLayout:flow];
        _collectionView = [[CalendarCollectionView alloc] initWithFrame:CGRectMake(0, _bgView2.bottom + QZMAKEOF6(5), self.width, self.width/7*6) collectionViewLayout:flow];
        
        __weak typeof(self)weakSelf = self;
        _collectionView.collectionBlock = ^ (CalenderModel *model) {
            NSString *month = model.month;
            NSString *day = model.day;
            if ([month integerValue] < 10) {
                month = [NSString stringWithFormat:@"0%@",month];
            }
            if ([day integerValue] < 10) {
                day = [NSString stringWithFormat:@"0%@",day];
            }
            weakSelf.selectedDate.text = [NSString stringWithFormat:@"%@-%@-%@",model.year,month,day];
        };
    }
    return _collectionView;
}

- (UIView *)bgView {
    if (_bgView == nil) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, QZMAKEOF6(44))];
        
        _calendarTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(_bgView.frame.size.width/2. - QZMAKEOF6(80), QZMAKEOF6(12), QZMAKEOF6(160), QZMAKEOF6(20))];
        _calendarTitleLab.font = fontWithSize(QZMAKEOF6(15));
        NSInteger month = [_currentDate currentMonth];
        if (month < 10) {
            _calendarTitleLab.text = [NSString stringWithFormat:@"%zi年0%zi月",[_currentDate currentYear],month];
        } else {
            _calendarTitleLab.text = [NSString stringWithFormat:@"%zi年%zi月",[_currentDate currentYear],month];
        }
        _calendarTitleLab.textAlignment = NSTextAlignmentCenter;
        [_bgView addSubview:_calendarTitleLab];
        
        UIButton *upBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        upBtn.backgroundColor = CustomThemeColor;
        upBtn.frame = CGRectMake(0, _bgView.height/2. - QZMAKEOF6(40)/2., QZMAKEOF6(100), QZMAKEOF6(40));
        [upBtn setTitle:@"上一个月" forState:UIControlStateNormal];
        [upBtn addTarget:self action:@selector(upBtnaction) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:upBtn];
        
        UIButton *downBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        downBtn.backgroundColor = CustomThemeColor;
        downBtn.frame = CGRectMake(ScreenWidth - QZMAKEOF6(100), upBtn.top, upBtn.width, upBtn.height);
        [downBtn setTitle:@"下一个月" forState:UIControlStateNormal];
        [downBtn addTarget:self action:@selector(downBtnaction) forControlEvents:UIControlEventTouchUpInside];
        [_bgView addSubview:downBtn];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _bgView.height - QZMAKEOF6(1), ScreenWidth, QZMAKEOF6(1))];
        line.backgroundColor = RGB_X(0xd4d6d5);
        [_bgView addSubview:line];
    }
    return _bgView;
}

- (UIView *)bgView2 {
    if (_bgView2 == nil) {
//        _bgView2 = [[UIView alloc] initWithFrame:CGRectMake(ScreenWidth/2. - QZMAKEOF6(278)/2., _bgView.bottom, QZMAKEOF6(278), QZMAKEOF6(30))];
        _bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, _bgView.bottom, self.width, QZMAKEOF6(30))];
        
        NSArray *arr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
        
        for (int i = 0; i < 7; i++) {
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(_bgView2.width/7. * i, 0, _bgView2.width/7. - 2, _bgView2.height)];
            lab.textAlignment = NSTextAlignmentCenter;
            if (i == 0 || i > 5) {
                lab.textColor = CustomThemeColor;
            }
            lab.text = arr[i];
            [_bgView2 addSubview:lab];
        }
    }
    return _bgView2;
}

- (UIView *)bgView3 {
    
    if (_bgView3 == nil) {
        UIImage *image = [UIImage imageNamed:@"explain"];
        _bgView3 = [[UIView alloc] initWithFrame:CGRectMake(0, _collectionView.bottom + 10, ScreenWidth, image.size.height/image.size.width * ScreenWidth + 2)];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 1)];
        line.backgroundColor = RGB_X(0xd4d6d5);
        [_bgView3 addSubview:line];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 1, ScreenWidth, image.size.height/image.size.width * ScreenWidth)];
        imageView.image = image;
        [_bgView3 addSubview:imageView];
        
        line = [[UIView alloc] initWithFrame:CGRectMake(0, _bgView3.height - QZMAKEOF6(1), ScreenWidth, QZMAKEOF6(1))];
        line.backgroundColor = RGB_X(0xd4d6d5);
        [_bgView3 addSubview:line];
    }
    
    return _bgView3;
}

- (UIView *)bgView4 {
    if (_bgView4 == nil) {
        _bgView4 = [[UIView alloc] initWithFrame:CGRectMake(0, _bgView3.bottom, ScreenWidth, 0)];
        
        //选中日期
        _selectedDate = [[UILabel alloc] init];
        _selectedDate.font = fontWithSize(QZMAKEOF6(13));
        _selectedDate.textColor = RGB(66, 66, 66, 1);
        NSString *month = [NSString stringWithFormat:@"%zi",[_currentDate currentMonth]];
        NSString *day = [NSString stringWithFormat:@"%zi",[_currentDate currentDay]];
        if ([month integerValue] < 10) {
            month = [NSString stringWithFormat:@"0%@",month];
        }
        if ([day integerValue] < 10) {
            day = [NSString stringWithFormat:@"0%@",day];
        }
        _selectedDate.text = [NSString stringWithFormat:@"%zi-%@-%@",[_currentDate currentYear],month,day];
        CGSize size = [NSString getTextMultilineContent:_selectedDate.text withFont:_selectedDate.font withSize:CGSizeMake(ScreenWidth - QZMAKEOF6(12), MAXFLOAT)];
        _selectedDate.frame = CGRectMake(QZMAKEOF6(12), QZMAKEOF6(12), size.width, size.height);
        [_bgView4 addSubview:_selectedDate];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(_selectedDate.left, _selectedDate.bottom + QZMAKEOF6(12), ScreenWidth - _selectedDate.left, QZMAKEOF6(1))];
        line.backgroundColor = RGB_X(0xd4d6d5);
        [_bgView4 addSubview:line];
        
        //选中时间
        _selectedTime = [[UILabel alloc] init];
        _selectedTime.font = fontWithSize(QZMAKEOF6(13));
        _selectedTime.text = @"21:00-22:05";
        size = [NSString getTextMultilineContent:_selectedTime.text withFont:_selectedTime.font withSize:CGSizeMake(ScreenWidth - QZMAKEOF6(12), MAXFLOAT)];
        _selectedTime.userInteractionEnabled = YES;
        _selectedTime.frame = CGRectMake(_selectedDate.left, line.bottom, ScreenWidth - _selectedDate.left, QZMAKEOF6(30) + size.height);
        [_bgView4 addSubview:_selectedTime];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectTime)];
        [_selectedTime addGestureRecognizer:tap];
        
        
        line = [[UIView alloc] initWithFrame:CGRectMake(0, _selectedTime.bottom, ScreenWidth, QZMAKEOF6(1))];
        line.backgroundColor = RGB_X(0xd4d6d5);
        [_bgView4 addSubview:line];
        
        _bgView4.height = line.bottom;
    }
    
    return _bgView4;
}

- (UIButton *)selectedBtn {
    if (_selectedBtn == nil) {
        UIImage *image = [UIImage imageNamed:@"sure_date_p"];
        _selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectedBtn.frame = CGRectMake(0, _bgView4.bottom + QZMAKEOF6(15), ScreenWidth, image.size.height/image.size.width * ScreenWidth);
        [_selectedBtn setImage:image forState:UIControlStateNormal];
        [_selectedBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectedBtn;
}

#pragma mark --- btn action
/**
 *  上个月
 */
- (void)upBtnaction {
    
    _currentDate  = [_currentDate lastMonth:-1];
    
    [_dataArr removeAllObjects];
    [self dateWith:_currentDate];
    [self.collectionView reloadData];
}
/**
 *  下个月
 */
- (void)downBtnaction {
    
    //
    _currentDate  = [_currentDate lastMonth:1];
    
    [_dataArr removeAllObjects];
    [self dateWith:_currentDate];
    [self.collectionView reloadData];
}
/**
 *  选择时间
 */
- (void)selectTime {
    if (_delegate) {
        [_delegate selectTime];
    }
}
/**
 *  确定时间
 */
- (void)sureAction {
    if (_delegate) {
        [_delegate sureTime:_selectedTime.text Date:self.selectedDate.text];
    }
}


@end
