//
//  ColumnarView.h
//  simpleChart
//
//  Created by pro on 2020/6/16.
//  Copyright © 2020年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColumnarView : UIView
@property (nonatomic, strong) NSArray * dataArray;
@property (nonatomic, strong) NSArray * titleArray;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineSpace;
@property (nonatomic, assign) CGFloat yMax;
@property (nonatomic, strong) UIColor * columnarBGColor;
@property (nonatomic, strong) UIColor * columnarColor;
@end
