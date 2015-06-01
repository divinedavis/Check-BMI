//
//  ViewController.h
//  Check BMI
//
//  Created by Divine Davis on 5/11/15.
//  Copyright (c) 2015 Portfolio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


//The label that shows you your BMI number
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;

//The field where you enter your weight
@property (weak, nonatomic) IBOutlet UITextField *enteredWeight;

//The field where you enter your height in feet
@property (weak, nonatomic) IBOutlet UITextField *enteredHeightInFeet;

//The field where you enter your height in inches
@property (weak, nonatomic) IBOutlet UITextField *enteredHeightInInches;

//The text that says if you're overweight or underweight for your height
@property (weak, nonatomic) IBOutlet UILabel *indexHeader;

//The text that allows you to scroll down to see more information about your BMI
@property (weak, nonatomic) IBOutlet UITextView *scrollingInfo;

//Your BMI calculations
@property (nonatomic) float BMI;

//BMI Label
@property (weak, nonatomic) IBOutlet UILabel *BMILabel;

//The hidden workout button that appears when you touch the calculate button
@property (weak, nonatomic) IBOutlet UIButton *workoutsButton;
@property (weak, nonatomic) IBOutlet UISwitch *metricConversionSwitch;
@property(nonatomic, getter=isOn) BOOL on;
@property (weak, nonatomic) IBOutlet UITextField *heightInMeters;
@property (weak, nonatomic) IBOutlet UITextField *weightInKilograms;


//The 'Calculate' button action
- (IBAction)calculateButton:(UIButton *)sender;




@end

