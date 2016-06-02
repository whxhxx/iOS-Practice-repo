//
//  PopViewController.m
//  团购项目
//
//  Created by WangHaixin on 16/5/29.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

#import "PopViewController.h"
#import "pop_view.h"
#import "CategoryModel.h"

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    pop_view *pop = [pop_view makePopView];
    [self.view addSubview:pop];
    
    pop.categoryArr = [self getData];
    pop.autoresizingMask = UIViewAutoresizingNone;
    self.preferredContentSize = CGSizeMake(pop.frame.size.width, pop.frame.size.height);
 }

-(NSArray *) getData
{
    CategoryModel *md = [[CategoryModel alloc]init];
    NSArray *categoryArray =  [md loadPlistData];
    return categoryArray;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
