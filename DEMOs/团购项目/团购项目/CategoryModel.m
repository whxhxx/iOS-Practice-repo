//
//  CategoryModel.m
//  团购项目
//
//  Created by WangHaixin on 16/5/29.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

//加载plist文件
-(NSArray *) loadPlistData
{
    
    //获取plist文件地址
    NSString *file = [[NSBundle mainBundle] pathForResource:@"categories.plist" ofType:nil];
     //加载plist数组
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:file];
    NSArray *dataArray = [self getDataWithArray:plistArray];
    return dataArray;
}

//解析
-(NSArray *)getDataWithArray : (NSArray*) array
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in array)
    {
        CategoryModel *md = [[CategoryModel alloc]init];
        [md makeModelWithDict:dict];
        [arr addObject:md];
    }
    return arr;
}

//字典转模型
-(CategoryModel *)makeModelWithDict:(NSDictionary *) dict
{
    self.highlighted_icon = [dict objectForKey:@"highlighted_icon"];
    self.small_highlighted_icon = [dict objectForKey:@"small_highlighted_icon"];
    self.small_icon = [dict objectForKey:@"small_icon"];
    self.icon = [dict objectForKey:@"icon"];
    self.name = [dict objectForKey:@"name"];
    self.subcategories = [dict objectForKey:@"subcategories"];
    return self;
}

@end
