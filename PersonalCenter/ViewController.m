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


@interface ViewController () <UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *introduceView;
@property (nonatomic, strong) UIImageView *userHead;

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
    
    [self createUserHead];
    
    
}

- (void)createUserHead {
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 100, 50);
//    view.backgroundColor = [UIColor cyanColor];
    
    self.userHead = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userhead"]];
    self.userHead.frame = CGRectMake(0, 0, 100, 100);
    self.userHead.center = CGPointMake(50, 45);
    self.userHead.layer.cornerRadius = 50;
    self.userHead.layer.masksToBounds = YES;
    
    [view addSubview:self.userHead];
    
    self.navigationItem.titleView = view;
    
    

}

- (UIView *)introduceView {

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
        
        
        UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 50)];
        name.font = [UIFont systemFontOfSize:25 weight:0.1];
        name.textAlignment = NSTextAlignmentCenter;
        name.text = @"HanQi";
        name.textColor = [UIColor blackColor];
        
        UILabel *something = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 30)];
        something.font = [UIFont systemFontOfSize:15];
        something.textAlignment = NSTextAlignmentCenter;
        something.text = @"做一些自己想做的事";
        
        UIButton *btnEdit = [[UIButton alloc] init];
        btnEdit.frame = CGRectMake(0, 0, 120, 40);
        btnEdit.center = CGPointMake(SCREEN_WIDTH/2, 160);
        [btnEdit setTitle:@"编辑个人资料" forState:UIControlStateNormal];
        [btnEdit setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        btnEdit.layer.cornerRadius = 5;
        btnEdit.layer.masksToBounds = YES;
        btnEdit.layer.borderColor = [UIColor orangeColor].CGColor;
        btnEdit.layer.borderWidth = 1.5;
        btnEdit.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [_introduceView addSubview:name];
        [_introduceView addSubview:something];
        [_introduceView addSubview:btnEdit];
        
    }

    return _introduceView;
    
}


- (void)btnClick:(UIButton *)button {
    CGPoint point = CGPointZero;
    switch (button.tag) {
        case 1:
            [self lineMove:1];
            point.x = 0;
            break;
        case 2:
            [self lineMove:2];
            point.x = SCREEN_WIDTH;
            break;
        case 3:
            [self lineMove:3];
            point.x = 2*SCREEN_WIDTH;
            break;

          
    }
    
    [_scrollView setContentOffset:point animated:YES];
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
        
        _scrollView.delegate = self;
        
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
    NSLog(@"%f", scrollView.contentOffset.x);
    
    if (scrollView.contentOffset.x == 0 && scrollView.contentOffset.y != 0) {
    
        if (scrollView.contentOffset.y < 210 && scrollView.contentOffset.y > 0) {
            
            self.firstTableView.tableView.contentOffset = scrollView.contentOffset;
            self.secondTableView.tableView.contentOffset = scrollView.contentOffset;
            self.thirdTaleView.tableView.contentOffset = scrollView.contentOffset;
            
            CGRect fram = self.introduceView.frame;
            fram.origin.y = -scrollView.contentOffset.y;
            self.introduceView.frame = fram;
            
            
            CGRect userHeadFram = CGRectZero;
            userHeadFram.size = CGSizeMake(100-scrollView.contentOffset.y*60/210, 100-scrollView.contentOffset.y*60/210);
            self.userHead.frame = userHeadFram;
            self.userHead.center = CGPointMake(50, 45-scrollView.contentOffset.y*20/210);
            self.userHead.layer.cornerRadius = self.userHead.frame.size.width/2;
            
            
            
        } else if (scrollView.contentOffset.y <= 0) {
            
            CGRect fram = self.introduceView.frame;
            fram.origin.y = 0;
            self.introduceView.frame = fram;
            
            CGRect userHeadFram = CGRectZero;
            userHeadFram.size = CGSizeMake(100, 100);
            self.userHead.frame = userHeadFram;
            self.userHead.center = CGPointMake(50, 45);
            self.userHead.layer.cornerRadius = self.userHead.frame.size.width/2;
            
        } else if (scrollView.contentOffset.y >= 210) {
            
            CGRect fram = self.introduceView.frame;
            fram.origin.y = -210;
            self.introduceView.frame = fram;
            
            CGRect userHeadFram = CGRectZero;
            userHeadFram.size = CGSizeMake(40, 40);
            self.userHead.frame = userHeadFram;
            self.userHead.center = CGPointMake(50, 25);
            self.userHead.layer.cornerRadius = self.userHead.frame.size.width/2;
            
        }
    
    
    } else if (scrollView.contentOffset.y == 0) {
        
        if (scrollView.contentOffset.x < SCREEN_WIDTH) {
            if (self.introduceView.frame.origin.y != 0) {
                [self lineMove:1];
            } else {
            
                if (scrollView == self.scrollView) {
                    [self lineMove:1];
                }
                
            }
            
            
        } else if (scrollView.contentOffset.x >= SCREEN_WIDTH && scrollView.contentOffset.x < 2*SCREEN_WIDTH) {
        
            [self lineMove:2];
            
        } else if (scrollView.contentOffset.x >= 2*SCREEN_WIDTH) {
        
            [self lineMove:3];
        
        }
    
    
    
    
    }
    
    
    
    
    
    
}


@end
