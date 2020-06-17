//
//  ViewController.m
//  simpleChart
//
//  Created by pro on 2020/6/16.
//  Copyright © 2020年 pro. All rights reserved.
//

#import "ViewController.h"
#import "ColumnarView.h"
@interface ViewController ()
@property (nonatomic, strong) ColumnarView * columnarView;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineSpace;
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) NSArray * titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lineSpace = 30;
    _lineWidth = 15;
    _dataArray =@[@50,@100,@60,@120,@150,@200,@0];
    _titleArray = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周天",];
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 300)];
    _columnarView = [[ColumnarView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    _columnarView.lineWidth = _lineWidth;
    _columnarView.lineSpace = _lineSpace;
    _columnarView.dataArray = _dataArray;
    _columnarView.titleArray = _titleArray;
    _columnarView.frame = CGRectMake(0, 0, _lineSpace*2 + (_lineSpace+_lineWidth)*_dataArray.count, 300);
    [self.view addSubview:_columnarView];
    scrollView.contentSize = CGSizeMake(_lineSpace*2 + (_lineSpace+_lineWidth)*_dataArray.count, 300);
    [scrollView addSubview:_columnarView];
    [self.view addSubview:scrollView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
