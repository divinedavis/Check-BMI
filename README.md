# Check BMI
iOS app - A very easy way to input your weight and height to see what your BMI (body mass index) is. The very simple design allows you to use the text fields to input your weight and height. The height is converted to inches in the implementation file. When you are done with the specifications of your dimensions, you touch the 'Calculate' button and your BMI is displayed inside the view for the user. 

## App icon:
![alt tag](https://github.com/divinedavis/Check-BMI/blob/master/Icons%20all%20dimensions/1024x1024.png)

## Splash screen:
![alt tag](https://github.com/divinedavis/Check-BMI/blob/master/Splash%20screens/750x1334.png)

## Main screen (will be changed to soon):

![alt tag](https://github.com/divinedavis/Body-Mass-Index/blob/master/My%20BMI%20Graphics/Screen%20copy.png)

```objective-c
//
//  ViewController.m
//  My BMI
//
//  Created by Divine Davis on 3/22/15.
//  Copyright (c) 2015 Divine Davis. All rights reserved.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    //Ends the editing when you touch a part of the view that isnt a field
    [self.view endEditing:YES];
    
    //Changed the background color to an image I uploaded
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];
    self.workoutButton.hidden = NO;
        
 }

- (void)didReceiveMemoryWarning {
  
}

- (IBAction)calculateButton:(UIButton *)sender {
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
        self.scrollingInfo.text = @"You're obese. Please consult a doctor. There are a number of reasons for this. Eating in           smaller portions will help, along with exercising.";
        self.indexHeader.text = @"Very High BMI";
        
    //When you touch the 'calculate' button, it reveals the 'workouts' button
    //self.workoutButton.hidden = NO;
    }
    //If your BMI is between these numbers, you'll be prompted with this text
    else if (BMI >= 25 && BMI <= 29.9) {
        self.scrollingInfo.text = @"Your BMI is too high. Try exercising more. This number does not calculate your muscle mass         to fat ratio.";
        self.indexHeader.text = @"High BMI";
        
    //When you touch the 'calculate' button, it reveals the 'workouts' button
    //self.workoutButton.hidden = NO;
         }
    
    //If your BMI is between these numbers, you'll be prompted with this text
        else if (BMI >= 18.5 && BMI <= 24.9) {
            self.scrollingInfo.text = @"Your BMI is perfect. Continue to eat and excersice regularly. You're doing a great job,             keep it up.";
            self.indexHeader.text = @"Perfect BMI";
        }
    
    //I'm using scrollingInfo for the information you see when you BMI is calculated & the indexHeader for the label that tells         you if you have a low or high BMI
        else if (BMI >= 15.4 && BMI <= 18.4){
            self.scrollingInfo.text = @"You're skinny. In order for you to increase your BMI, try eating 3 healthy meals a                 day.";
            self.indexHeader.text = @"Low BMI";
        }
    
    //Using an else statement to output text to the scrollingInfo text view
        else {
            self.scrollingInfo.text = @"You're underweight. You could try eating in higher porportions.";
            self.indexHeader.text = @"Very Low BMI";
        }
  
    
}
@end
```
