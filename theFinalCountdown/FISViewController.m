//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//
/*
 
 Users should be able to select hours and minutes.
 The Pause button should be disabled by default. When you hit Start, the countdown should start and the Start button should turn into Cancel.
 During the countdown the Pause button will be enabled and should pause, not reset the countdown timer.
 
 
 */


#import "FISViewController.h"

@interface FISViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property(nonatomic) NSTimeInterval interval;
@property(strong, nonatomic)NSTimer * timer;
@property(strong, nonatomic)NSDate * date;
@property(strong, nonatomic)NSString * timerDisplay;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property(nonatomic) NSUInteger x;


-(IBAction)timerPicker:(id)sender;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.date = [NSDate date];
    [self.startButton setTitle:@"START" forState:UIControlStateNormal];
    self.timeLabel.text = self.timerDisplay;

}


-(IBAction)startButton:(id)sender{
    
    self.timePicker.hidden = YES;
    [self.startButton setTitle:@"Cancel" forState:UIControlStateNormal];
    self.pauseButton.hidden = NO;
    self.pauseButton.enabled = YES;
    
    self.interval = self.timePicker.countDownDuration;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(startTimer)
                                   userInfo:nil
                                    repeats:YES];
    
    
    
    
    
    
    
    
    //NSLog(@"Timer>>%f",self.interval);

}

-(NSString *)startTimer{
    self.x = 1;
    self.interval -= self.x;
    if (self.interval == 0) {
        self.interval = 0;
        [self.startButton setTitle:@"start" forState:UIControlStateNormal];
    }
    NSUInteger seconds = ABS((int)self.interval);
    NSUInteger minutes = seconds/60;
    NSUInteger hours = minutes/60;
    self.timerDisplay = [NSString stringWithFormat:@"%02lu:%02lu:%02lu", (unsigned long)hours, minutes%60, seconds%60];
    NSLog(@"Timer>>%f >> %@", self.interval, self.timerDisplay);
    self.timeLabel.text = self.timerDisplay;
    
    return self.timerDisplay;
}




-(IBAction)pauseButton:(id)sender{
    
    self.date = nil;
    [self.startButton setTitle:@"start" forState:UIControlStateNormal];
    [self.timer invalidate];
    //self.x = 0;
    //self.interval = self.timePicker.countDownDuration;
    
}


- (IBAction)timerPicker:(id)sender {
    
    //NSDateFormatter *timerFormat = [[NSDateFormatter alloc] init];
    
    //NSString * formatedTime = self.
    
    
    /*

     
     NSDate *pickerDate = [_datePicker date];
     NSString *selectionString = [[NSString alloc]
     initWithFormat:@"%@",
     [pickerDate descriptionWithLocale:usLocale]];
     _dateLabel.text = selectionString;
     
     */
    
    /*
    self.timePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    self.interval = 10.0;
    self.timePicker.countDownDuration = self.interval;
    NSLog(@"Test the timer %f",self.timePicker.countDownDuration);
    
    [self.timePicker addTarget:self
                          action:@selector(timerTest)
                forControlEvents:UIControlEventValueChanged];
    
    
    */
    
    
    //self.timePicker.date;
    //[self.date description];
    
}




-(void)timerTest{
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //lf.date = [NSDate date];
    [calendar components:(NSCalendarUnitHour | NSCalendarUnitSecond) fromDate:self.date];

    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(startTimer)
                                   userInfo:nil
                                    repeats:YES];
}





@end
