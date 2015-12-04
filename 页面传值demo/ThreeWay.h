//
//  ThreeWay.h
//  页面传值demo
//
//  Created by 冯学杰 on 15/12/3.
//  Copyright © 2015年 冯学杰. All rights reserved.
//

//block块传值 通知传值
#import <UIKit/UIKit.h>
#import "SecondWay.h"

@interface ThreeWay : UIViewController<toThreeDelegate>

@property (nonatomic, copy) void (^MyBlock)(NSString *tfText);

@end
