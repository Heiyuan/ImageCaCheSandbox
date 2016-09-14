//
//  UIImage+CaCheSandbox.m
//  ImageCache
//
//  Created by 刘志远 on 16/9/14.
//  Copyright © 2016年 刘志远. All rights reserved.
//

#import "UIImage+CaCheSandbox.h"
#define CACHEPATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@implementation UIImage (CaCheSandbox)

//Written to the sandbox

- (BOOL)writtenTheAandboxIsKey:(NSString *)key{
    NSString *filepath = [CACHEPATH stringByAppendingPathComponent:key];
    return [UIImagePNGRepresentation(self) writeToFile:filepath atomically:YES];
}
+ (UIImage *)initReadFromSandboxIsKey:(NSString *)key placeholderImage:(UIImage *)placeholder{
    NSString *filepath = [CACHEPATH stringByAppendingPathComponent:key];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filepath];
    if (result) {
         return [[UIImage alloc] initWithContentsOfFile:filepath];
    }else{
        return placeholder;
    }
}

@end
