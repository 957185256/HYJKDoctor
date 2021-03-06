//
//  PatientCaseController.m
//  
//
//  Created by wenzhizheng on 16/1/2.
//
//

#import "PatientCaseController.h"
#import "UIView+Extend.h"
#import "PatientCaseModel.h"
#import "ChooseView.h"
#import "DescriptionCell.h"
#import "MedicalCell.h"

@interface PatientCaseController () <UITableViewDelegate,UITableViewDataSource,ChooseViewDelegate,UIAlertViewDelegate>

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) PatientCaseModel *model;
@property (nonatomic,strong) NSMutableArray *dataArray;


@property (nonatomic,weak) ChooseView *chooseView;


@property (nonatomic,strong) NSArray *ageArray;
@property (nonatomic,strong) NSArray *weightArray;
@property (nonatomic,strong) NSArray *heightArray;
@property (nonatomic,strong) NSArray *bloodArray;
@property (nonatomic,strong) NSArray *rhbloodArray;


@end

@implementation PatientCaseController


#pragma mark - 懒加载数据
- (NSArray *)ageArray
{
    if (_ageArray == nil) {
        NSMutableArray *array = [NSMutableArray array];
        for (int index = 1; index <=100; index++) {
            [array addObject:[NSString stringWithFormat:@"%d岁",index]];
        }
        _ageArray = array;
    }
    return _ageArray;
}

- (NSArray *)weightArray
{
    if (_weightArray == nil) {
        NSMutableArray *array = [NSMutableArray array];
        for (int index = 1; index <=100; index++) {
            [array addObject:[NSString stringWithFormat:@"%dkg",index]];
        }
        _weightArray  = array;
    }
    return _weightArray;
}

- (NSArray *)heightArray
{
    if (_heightArray == nil) {
        NSMutableArray *array = [NSMutableArray array];
        for (int index = 60; index <=240; index++) {
            [array addObject:[NSString stringWithFormat:@"%dcm",index]];
        }
        _heightArray = array;
    }
    return _heightArray;
}

- (NSArray *)bloodArray
{
    if (_bloodArray == nil) {
        _bloodArray = @[@"A型",@"B型",@"AB型",@"O型"];
    }
    return _bloodArray;
}

- (NSArray *)rhbloodArray
{
    if (_rhbloodArray == nil) {
        _rhbloodArray = @[@"Rh阳性",@"Rh阴性"];
    }
    return _rhbloodArray;
}

- (PatientCaseModel *)model
{
    if (_model == nil) {
        _model = [[PatientCaseModel alloc] init];
    }
    return _model;
}


+ (instancetype)controllerWithPatientDataArray:(NSMutableArray *)dataArray caseModel:(PatientCaseModel *)model;
{
    PatientCaseController *controller = [[PatientCaseController alloc] init];
    controller.model = model;
    controller.dataArray = dataArray;
    return controller;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"就诊人病例";
    
    [self setTableView];
    
//    // 保存按钮
//    UIButton *saveBtn = [[UIButton alloc] init];
//    saveBtn.frame = CGRectMake(ScreenWidth - 60, self.topView.bottom - 35,50,30);
//    [saveBtn setTitle:@"删除" forState:UIControlStateNormal];
//    [saveBtn addTarget:self action:@selector(deleteCase) forControlEvents:UIControlEventTouchUpInside];
//    
////    saveBtn.hidden = !self.model.case_id;
//    
//    [self.topView addSubview:saveBtn];
 }



#pragma mark - 创建tableView
- (void)setTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    tableView.tableFooterView = footView;
    
    UIButton *submitBtn = [[UIButton alloc] init];
    submitBtn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 10, 44);
    submitBtn.center = CGPointMake(footView.frame.size.width / 2, footView.frame.size.height / 2);
    [footView addSubview:submitBtn];
    submitBtn.backgroundColor = CustomThemeColor;
    [submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 6) {
        DescriptionCell *cell = [DescriptionCell descriptionCellWithTitle:@"简单病症描述" andPlaceHolder:@"请输入病症描述，不超过100个字"];
        cell.descriptionStr = self.model.disease_desc;
        cell.delegate = self;
        cell.tag = 6;
        return cell;
    }
    
    if (indexPath.row == 7) {
        DescriptionCell *cell = [DescriptionCell descriptionCellWithTitle:@"遗传病历史" andPlaceHolder:@"是否有遗传病例，没有则不填写，字数不超过100个字"];
        cell.descriptionStr = self.model.disease_history;
        cell.delegate = self;
        cell.tag = 7;
        return cell;
    }
    
    MedicalCell *cell = [MedicalCell medicalCell];
    if (indexPath.row == 0) {
        cell.titleStr = @"年龄";
        cell.detailStr = self.model.age;
    }
    if (indexPath.row == 1) {
        cell.titleStr = @"体重(kg)";
        cell.detailStr = self.model.weight;
    }
    if (indexPath.row == 2) {
        cell.titleStr = @"身高(cm)";
        cell.detailStr = self.model.height;
    }
    if (indexPath.row == 3) {
        cell.titleStr = @"血型";
        cell.detailStr = self.model.blood_type;
    }
    if (indexPath.row == 4) {
        cell.titleStr = @"RH血型";
        cell.detailStr = self.model.rhblood_type;
    }
    if (indexPath.row == 5) {
        cell.titleStr = @"BMI";
        cell.detailStr = self.model.bmi;
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 5) {
        return 150;
    }
    return 44;
}


#pragma mark - 返回
- (void)backBtnClick
{
//    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_BINGLI object:nil userInfo:@{@"yitianxie":[NSString stringWithFormat:@"%zi",_isOK]}];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - desCriptionCellDelegate
- (void)descriptionCellTextDidChange:(DescriptionCell *)cell
{
    if (cell.tag == 6) {
        self.model.disease_desc = cell.descriptionStr;
    }
    if (cell.tag == 7) {
        self.model.disease_history = cell.descriptionStr;
    }
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MedicalCell *cell = (MedicalCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 0) {
        [self creatChooseViewWithTitleArry:self.ageArray andChooseTitle:cell.detailStr andTitle:cell.titleStr andTag:indexPath.row];
        return;
    };
    if (indexPath.row == 1) {
        [self creatChooseViewWithTitleArry:self.weightArray andChooseTitle:cell.detailStr andTitle:cell.titleStr andTag:indexPath.row];
        return;
    };
    if (indexPath.row == 2) {
        [self creatChooseViewWithTitleArry:self.heightArray andChooseTitle:cell.detailStr andTitle:cell.titleStr andTag:indexPath.row];
        return;
    };
    if (indexPath.row == 3) {
        [self creatChooseViewWithTitleArry:self.bloodArray andChooseTitle:cell.detailStr andTitle:cell.titleStr andTag:indexPath.row];
        return;
    }
    if (indexPath.row == 4) {
        [self creatChooseViewWithTitleArry:self.rhbloodArray andChooseTitle:cell.detailStr andTitle:cell.titleStr andTag:indexPath.row];
        return;
    }
    
}

#pragma mark - 选择菜单
- (void)creatChooseViewWithTitleArry:(NSArray *)titleArry andChooseTitle:(NSString *)chooseTitle andTitle:(NSString *)title andTag:(int)tag
{
    ChooseView *view = [ChooseView chooseViewWithTitleArry:titleArry andChosseTitle:chooseTitle andTitle:title];
    view.delegate = self;
    view.tag = tag;
    self.chooseView = view;
    [view showInView:self.view];
    return;
}

#pragma mark - chooseDelegate
- (void)chooseViewDidSelected:(NSInteger)index
{
    
    if (self.chooseView.tag == 0) {
        self.model.age = [NSString stringWithFormat:@"%zi",index + 1];
    }
    if (self.chooseView.tag == 1) {
        self.model.weight = [NSString stringWithFormat:@"%zi",index + 1];
    }
    if (self.chooseView.tag == 2) {
        self.model.height = [NSString stringWithFormat:@"%zi",index + 60];
    }
    if (self.chooseView.tag == 3) {
        self.model.blood_type = [self.bloodArray objectAtIndex:index];
    }
    if (self.chooseView.tag == 4) {
        self.model.rhblood_type = [self.rhbloodArray objectAtIndex:index];
    }
    
    if (self.model.weight && self.model.height) {
        double weight = self.model.weight.doubleValue;
        double height = self.model.height.doubleValue / 100;
        double BMI = weight / height / height;
        if (height == 0) {
            BMI = 0;
        }
        self.model.bmi = [NSString stringWithFormat:@"%.2f",BMI];
    }

    [self.tableView reloadData];
}


@end
