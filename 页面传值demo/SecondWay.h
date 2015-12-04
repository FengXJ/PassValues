//
//  SecondWay.h
//  页面传值demo
//
//  Created by 冯学杰 on 15/12/3.
//  Copyright © 2015年 冯学杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol toThreeDelegate

-(void)toThree:(NSString *)value;//1.1定义协议与方法

@end



@interface SecondWay : UIViewController

@property (strong,nonatomic) NSString *resultFromFirstController;

@property (retain,nonatomic) id <toThreeDelegate> delegate;

@end
