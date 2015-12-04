//
//  SecondWay.m
//  页面传值demo
//
//  Created by 冯学杰 on 15/12/3.
//  Copyright © 2015年 冯学杰. All rights reserved.
//

//第二种 通过代理传值
#import "SecondWay.h"
#import "ThreeWay.h"

@interface SecondWay ()
@property (strong, nonatomic) IBOutlet UILabel *resultFromfirstLabel;
@property (strong, nonatomic) IBOutlet UITextField *secondTextField;
@property (strong, nonatomic) IBOutlet UILabel *resultFromThreeLabel;
@property (strong, nonatomic) IBOutlet UILabel *notiFromThree;

@end

@implementation SecondWay

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.resultFromfirstLabel.text = self.resultFromFirstController;
    //消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"noti" object:nil];
    
}
-(void)receiveNotification:(NSNotification *)noti{
    self.notiFromThree.text = noti.object;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)toThree:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThreeWay *threeController = [[ThreeWay alloc]init];
    threeController = [storyBoard instantiateViewControllerWithIdentifier:@"three"];
    self.delegate = threeController;
    [self.delegate toThree:self.secondTextField.text];
    
    //block
    threeController.MyBlock = ^(NSString *tfText){
        self.resultFromThreeLabel.text = tfText;
    };

    [self presentViewController:threeController animated:YES completion:nil];
}



@end
