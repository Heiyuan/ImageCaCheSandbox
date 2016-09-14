//
//  ViewController.m
//  ImageCache
//
//  Created by 刘志远 on 16/9/14.
//  Copyright © 2016年 刘志远. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CaCheSandbox.h"

#define IMGURL @"http://139.224.80.121/images/2016-09-14/LflAQ7EhtVkQ8DXj6Ce8ZuUo.jpg"
@interface ViewController ()
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _imageView.center  = self.view.center;
    [self.view addSubview:_imageView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"gou" ofType:@"jpeg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    _imageView.image = [UIImage initReadFromSandboxIsKey:@"gou" placeholderImage:image];

    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(downImage:) object:nil];
    [thread start];
}


- (void)downImage:(NSThread *)thred {
    
  UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:IMGURL]]];
    if ([image writtenTheAandboxIsKey:@"gou"]) {
        NSLog(@"写入成功");
    }else{
        NSLog(@"写入失败");
    }
    [thred cancel];
}

@end
