//
//  Account.m
//  HYJKDoctor
//
//  Created by wenzhizheng on 16/6/1.
//  Copyright © 2016年 Noah. All rights reserved.
//

#import "Account.h"


@implementation Account

+ (void)quit
{
    NSString *filePath = [NSString stringWithFormat:@"%@/account.plist",Document_File_Path];
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

- (void)save
{
    NSString *filePath = [NSString stringWithFormat:@"%@/account.plist",Document_File_Path];
    [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}


+ (instancetype)getAccount
{
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSString stringWithFormat:@"%@/account.plist",Document_File_Path]];
    return account;
}

- (void)setSession:(NSDictionary *)session
{
    _session = session;
    self.doctor_id = session[@"doctor_id"];
}

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    Account *account = [[Account alloc] init];
    
    
    return account;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeObject:self.session forKey:@"session"];
  
}



- (nullable instancetype)initWithCoder:(NSCoder *)acoder
{
    Account *account = [[Account alloc] init];
    
    account.name = [acoder decodeObjectForKey:@"name"];
    account.password = [acoder decodeObjectForKey:@"password"];
    account.session = [acoder decodeObjectForKey:@"session"];
    
    return account;
}



@end
