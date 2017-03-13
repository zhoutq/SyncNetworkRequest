//
//  ViewController.m
//  NetworkSynchronizeTest
//
//  Created by zhoutq on 17/3/13.
//  Copyright © 2017年 www.feinno.com. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkRequest.h"

@interface ViewController ()
{
    dispatch_semaphore_t sem;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(60, 200, 80, 40)];
    loginButton.backgroundColor = [UIColor colorWithRed:0.410 green:0.780 blue:1.000 alpha:1.000];
    [loginButton setTitle:@"开始请求" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(requestButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
}

- (void)requestButtonPress:(UIButton *)sender
{
    __weak typeof(self) weakSelf = self;
    sem = dispatch_semaphore_create(1);
    dispatch_queue_t queue = dispatch_queue_create("NetworkSynchronizeTest", NULL);
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        [weakSelf loadRequet1];
    });
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        [weakSelf loadRequet2];
    });
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        [weakSelf loadRequet3];
    });
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        [weakSelf loadRequet4];
    });

}

// 网络请求
- (void)loadRequet1
{
    NSLog(@"A request begin!");
    [NetWorkRequest requestWithUrl:@"https://www.baidu.com/"
                           success:^(id result) {
        
                               NSLog(@"A request success!");
                               dispatch_semaphore_signal(sem);
    }
                           failure:^(id result) {
                               
                               NSLog(@"A request failure!");
                               dispatch_semaphore_signal(sem);
                           }];
}
- (void)loadRequet2
{
    NSLog(@"B request begin!");
    [NetWorkRequest requestWithUrl:@"https://www.baidu.com/"
                           success:^(id result) {
                               
                               NSLog(@"B request success!");
                               dispatch_semaphore_signal(sem);
                           }
                           failure:^(id result) {
                               
                               NSLog(@"B request failure!");
                               dispatch_semaphore_signal(sem);
                           }];
}
- (void)loadRequet3
{
    NSLog(@"C request begin!");
    [NetWorkRequest requestWithUrl:@"https://www.baidu.com/"
                           success:^(id result) {
                               
                               NSLog(@"C request success!");
                               dispatch_semaphore_signal(sem);
                           }
                           failure:^(id result) {
                               
                               NSLog(@"C request failure!");
                               dispatch_semaphore_signal(sem);
                           }];
}
- (void)loadRequet4
{
    NSLog(@"D request begin!");
    [NetWorkRequest requestWithUrl:@"https://www.baidu.com/"
                           success:^(id result) {
                               
                               NSLog(@"D request success!");
                               dispatch_semaphore_signal(sem);
                           }
                           failure:^(id result) {
                               
                               NSLog(@"D request failure!");
                               dispatch_semaphore_signal(sem);
                           }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
