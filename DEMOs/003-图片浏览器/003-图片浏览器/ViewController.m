//
//  ViewController.m
//  003-图片浏览器
//
//  Created by dyf on 14/10/31.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) NSArray *imageDicts;

@end

@implementation ViewController

- (NSArray *)imageDicts
{
    if (!_imageDicts) {
        
        NSString *path1 = [[NSBundle mainBundle] pathForResource:@"imageDate.plist" ofType:nil] ;
        _imageDicts = [NSArray arrayWithContentsOfFile:path1];
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageDate.plist" ofType:nil];
        _imageDicts = [NSArray arrayWithContentsOfFile:path];
    }
    return _imageDicts;
}



- (IBAction)leftBtnOnClick:(UIButton *)sender
{
    self.index --;
    
    [self btnClickChange];
    
}
- (IBAction)rightBtnOnClick:(id)sender {
    self.index ++;
    
    [self btnClickChange];
}

- (void)btnClickChange
{
    self.topLabel.text = [NSString stringWithFormat:@"%d/%lu", (self.index + 1), (unsigned long)self.imageDicts.count];
    
    
    self.descLabel.text = self.imageDicts[self.index][@"description"];
    
    self.imageView.image = [UIImage imageNamed:self.imageDicts[self.index][@"name"]];
    
    self.leftBtn.enabled = (self.index != 0);
    self.rightBtn.enabled = (self.index != 4);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
