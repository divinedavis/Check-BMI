//
//  ViewController.m
//  Check BMI
//
//  Created by Divine Davis on 5/11/15.
//  Copyright (c) 2015 Portfolio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //Ends the editing when you touch a part of the view that isnt a field
    [self.view endEditing:YES];
    
   
    
    //Manually changed the indexHeader, scrollingInfo, & resultsLabel font to match the design
    self.indexHeader.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:25];
    self.scrollingInfo.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    self.resultsLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:34];
    self.BMILabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:34];
    self.resultsLabel.textColor = [UIColor redColor];
    [self.metricConversionSwitch addTarget:self action:@selector(setOn:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)didReceiveMemoryWarning {
}

- (IBAction)calculateButton:(UIButton *)sender {
    
    //When you touch the button the workouts button reveals itself
    self.workoutsButton.hidden = NO;

    
    //Takes in the weight value
    float weight = [self.enteredWeight.text intValue];
    
    //Takes in the height value in feet
    float heightInFeet = [self.enteredHeightInFeet.text intValue];
    
    //Takes in the height value in inches
    float heightInInches = [self.enteredHeightInInches.text intValue];
  
    //New variable
    float height;
    
    //New variable
    float feetInInches;
    
    //Converting the feet input to inches
    feetInInches = heightInFeet * 12;
    
    //Sets the converted height to 'height'
    height = feetInInches + heightInInches;
    
    //Sets the calculations to the 'BMI'
    float BMI = ((weight * 703)/(height * height));
    
    //Setting the 'resultsLabel' to a string, but I simply put a float placeholder and passed the 'BMI'
    self.resultsLabel.text = [NSString stringWithFormat:@"%.1f",BMI];
    
    //After you hit the button, the keyboard goes away
    [self.view endEditing:YES];
    
    
    //If your BMI is too high, you'll be given this text information
    if (BMI > 30) {
        self.scrollingInfo.text = @"You're obese. Please consult a doctor. There are a number of reasons for this. Eating in smaller portions will help, along with exercising.";
        self.indexHeader.text = @"Very High BMI";
        
        
        }
    //If your BMI is between these numbers, you'll be prompted with this text
    else if (BMI >= 25 && BMI <= 29.9) {
        self.scrollingInfo.text = @"Your BMI is too high. Try exercising more. This number does not calculate your muscle mass to fat ratio.";
        self.indexHeader.text = @"High BMI";
        
    }
    
    //If your BMI is between these numbers, you'll be prompted with this text
    else if (BMI >= 18.5 && BMI <= 24.9) {
        self.scrollingInfo.text = @"Your BMI is perfect. Continue to eat and excersice regularly. You're doing a great job, keep it up.";
        self.indexHeader.text = @"Perfect BMI";
    }
    
    //I'm using scrollingInfo for the information you see when you BMI is calculated & the indexHeader for the label that tells you if you have a low or high BMI
    else if (BMI >= 15.4 && BMI <= 18.4){
        self.scrollingInfo.text = @"You're skinny. In order for you to increase your BMI, try eating 3 healthy meals a day.";
        self.indexHeader.text = @"Low BMI";
    }
    
    //If you don't put in a value or nil
    else if (BMI == 0) {
        self.scrollingInfo.text = @"Put in a value";
        self.indexHeader.text = @"";
    }
    
    //Using an else statement to output text to the scrollingInfo text view
    else {
        self.scrollingInfo.text = @"You're underweight. You could try eating in higher porportions.";
        self.indexHeader.text = @"Very Low BMI";
    }
    
    //If the height in feet is greater than 8 feet, you get an error message
    if (heightInFeet > 8) {
        self.scrollingInfo.text = @"I'm pretty sure you're not the tallest person who has ever lived! Stop lying! Now try this again & enter your correct height";
        self.indexHeader.text = @"Error";
        self.indexHeader.textColor = [UIColor redColor];
    }
    
    //If the weight is over 400 lbs, then I think you should go to a doctor
    if (weight > 400) {
        self.scrollingInfo.text = @"You need to see a doctor";
        self.indexHeader.text = @"Woah";
        self.indexHeader.textColor = [UIColor redColor];
    }
    
    //If the height in inches is over 12, throw an error message
    if (heightInInches > 12) {
        self.scrollingInfo.text = @"You should use a number that is less than 13 to get the best results";
        self.indexHeader.text = @"Error";
        self.indexHeader.textColor = [UIColor redColor];
     
    }
    
    
    
    
    
    

    
}

- (void)setOn:(BOOL)metricConversionSwitch
     animated:(BOOL)animated {
    self.enteredWeight.hidden = YES;
    self.enteredHeightInInches.hidden = YES;
    self.enteredHeightInFeet.hidden = YES;
    
    
}


@end
