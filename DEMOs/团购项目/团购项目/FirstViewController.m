//
//  FirstViewController.m
//  团购项目
//
//  Created by WangHaixin on 16/5/27.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//继承 collectionView

#import "FirstViewController.h"
#import "NaviItem.h"
#import "PopViewController.h"

@interface FirstViewController ()
{
    UIBarButtonItem *firstItem;
    UIBarButtonItem *secondItem;
    UIBarButtonItem *thirdItem;
}

@end

@implementation FirstViewController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    return [self initWithCollectionViewLayout:layout];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createNavigationBar];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}


#pragma mark - 创建导航栏
-(void) createNavigationBar
{
    //1 logo
    UIBarButtonItem *logo = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
  //  self.navigationItem.leftBarButtonItem = logo;
    
    
    //2 右边按钮
    NaviItem *naviItem1 = [NaviItem makeItem];
    NaviItem *naviItem2 = [NaviItem makeItem];
    NaviItem *naviItem3 = [NaviItem makeItem];
    
    [naviItem1 addtarget:self action:@selector(firstClick)];
    [naviItem2 addtarget:self action:@selector(secondClick)];
    [naviItem3 addtarget:self action:@selector(thirdClick)];

    
    self->firstItem = [[UIBarButtonItem alloc] initWithCustomView:naviItem1];
    
    self->secondItem = [[UIBarButtonItem alloc] initWithCustomView:naviItem2];

    self->thirdItem = [[UIBarButtonItem alloc] initWithCustomView:naviItem3];

    
    self.navigationItem.leftBarButtonItems = @[logo,firstItem,secondItem,thirdItem];
    
}

#pragma mark - 点击事件

-(void) firstClick
{
     [self createPopover];
}
-(void) secondClick
{
     [self createPopover];
}
-(void) thirdClick
{
     [self createPopover];
}


#pragma mark - 下拉菜单
-(void) createPopover
{
    PopViewController *popvc = [[PopViewController alloc]init]; //uiViewController
    
    UIPopoverController *pop = [[UIPopoverController alloc] initWithContentViewController:popvc];
    
    [pop presentPopoverFromBarButtonItem:firstItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES ];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
