//
//  core_ios.m
//  core-ios
//
//  Created by Glen De Cauwsemaecker on 3/7/16.
//  Copyright © 2016 Glen De Cauwsemaecker. All rights reserved.
//

#import "core_ios.h"

NSString* CreateNSString(const char* string)
{
    if (string)
        return [NSString stringWithUTF8String: string];
    else
        return [NSString stringWithUTF8String: ""];
}

extern "C"  {
    void logMessage(const char* message)
    {
        NSLog(@"%@\n", CreateNSString(message));
    }
}