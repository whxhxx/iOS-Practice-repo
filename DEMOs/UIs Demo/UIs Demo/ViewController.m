//
//  ViewController.m
//  UIs Demo
//
//  Created by WangHaixin on 16/4/28.
//  Copyright © 2016年 WangHaixin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@end
//----------
NSString *str = nil;
CMMotionManager *cmm ;


@implementation ViewController


-(void)viewWillAppear:(BOOL)animated
{
    cmm.accelerometerUpdateInterval = 1;
    if (cmm.accelerometerAvailable)
    {
        [cmm startAccelerometerUpdatesToQueue:[NSOperationQueue new] withHandler:^(CMAccelerometerData * _Nullable data, NSError * _Nullable err) {
            NSLog(@"%@",data);
        }];
        
    }
    else{
        NSLog(@"not avaiblable");
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    if(cmm.accelerometerActive)
    {
        [cmm stopAccelerometerUpdates];
    }
}

- (void)viewDidLoad
{
    cmm = [[CMMotionManager alloc] init];
    
    [super viewDidLoad];
    //self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 20, 200, 0)];
    [self.view setMultipleTouchEnabled:true];
    
    [self.view addSubview:self.img1];
    
    self.mySlider.maximumValue = 50;
    self.mySlider.minimumValue = 0 ;
    self.mySlider.value = 25;
    self.mySlider.minimumValueImage = [UIImage imageNamed:@"cat"];
    self.mySlider.maximumValueImage = [UIImage imageNamed:@"bear"];
    
//    [self.mySlider setMinimumTrackImage:[UIImage imageNamed:@"cat"] forState:UIControlStateNormal];
//    [self.mySlider setMaximumTrackImage:[UIImage imageNamed:@"bear"] forState:UIControlStateNormal];

    [self.mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    self.mySlider.continuous = YES;
    
    self.myStepper.minimumValue = 0;
    self.myStepper.maximumValue = 50;
    self.myStepper.value = 25;
    
    
    [self.mySegment addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
}

/* animation 1

 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [UIView  transitionWithView:_img1 duration:1.0 options:UIViewAnimationOptionTransitionNone animations:^{
        _img1.alpha = 0.5;
        _img1.center = CGPointMake(100, 200);
    } completion:^(BOOL finished) {
        NSLog(@"sss");
    }
        ];
}

/*animation2
 
 */
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationTransition:(UIViewAnimationTransitionCurlDown) forView:_img1 cache:true];
//    [UIView setAnimationDuration:1.0];
//    [UIView commitAnimations];
//    
//    
//   
//}

- (IBAction)goToInternet:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://baidu.com"]];
}

- (IBAction)doemail:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://whxhxx@126.com"]];
}
- (IBAction)dotext:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://10010"]];
}
- (IBAction)dophone:(id)sender
{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10010"]];
}

- (void)segmentValueChanged: (id) sender
{
    UISegmentedControl* control = (UISegmentedControl*)sender;
    if(control == _mySegment)
    {
        NSLog(@"%ld", (long)control.selectedSegmentIndex);
    }
}


- (void)sliderValueChanged: (id) sender
{
    UISlider* control = (UISlider*)sender;
    if(control == _mySlider)
    {
        [self isImageChange];
        NSLog( @"%f",self.mySlider.value);
    }
}

- (IBAction)buttonPressed:(id)sender
{
    self.mySlider.value += 10;
    [self isImageChange];

}

- (IBAction)stepperPressed:(id)sender
{
    NSLog(@"%f", _myStepper.value);
    self.mySlider.value = self.myStepper.value;
    [self isImageChange];
}


- (void) isImageChange
{
    if(self.mySlider.value >= 50)
    {
        self.mySlider.maximumValueImage = [UIImage imageNamed:@"bear-2"];
    }
    else
    {
        self.mySlider.maximumValueImage = [UIImage imageNamed:@"bear"];
    }
    if(self.mySlider.value <= 0)
    {
        self.mySlider.minimumValueImage = [UIImage imageNamed:@"cat-2"];
    }
    else
    {
        self.mySlider.minimumValueImage = [UIImage imageNamed:@"cat"];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
