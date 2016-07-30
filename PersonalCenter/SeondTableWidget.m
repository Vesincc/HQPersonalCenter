//
//  SeondTableWidget.m
//  PersonalCenter
//
//  Created by HanQi on 16/7/29.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "SeondTableWidget.h"

@interface SeondTableWidget() <UITableViewDelegate, UITableViewDataSource>



@end

@implementation SeondTableWidget

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataList
{
//    NSLog(@"%f", frame.origin.x);
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
    
    static NSString *cellID = @"secondWidgetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataList[indexPath.row];
    
    return cell;
    
}

@end
