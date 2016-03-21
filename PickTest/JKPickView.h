//
//  JKPickView.h
//  NewWineClient
//
//  Created by ZhaoMing on 16/3/16.
//  Copyright © 2016年 贵永冬. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickDownBlock)(NSDictionary *doneDic);//传选中的值
@interface JKPickView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
@property(nonatomic,strong)NSArray *array;//总的数据
@property(nonatomic,assign)float rowH;//选中的高度
@property(nonatomic,copy)ClickDownBlock downBlock;
@property(nonatomic,strong)UIPickerView *pickerView;//pickerView
@property(nonatomic,strong)NSMutableDictionary *doneDic;//存选中的行的数据


/**
 *  根据传入的数据计算pickView
 *
 *  @param arr       传入的数组数据
 *  @param rowHeight 传入的选中的高度
 */
-(void)withArray:(NSArray *)arr selectRowHeight:(CGFloat)rowHeight;
@end
