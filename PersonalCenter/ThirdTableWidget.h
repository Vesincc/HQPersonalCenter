//
//  ThirdTableWidget.h
//  PersonalCenter
//
//  Created by HanQi on 16/7/29.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdTableWidget : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataList;

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataList;

@end
