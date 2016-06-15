//
//  UIAlertController+extend.m
//  Sonhoo
//
//  Created by wenzhizheng on 16/5/11.
//  Copyright © 2016年 Qzzl.Sonhoo. All rights reserved.
//

#import "UIAlertController+extend.h"

@implementation UIAlertController (extend)

+ (void)alertWithtitle:(NSString *)title inController:(UIViewController *)controller handler:(void(^)())handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:handler]];

    
    [controller presentViewController:alertController animated:YES completion:nil];
}


+ (void)actionSheetWith:(NSArray *)titles inController:(UIViewController *)controller handler:(void(^)(int index))handler
{
    UIAlertController *actionsheetController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    for (int index = 0;index <titles.count;index ++) {
        NSString *title = [titles objectAtIndex:index];
        [actionsheetController addAction:[UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            handler(index);
        }]];
    }
    
    [actionsheetController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];


    
    [controller presentViewController:actionsheetController animated:YES completion:nil];
}

+ (void)alertInputWithTitle:(NSString *)title placeholder:(NSString *)placeholder secureTextEntry:(BOOL)secureTextEntry inController:(UIViewController *)controller  didInput:(void(^)(NSString *content))didInput;
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.secureTextEntry = secureTextEntry;
        textField.placeholder = placeholder;
    }];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (didInput) {
            didInput(alertController.textFields.firstObject.text);
        }
    }]];
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    
    [controller presentViewController:alertController animated:YES completion:nil];
}

@end
