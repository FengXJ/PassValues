//
//  Values+CoreDataProperties.h
//  页面传值demo
//
//  Created by 冯学杰 on 15/12/4.
//  Copyright © 2015年 冯学杰. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Values.h"

NS_ASSUME_NONNULL_BEGIN

@interface Values (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *value;

@end

NS_ASSUME_NONNULL_END
