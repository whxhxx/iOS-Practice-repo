//
//  NaviItem.m
//  团购项目
//
//  Created by WangHaixin on 16/5/27.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

#import "NaviItem.h"

@interface NaviItem ()

 

@end

@implementation NaviItem

+(instancetype)makeItem
{
    return [[[NSBundle mainBundle] loadNibNamed:@"NaviItem" owner:self options:nil]firstObject];
}

-(void)addtarget:(id)target action:(SEL)action
{
    [self.button addTarget:target action:action forControlEvents:
     UIControlEventTouchUpInside];
    
   
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
