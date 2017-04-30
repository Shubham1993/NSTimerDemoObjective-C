//
//  ViewController.h
//  TimerDemo
//
//  Created by Shubham on 30/04/17.
//  Copyright © 2017 perpule. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIButton *startBtn;

- (IBAction)resumeTimer:(id)sender;

- (IBAction)startTimer:(id)sender;

- (IBAction)pauseTimer:(id)sender;

@end

