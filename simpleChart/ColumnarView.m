//
//  ColumnarView.m
//  simpleChart
//
//  Created by pro on 2020/6/16.
//  Copyright © 2020年 pro. All rights reserved.
//

#import "ColumnarView.h"
@interface ColumnarView ()
{
    CGContextRef _context;
    CGFloat  _bottomHeight;
    CGFloat _columnarHeight;
}
@end
@implementation ColumnarView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _bottomHeight = 20;
        _columnarHeight = CGRectGetHeight(frame) - _bottomHeight ;
        [self setNeedsDisplay];
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    
}

- (void)drawLineWithRect:(CGRect)rect{
    //第一步:获取上下文
    //CGContextRef 用来保存图形信息.输出目标
    _context = UIGraphicsGetCurrentContext();
    //第二步:画图形
    //设置线的颜色
//    CGContextSetRGBStrokeColor(_context, 169/255.0, 169/255.0, 169/255.0, 1);
    [_columnarBGColor setStroke];
    //设置线的宽度
    CGContextSetLineWidth(_context, _lineWidth);
    //设置连接点得样式
    CGContextSetLineJoin(_context, kCGLineJoinRound);
    //设置线头尾的样式
    CGContextSetLineCap(_context, kCGLineCapRound);
    //起点
    CGContextMoveToPoint(_context, CGRectGetMinX(rect), _lineWidth/2);
    //画线
    CGContextAddLineToPoint(_context, CGRectGetMinX(rect), CGRectGetMaxY(self.bounds)-_lineWidth/2-_bottomHeight);
    //    CGContextAddLineToPoint(context, 100, 150);
    //第三步:渲染到视图上
    CGContextStrokePath(_context);
    
     [_columnarColor setStroke];
    //起点
    CGContextMoveToPoint(_context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    //画线
    CGContextAddLineToPoint(_context, CGRectGetMinX(rect), CGRectGetMaxY(self.bounds)-_lineWidth/2 -_bottomHeight);
    //    CGContextAddLineToPoint(context, 100, 150);
    if (CGRectGetHeight(rect) == 0) {
        
    }else{
    //第三步:渲染到视图上
    CGContextStrokePath(_context);
    }
}

- (void)drawTextWithTitle:(NSString*)title andRect:(CGRect) rect{
//    [title drawAtPoint:CGPointMake(100, 20) withAttributes:nil];
    [title drawInRect:CGRectMake(rect.origin.x-10, CGRectGetHeight(self.bounds)-20, 40, _bottomHeight) withAttributes:nil];
  
}



-(void)drawRect:(CGRect)rect{
    _columnarHeight = CGRectGetHeight(self.frame) - _bottomHeight -_lineSpace ;
    for (int i = 0; i < _dataArray.count; i++) {
        CGRect rect = CGRectMake(_lineSpace+(_lineSpace + _lineWidth)*i, _columnarHeight +_lineSpace - [_dataArray[i] floatValue]/_yMax*_columnarHeight, _lineWidth, [_dataArray[i] floatValue]);
        [self drawLineWithRect:rect];
        [self drawTextWithTitle:_titleArray[i] andRect:rect];
        
    }
//   _context = UIGraphicsGetCurrentContext();
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
