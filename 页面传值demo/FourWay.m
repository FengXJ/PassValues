//
//  FourWay.m
//  页面传值demo
//
//  Created by 冯学杰 on 15/12/4.
//  Copyright © 2015年 冯学杰. All rights reserved.
//

#import "FourWay.h"
#import "AppDelegate.h"
#import "Values.h"

@interface FourWay ()
@property (strong, nonatomic) IBOutlet UILabel *shaheLabel;
@property (strong, nonatomic) IBOutlet UILabel *coreLabel;

@end

@implementation FourWay

- (void)viewDidLoad {
    [super viewDidLoad];
    [self coredata];
    [self shahe];

}
-(void)coredata{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    //查找数据 创建实体对象
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Values" inManagedObjectContext:app.managedObjectContext];
    //创建抓取数据的对象
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setPredicate: [NSPredicate predicateWithFormat:@"value!=nil"]];
    
    NSError *error = nil;
    NSArray *array = [ app.managedObjectContext executeFetchRequest:request error:&error];
    if(array.count != 0){
        Values *myValue = nil;
        myValue =[array objectAtIndex:array.count -1];
        self.coreLabel.text = myValue.value;
    }
}
-(void)shahe{
    NSString *home = NSHomeDirectory();
    NSString *docPath = [home stringByAppendingPathComponent:@"Documents"];
    NSString *filepath = [docPath stringByAppendingPathComponent:@"MyPlist.plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:filepath];
    if (data.count!=0) {
        self.shaheLabel.text = [data objectAtIndex:0];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
