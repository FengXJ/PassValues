//
//  FirstWay.m
//  页面传值demo
//
//  Created by 冯学杰 on 15/12/3.
//  Copyright © 2015年 冯学杰. All rights reserved.
//

//第一种 通过属性， 页面传递传值

#import "FirstWay.h"
#import "SecondWay.h"

@interface FirstWay ()
@property (strong, nonatomic) IBOutlet UITextField *firstTextField;

@end

@implementation FirstWay

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toSecondController:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecondWay *secondController = [[SecondWay alloc]init];
    secondController = [storyBoard instantiateViewControllerWithIdentifier:@"second"];
    secondController.resultFromFirstController = self.firstTextField.text;
    
    [self presentViewController:secondController animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
