//
//  TestTableView.m
//  PersonalCenter
//
//  Created by HanQi on 16/7/29.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "TestTableView.h"

@interface TestTableView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataList;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TestTableView

- (instancetype)initWithFrame:(CGRect)frame dataList:(NSArray *)dataList
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataList = dataList;
        
        self.tableView = [[UITableView alloc] init];
        self.tableView.frame = frame;
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

//    static NSString *cellId = @"cell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
//    if (cell == nil) {
    
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
//    }
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = self.dataList[indexPath.row];
    
    return cell;
    

}

@end
