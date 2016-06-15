//
//  OrderCell.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/14.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "OrderCell.h"

@interface OrderCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


- (IBAction)refuse:(UIButton *)sender;
- (IBAction)agree:(UIButton *)sender;


@end

@implementation OrderCell

+ (instancetype)cellInTableView:(UITableView *)tableView
{
    OrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCell"];
    if (cell == nil) {
        cell = [OrderCell loadFromXIBName:@"OrderCell"];
        
    }
    
    return cell;
}

- (void)setDataDict:(NSDictionary *)dataDict
{
    _dataDict = dataDict;
    
    self.nameLabel.text = dataDict[@"order_case_info"][@"consignee"];
    self.contentLabel.text = dataDict[@"order_case_info"][@"user_case"][@"disease_desc"];
}

- (IBAction)refuse:(UIButton *)sender {
    if (self.refuseBlock) {
        self.refuseBlock();
    }
    
}

- (IBAction)agree:(UIButton *)sender {
    if (self.agreeBlock) {
        self.agreeBlock();
    }
}
@end
