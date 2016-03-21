//
//  ViewController.m
//  PickTest
//
//  Created by ZhaoMing on 16/3/21.
//  Copyright © 2016年 ZhaoMing. All rights reserved.
//

#import "ViewController.h"
#import "JKPickView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testPickView];
}

-(void)testPickView
{
    NSArray *arr1 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
        NSArray *arr2 = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"k"];
       // NSArray *arr3 = @[@"a1",@"b2",@"c3",@"d4",@"e5"];
    
        NSArray *arr = @[arr1,arr2];
    
    
        JKPickView *vc = [[JKPickView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height - 200, [[UIScreen mainScreen] bounds].size.width, 200)];
        [vc withArray:arr selectRowHeight:50];
        vc.downBlock = ^(NSDictionary *dic)
        {
            NSLog(@"arr======%@",dic);
        };
        [self.view addSubview:vc];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
