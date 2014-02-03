//
//  ViewController.m
//  LifeTime
//
//  Created by 佐々木公平 on 2014/01/30.
//  Copyright (c) 2014年 佐々木公平. All rights reserved.
//

#import "ViewController.h"

#define kMaxHeartRate 2000000000

@interface ViewController ()

@end

@implementation ViewController
{
    UILabel *lifeTimeLabel;
}

-(id)init{
    self = [super init];
    if(!self){
        return nil;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    lifeTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 280, 50)];
    [self.view addSubview:lifeTimeLabel];
    [lifeTimeLabel setHidden:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculateButtonTapped:(id)sender {
    
    int heartRate = [self.heartRateTextField.text intValue];
    int age = [self.ageTextField.text intValue];
    NSLog(@"heartRate %d", heartRate);
    int remainLifeTimeMin = [self calculataRemainLifeTimeMinWithHeartRate:heartRate age:age];
    
    NSLog(@"remaining LifeTime[min]: %d分", remainLifeTimeMin);
    NSLog(@"remaining LifeTime[sec]: %d秒", remainLifeTimeMin*60);
    
    NSLog(@"remaining LifeTime[hour]: %d時間", remainLifeTimeMin/60);
    NSLog(@"remaining LifeTime[day]: %d日", remainLifeTimeMin/60/24);
    NSLog(@"remaining LifeTime[year]: %d年と%d日", remainLifeTimeMin/60/24/365, remainLifeTimeMin/60/24%365);

    [self showLifeTimeAnimation];
    
    return;
}

- (int)calculataRemainLifeTimeMinWithHeartRate:(int)heartRate age:(int)age
{
    //残寿命[min]を計算
    int remainLifeTimeMin = (kMaxHeartRate/heartRate) - age*365*24*60;
    return remainLifeTimeMin;
}

//ここにアニメーション
-(void)showLifeTimeAnimation
{
    [lifeTimeLabel setAlpha:0.0];
    lifeTimeLabel.hidden = NO;
    
    [UIView animateKeyframesWithDuration:0.5 delay:0.0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
        [self.heartRateTextField setAlpha:0.0];
        [self.ageTextField setAlpha:0.0];
        [lifeTimeLabel setAlpha:1.0];
    } completion:^(BOOL finished){
        self.heartRateTextField.hidden = YES;
        [self.ageTextField setHidden:YES];
        lifeTimeLabel.text = [NSString stringWithFormat:@"%d",
        [self calculataRemainLifeTimeMinWithHeartRate:[self.heartRateTextField.text intValue] age:[self.ageTextField.text intValue]] ];
    }];
}

@end
