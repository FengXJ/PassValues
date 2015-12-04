//
//  ThreeWay.m
//  页面传值demo
//
//  Created by 冯学杰 on 15/12/3.
//  Copyright © 2015年 冯学杰. All rights reserved.
//

#import "ThreeWay.h"
#import "FourWay.h"
#import "AppDelegate.h"
#import "Values.h"


@interface ThreeWay ()

@property (strong, nonatomic) IBOutlet UITextField *toFourTextField;

@property (strong, nonatomic) IBOutlet UITextField *threeTextField;

@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong,nonatomic) NSString *resultFromSecond;

@property (strong, nonatomic) IBOutlet UITextField *coredataTextField;

@property (strong, nonatomic) IBOutlet UITextField *shaheTextField;

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
//delegate
-(void)toThree:(NSString *)value{
    self.resultFromSecond = value;
}
//block
- (IBAction)toSecond:(id)sender {
    if (self.MyBlock) {
        self.MyBlock(self.threeTextField.text);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
//noti
- (IBAction)toSecondByNoTi:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:self.toFourTextField.text userInfo:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}
- (IBAction)toFour:(id)sender {
    if (self.shaheTextField.text!=nil) {

        NSString *home = NSHomeDirectory();
        NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
        NSArray *data = @[[NSString stringWithFormat:@"%@",self.shaheTextField.text]];
        NSString *filepath = [docPath stringByAppendingPathComponent:@"MyPlist.plist"];
        [data writeToFile:filepath atomically:YES];
    }
    if (self.coredataTextField.text!=nil) {
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        Values *MYvalue = nil;
         MYvalue = [NSEntityDescription insertNewObjectForEntityForName:@"Values" inManagedObjectContext:app.managedObjectContext];
        MYvalue.value = self.coredataTextField.text;
        NSError *error;
        if ([app.managedObjectContext save:&error] ) {
            NSLog(@"保存成功");
        }
        else {
            NSLog(@"添加出错 %@",error);
        }
        
    }
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FourWay *threeController = [[FourWay alloc]init];
    threeController = [storyBoard instantiateViewControllerWithIdentifier:@"four"];
    [self presentViewController:threeController animated:YES completion:nil];
}



@end
