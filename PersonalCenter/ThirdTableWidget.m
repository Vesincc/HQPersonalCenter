//
//  ThirdTableWidget.m
//  PersonalCenter
//
//  Created by HanQi on 16/7/29.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ThirdTableWidget.h"

@interface ThirdTableWidget() <UITableViewDelegate, UITableViewDataSource>



@end

@implementation ThirdTableWidget

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataList
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataList = dataList;
        
        self.tableView = [[UITableView alloc] init];
        self.tableView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        [self addSubview:self.tableView];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"thirdWidgetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataList[indexPath.row];
    
    return cell;
    
}


@end
