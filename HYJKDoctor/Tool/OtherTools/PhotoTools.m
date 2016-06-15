//
//  PhotoTools.m
//  Sonhoo
//
//  Created by wenzhizheng on 16/5/24.
//  Copyright © 2016年 com.qzzlsonhoo.hubin2. All rights reserved.
//

#import "PhotoTools.h"
#import "UIAlertController+extend.h"

@interface PhotoTools () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/**
 *  选择了照片回调
 */
@property (nonatomic,strong) void(^didChooseImage)(UIImage *);

/**
 *  要现实的控制器
 */
@property (nonatomic,weak) UIViewController *controller;

@end

@implementation PhotoTools

+ (instancetype)sharePhotoTools
{
    static PhotoTools *photoTools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        photoTools = [[PhotoTools alloc] init];
    });
    return photoTools;
}

+ (void)showIomagePickInController:(UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate> *)controller didChooseImage:(void(^)(UIImage *image))didChooseImage
{
    PhotoTools *tools = [PhotoTools sharePhotoTools];
    tools.controller = controller;
    tools.didChooseImage = didChooseImage;
    
    [tools chooseImage];
}


#pragma mark - 选择图片
- (void)chooseImage
{
    [UIAlertController actionSheetWith:@[@"相机",@"相册"] inController:self.controller handler:^(int index) {
        switch (index) {
            case 0:
                [self getImage:UIImagePickerControllerSourceTypeCamera];
                break;
                
            case 1:
                [self getImage:UIImagePickerControllerSourceTypePhotoLibrary];
                break;
        }
    }];
}

- (void)getImage:(UIImagePickerControllerSourceType)sourceType{
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.allowsEditing = YES;
        controller.sourceType = sourceType;
        controller.delegate = self;
        [self.controller presentViewController:controller animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];

    if (self.didChooseImage) {
        self.didChooseImage(image);
    }
}


@end
