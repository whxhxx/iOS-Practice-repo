//
//  pop_view.h
//  团购项目
//
//  Created by WangHaixin on 16/5/29.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pop_view : UIView

+(pop_view*)makePopView;
@property (nonatomic, strong) NSArray *categoryArr;

@end
