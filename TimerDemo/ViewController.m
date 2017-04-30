//
//  ViewController.m
//  TimerDemo
//
//  Created by Shubham on 30/04/17.
//  Copyright © 2017 perpule. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSTimer *timer;
    int sec,min,hr;
    BOOL isPause;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    sec = 0;
    min = 0;
    hr = 0;
    isPause = false;
    [self.startBtn setTitle:@"Start" forState:UIControlStateNormal];
    
}

- (IBAction)resumeTimer:(id)sender {
    
    if(isPause == true && ![self.timeLabel.text isEqualToString:@"00:00:00"]){
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
        isPause = false;
    }
}


-(void)timerFunc{
    
    if (sec<59) {
        sec++;
    }
    else{
        sec=0;
        min++;
    }
    if (min==60) {
        min = 0;
        hr++;
    }
    self.timeLabel.text = [NSString stringWithFormat:@"%d:%d:%d",hr,min,sec];
}

- (IBAction)startTimer:(id)sender {
    
    if ([self.startBtn.titleLabel.text isEqualToString:@"Start"]) {
        [self.startBtn setTitle:@"Reset" forState:UIControlStateNormal];
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
    }
    else{
        [self.startBtn setTitle:@"Start" forState:UIControlStateNormal];
        min = 0;
        hr = 0;
        sec = 0;
        self.timeLabel.text = @"00:00:00";
        [timer invalidate];
    }
}


- (IBAction)pauseTimer:(id)sender {
    if (![self.timeLabel.text isEqualToString:@"00:00:00"]) {
        isPause = true;
        [timer invalidate];

    }else
        isPause = false;
}
@end
