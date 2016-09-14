//
//  UIImage+CaCheSandbox.h
//  ImageCache
//
//  Created by 刘志远 on 16/9/14.
//  Copyright © 2016年 刘志远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CaCheSandbox)
/**
 *  将图片写入沙盒
 *
 *  @param key 沙盒中文件名
 *
 *  @return 是否写入成功;
 */
- (BOOL)writtenTheAandboxIsKey:(NSString *)key;
/**
 *  从沙盒中获取图片
 *
 *  @param key    沙盒中文件名
 *  @param placeholder 占位图 当文件不存在时返回占位图
 *
 *  @return image对象
 */
+ (UIImage *)initReadFromSandboxIsKey:(NSString *)key placeholderImage:(UIImage *)placeholder;
@end
