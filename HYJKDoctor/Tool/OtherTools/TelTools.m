//
//  TelTools.m
//  Sonhoo
//
//  Created by wenzhizheng on 16/5/12.
//  Copyright © 2016年 Qzzl.Sonhoo. All rights reserved.
//

#import "TelTools.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface TelTools () <ABPeoplePickerNavigationControllerDelegate,ABNewPersonViewControllerDelegate>

/**
 *  选择联系人信息之后回调
 */
@property (nonatomic,strong) void(^didChoosePerson)(NSString *,NSString *);

@end

@implementation TelTools

+ (instancetype)shareTools
{
    static TelTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[TelTools alloc] init];
    });
    return tools;
}

+ (void)callNumber:(NSString *)telNumber inView:(UIView *)view
{
    NSString *telString = [NSString stringWithFormat:@"tel:%@",telNumber];
    NSURL *url = [NSURL URLWithString:telString];
    NSURLRequest *requset = [NSURLRequest requestWithURL:url];
    UIWebView *webview = [[UIWebView alloc] init];
    [view addSubview:webview];
    [webview loadRequest:requset];
}

+ (void)sendMessageToTelNumber:(NSString *)telNumber
{
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",telNumber]]];
}

+ (void)getAddressBookPersonInfoInController:(UIViewController *)controller didChoosePerson:(void(^)(NSString *name,NSString *tel))didChoosePerson
{
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    TelTools *tools = [self shareTools];
    picker.peoplePickerDelegate = tools;
    tools.didChoosePerson = didChoosePerson;
    [controller presentViewController:picker animated:YES completion:nil];
}

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person NS_AVAILABLE_IOS(8_0)
{
    NSString* name = (__bridge_transfer NSString*)ABRecordCopyCompositeName(person);
    NSMutableString* phone = nil;
    
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person,kABPersonPhoneProperty);
    if (ABMultiValueGetCount(phoneNumbers) > 0) {
        phone = (__bridge_transfer NSMutableString*)ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
        
        phone = [NSMutableString stringWithString:phone];
        while ([phone containsString:@"-"]) {
            NSRange range = [phone rangeOfString:@"-"];
            [phone replaceCharactersInRange:range withString:@""];
        }
    }
    if (self.didChoosePerson) {
        self.didChoosePerson(name,phone);
    }
}

+ (void)addPersonInfoInController:(UIViewController *)controller name:(NSString *)name tel:(NSString *)tel;
{
    // 添加联系人控制器
    ABNewPersonViewController *newPersonViewController = [[ABNewPersonViewController alloc] init];
    newPersonViewController.automaticallyAdjustsScrollViewInsets = YES;
    newPersonViewController.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    newPersonViewController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    UINavigationController *navController = [[UINavigationController alloc] init];
    [navController pushViewController:newPersonViewController animated:NO];
    
    // 创建联系人
    ABRecordRef newPerson = ABPersonCreate();
    ABMutableMultiValueRef multiValue = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
    multiValue = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    CFErrorRef error = NULL;
    
    // 联系人电话
    ABMultiValueAddValueAndLabel(multiValue, (__bridge CFTypeRef)(tel), kABPersonPhoneMobileLabel, NULL);
    
    // 联系人姓名
    ABRecordSetValue(newPerson, kABPersonFirstNameProperty, (__bridge CFTypeRef)(name), NULL);
    
    // 传递信息
    ABRecordSetValue(newPerson, kABPersonPhoneProperty, multiValue , &error);
    NSAssert(!error, @"Something bad happened here.");
    newPersonViewController.displayedPerson = newPerson;
    
    newPersonViewController.newPersonViewDelegate = [TelTools shareTools];
    [controller presentViewController:navController animated:YES completion:nil];
}

- (void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person
{
    [newPersonView dismissViewControllerAnimated:YES completion:nil];
}

@end
