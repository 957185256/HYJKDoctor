//
//  PhotoTools.h
//  Sonhoo
//
//  Created by wenzhizheng on 16/5/24.
//  Copyright © 2016年 com.qzzlsonhoo.hubin2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoTools : NSObject

/**
 *  弹出imagepicker
 *
 *  @param controller       要弹出imagepicker的控制器
 *  @param didChooseImage   选择了照片之后的回调
 */
+ (void)showIomagePickInController:(UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate> *)controller didChooseImage:(void(^)(UIImage *image))didChooseImage;

@end
