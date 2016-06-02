//
//  pop_view.m
//  团购项目
//
//  Created by WangHaixin on 16/5/29.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

#import "pop_view.h"
#import "CategoryModel.h"

@interface pop_view()<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *leftTV;
@property (weak, nonatomic) IBOutlet UITableView *rightTV;
@property (strong, nonatomic) CategoryModel *selectedModel;

@end

@implementation pop_view


+(pop_view *)makePopView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"pop_view" owner:self options:nil]firstObject];
}

//-(void)setCategoryArr:(NSArray *)categoryArr
//{
//    self.categoryArr = categoryArr;
//}

#pragma mark - tableview delegate
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == _leftTV)
    {
        return self.categoryArr.count;
    }
    else
    {
        return self.selectedModel.subcategories.count;
    }
        
}

-(UITableViewCell *)   tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _leftTV)
    {
        static NSString *str = @"Mycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str ];
        }
        
        
        CategoryModel *md = [self.categoryArr objectAtIndex:indexPath.row];
        cell.textLabel.text = md.name;
        cell.imageView.image = [UIImage imageNamed:[md small_icon]];
        
        if(md.subcategories.count)
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        return cell;
    }
    else
    {
        static NSString *str = @"Mycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str ];
        }
        cell.textLabel.text = _selectedModel.subcategories[indexPath.row];
        return cell;
    }
  
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _leftTV)
    {
        self.selectedModel = [_categoryArr objectAtIndex:indexPath.row];
        [_rightTV reloadData];
    }
    
}




@end
