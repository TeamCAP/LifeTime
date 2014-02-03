//
//  ViewController.h
//  LifeTime
//
//  Created by 佐々木公平 on 2014/01/30.
//  Copyright (c) 2014年 佐々木公平. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *heartRateTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
- (IBAction)calculateButtonTapped:(id)sender;

@end
