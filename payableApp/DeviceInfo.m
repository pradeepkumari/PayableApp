//
//  DeviceInfo.m
//  payableApp
//
//  Created by apple on 27/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

#import "DeviceInfo.h"
#import <sys/utsname.h>

@implementation DeviceInfo

+ (NSString *)model
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString: systemInfo.machine encoding: NSUTF8StringEncoding];
}

@end
