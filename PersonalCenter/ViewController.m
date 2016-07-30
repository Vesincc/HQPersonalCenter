//
//  ViewController.m
//  PersonalCenter
//
//  Created by HanQi on 16/7/28.
//  Copyright © 2016年 HanQi. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableWidget.h"
#import "SeondTableWidget.h"
#import "ThirdTableWidget.h"


@interface ViewController () <UITableViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *introduceView;

@property (nonatomic, strong) FirstTableWidget *firstTableView;
@property (nonatomic, strong) SeondTableWidget *secondTableView;
@property (nonatomic, strong) ThirdTableWidget *thirdTaleView;

@property (nonatomic, strong) UIView *btnItem;

@property (nonatomic, strong) UIButton *firstBtn;
@property (nonatomic, strong) UIButton *secondBtn;
@property (nonatomic, strong) UIButton *thirdBtn;

@property (nonatomic, strong) UIView *line;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UINavigationController *navController = [[UINavigationController alloc] init];
    
    
    [UIApplication sharedApplication].delegate.window.rootViewController = navController;
    
    navController.viewControllers = @[self];
    
//    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationController.navigationBar.translucent = NO;
    
    [self scrollView];
    
    [self introduceView];
    
    
    
}
-(UIView *)introduceView {

    if (!_introduceView) {
    
        _introduceView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260)];
        _introduceView.backgroundColor = COLOR(250, 250, 250, 1);
        
        UIView *line = [self createLinePositionX:0 positionY:260 width:SCREEN_WIDTH height:1 color:COLOR(220, 220, 220, 1)];
        [_introduceView addSubview:line];
        
        
        line = [self createLinePositionX:0 positionY:210 width:SCREEN_WIDTH height:1 color:COLOR(220, 220, 220, 1)];
        [_introduceView addSubview:line];
        
        self.btnItem = [[UIView alloc] initWithFrame:CGRectMake(0, 211, SCREEN_WIDTH, 49)];
        self.btnItem.backgroundColor = [UIColor whiteColor];
        
        self.firstBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, 50)];
        [self.firstBtn setTitle:@"信息" forState:UIControlStateNormal];
        [self.btnItem addSubview:self.firstBtn];
        [self.firstBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        self.firstBtn.tag = 1;
        [self.firstBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
        self.secondBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 50)];
        [self.secondBtn setTitle:@"文章" forState:UIControlStateNormal];
        self.secondBtn.tag = 2;
        [self.secondBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.secondBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.btnItem addSubview:self.secondBtn];
        
        self.thirdBtn = [[UIButton alloc] initWithFrame:CGRectMake(2*SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 50)];
        [self.thirdBtn setTitle:@"测试" forState:UIControlStateNormal];
        self.thirdBtn.tag = 3;
        [self.thirdBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.thirdBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [self.btnItem addSubview:self.thirdBtn];
        
        [_introduceView addSubview:self.btnItem];
        
        self.line = [self createLinePositionX:0 positionY:0 width:50 height:2 color:[UIColor orangeColor]];
        CGPoint point = CGPointMake(self.firstBtn.center.x, 49);
        self.line.center = point;
        
        [self.btnItem addSubview:self.line];
        
        [self.view addSubview:_introduceView];
        
    }

    return _introduceView;
    
}

- (void)btnClick:(UIButton *)button {
    switch (button.tag) {
        case 1:
            [self lineMove:1];
            break;
        case 2:
            [self lineMove:2];
            break;
        case 3:
            [self lineMove:3];
            break;

          
    }

}

- (void)lineMove:(NSInteger)tag {

    switch (tag) {
        case 1: {
            [UIView animateWithDuration:0.2 animations:^{
                CGPoint point = self.line.center;
                point.x = self.firstBtn.center.x;
                self.line.center = point;
            }];
            break;}
        case 2: {
            [UIView animateWithDuration:0.2 animations:^{
                CGPoint point = self.line.center;
                point.x = self.secondBtn.center.x;
                self.line.center = point;
            }];
            break;}
        case 3: {
            [UIView animateWithDuration:0.2 animations:^{
                CGPoint point = self.line.center;
                point.x = self.thirdBtn.center.x;
                self.line.center = point;
            }];
            break;}
    }


}

- (UIView *)createLinePositionX:(CGFloat)positionX positionY:(CGFloat)positionY width:(CGFloat)width height:(CGFloat)height color:(UIColor *)color{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(positionX, positionY, width, height)];
    
    view.backgroundColor = color;
    
    
    
    return view;

}

-(UIScrollView *)scrollView {

    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(3*_scrollView.frame.size.width, _scrollView.frame.size.height);
        _scrollView.pagingEnabled = YES;
//        _scrollView.delegate = self;
        
//        [_scrollView setContentOffset:CGPointMake(375, 0) animated:YES];
        
        
//        NSLog(@"%f", self.secondTableView.frame.origin.x);
        
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        view.backgroundColor = [UIColor redColor];
        
        [_scrollView addSubview:view];
        
        UIView  *view2 = [[UIView alloc] initWithFrame:CGRectMake(375, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        view2.backgroundColor = [UIColor cyanColor];
        
        [_scrollView addSubview:view2];
        
        [self firstTableView];
        self.firstTableView.tableView.delegate = self;
        [self createTableViewHead:self.firstTableView.tableView];
        
        [self secondTableView];
        self.secondTableView.tableView.delegate = self;
        [self createTableViewHead:self.secondTableView.tableView];
        
        [self thirdTaleView];
        self.thirdTaleView.tableView.delegate = self;
        [self createTableViewHead:self.thirdTaleView.tableView];
        
        
        [self.view addSubview:_scrollView];
       
        
        
    
    
    }
    
    return _scrollView;


}

- (void)createTableViewHead:(UITableView *)tableView {

    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260)];
    header.backgroundColor = [UIColor clearColor];
    
    tableView.tableHeaderView = header;

}

-(ThirdTableWidget *)thirdTaleView {

    if (!_thirdTaleView) {
    
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            
            NSString * str = [NSString stringWithFormat:@"Third   %d", i+1];
            [array addObject:str];
            
        }
        
        _thirdTaleView = [[ThirdTableWidget alloc] initWithFrame:CGRectMake(2*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT) dataArray:array];
        
        [self.scrollView addSubview:_thirdTaleView];
            
    
    }
    return _thirdTaleView;

}

-(SeondTableWidget *)secondTableView {
    
    if (!_secondTableView) {
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            
            NSString * str = [NSString stringWithFormat:@"Second   %d", i+1];
            [array addObject:str];
            
        }
        _secondTableView = [[SeondTableWidget alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT) dataArray:array];
        
        [self.scrollView addSubview:_secondTableView];
    
    }
    return _secondTableView;
    
}


-(FirstTableWidget *)firstTableView {
    
    if (!_firstTableView) {
        
        NSMutableArray *array = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            
            NSString * str = [NSString stringWithFormat:@"First   %d", i+1];
            [array addObject:str];
            
        }
        _firstTableView = [[FirstTableWidget alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) dataArray:array];
        
        [self.scrollView addSubview:_firstTableView];
    
    }
    return _firstTableView;

 

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    NSLog(@"%f", scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y < 213 && scrollView.contentOffset.y > 0) {
    
        CGRect fram = self.introduceView.frame;
        fram.origin.y = -scrollView.contentOffset.y;
        self.introduceView.frame = fram;
    
    }
    
}


@end
