//
//  JKPickView.m
//  NewWineClient
//
//  Created by ZhaoMing on 16/3/16.
//  Copyright © 2016年 贵永冬. All rights reserved.
//

#import "JKPickView.h"




@implementation JKPickView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createPickView];
    }
    return self;
}

-(void)withArray:(NSArray *)arr selectRowHeight:(CGFloat)rowHeight
{
    self.array = arr;
    self.rowH = rowHeight;
    self.doneDic = [NSMutableDictionary dictionary];
    for (int i = 0; i < arr.count; i++) {
        NSArray *array = arr[i];
        NSString *str = array[0];
        [self.doneDic setObject:str forKey:@(i)];
    }
}

/**
 *  创建pickView
 */
-(void)createPickView
{
    

    self.pickerView = [[UIPickerView alloc]init];
    [self addSubview:self.pickerView];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.backgroundColor = [UIColor whiteColor];
   
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 40)];
    toolbar.barStyle = UIBarStyleDefault;
    toolbar.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52, 35)];
    [button addTarget:self action:@selector(cancelDate) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:NSLocalizedString(@"取消",@"取消") forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0] forState:UIControlStateNormal];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52, 35)];
    [button addTarget:self action:@selector(doneDate) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"完成",@"完成") forState:UIControlStateNormal];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    toolbar.items = @[cancelButton,[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],doneButton];
    [self addSubview:toolbar];

}


#pragma mark - pickDatasource
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *pickerLabel = (UILabel *)view;

    if (pickerLabel == nil)
    {
        pickerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 60)];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        pickerLabel.backgroundColor = [UIColor clearColor];
        pickerLabel.font = [UIFont systemFontOfSize:15];

    }
    
    if (self.array.count>0)
    {
        NSArray * arr = self.array[component];
        pickerLabel.text = arr[row];
        
    }
    
    
    return pickerLabel;
    
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    if (self.rowH)
    {
        return self.rowH;

    }
    return 0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (self.array.count > 0) {
        return [[UIScreen mainScreen] bounds].size.width/self.array.count;

    }
    return 0;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (self.array.count > 0)
    {
    
        return self.array.count;
    }
   
   
   return 0;

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (self.array.count > 0)
    {
        NSArray * arr = self.array[component];
        
         NSLog(@"arr.count === %d",arr.count);
        return arr.count;
        
    }
    return 0;

}

#pragma  mark - pickDelegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"对选中行做处理");
    NSArray * arr = self.array[component];
    NSString *str = arr[row];
    [self.doneDic setObject:str forKey:@(component)];
}

/**
 *  完成
 */
-(void) doneDate{
    

   
    if (self.downBlock)
    {
        self.downBlock(self.doneDic);
    }
    
    [UIView animateWithDuration:0.5
                          delay:0.5
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         [self removeFromSuperview];
                         
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

/** 
 *  取消
 */
-(void) cancelDate{
    [UIView animateWithDuration:0.5
                          delay:0.5
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         
                         [self removeFromSuperview];
                         
                     }
                     completion:^(BOOL finished){
                         
                         
            }];

}
@end
