//
//  NaviItem.h
//  团购项目
//
//  Created by WangHaixin on 16/5/27.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NaviItem : UIView
@property (weak, nonatomic) IBOutlet UIButton *button;


+(instancetype)makeItem;

-(void)addtarget: (id)target action:(SEL)action;


@end
