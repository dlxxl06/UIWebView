//
//  ViewController.m
//  UIWebView
//
//  Created by admin on 15/9/16.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIWebView *_webView;

}
@end
////////////////////MIME内容/////////////////
//txt text/plain
//html text/html
//pdf application/pdf
//pages application/x-iwork-pages-sffpages

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    
    
    NSString *strPath = [[NSBundle mainBundle]pathForResource:@"aboutIOS.txt" ofType:nil];
  // NSLog(@"%@",[self getMIMETypeWithPath:strPath]);
    
    NSData *data = [NSData dataWithContentsOfFile:strPath];
    
    [_webView loadData:data MIMEType:@"text/plain" textEncodingName:@"UTF-8" baseURL:nil];
    
}
#pragma mark 获取应用的MIMEType
-(NSString *)getMIMETypeWithPath:(NSString *)strPath
{
    NSURL *url = [NSURL fileURLWithPath:strPath];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response = [[NSURLResponse alloc]init];
    
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    return response.MIMEType;

}
@end
