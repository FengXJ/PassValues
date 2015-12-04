//
//  ThreeWay.m
//  页面传值demo
//
//  Created by 冯学杰 on 15/12/3.
//  Copyright © 2015年 冯学杰. All rights reserved.
//

#import "ThreeWay.h"


@interface ThreeWay ()

@property (strong, nonatomic) IBOutlet UITextField *toFourTextField;
@property (strong, nonatomic) IBOutlet UITextField *threeTextField;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong,nonatomic) NSString *resultFromSecond;
@end

@implementation ThreeWay

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.resultLabel.text = self.resultFromSecond;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)toThree:(NSString *)value{
    self.resultFromSecond = value;
    
}
- (IBAction)toSecond:(id)sender {
    if (self.MyBlock) {
        self.MyBlock(self.threeTextField.text);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)toSecondByNoTi:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:self.toFourTextField.text userInfo:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}



@end
