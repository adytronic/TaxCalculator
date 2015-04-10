//
//  ViewController.m
//  TaxCalculator
//
//  Created by Adriana Jimenez Mangas on 4/9/15.
//  Copyright (c) 2015 Adriana Jimenez Mangas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.myButton.layer.cornerRadius = 10.0;
}


- (IBAction)onCalculateButtonTapped:(UIButton *)sender {
  double tax = 0.0;
  switch (self.segmentedControl.selectedSegmentIndex) {
    case 0: {
      tax = 0.075;
      break; }
    case 1: {
      tax = 0.0925;
      break; }
    case 2: {
      tax = 0.045;
      break; }
  }
  double priceWithTax = [self.priceTextField.text doubleValue] * (1 + tax);
  NSString *priceWithTaxStr = [NSString stringWithFormat:@"%.2f", priceWithTax];
  NSNumber *total2Decimal = [NSNumber numberWithDouble:[priceWithTaxStr doubleValue]];
  NSString *totalThousandSeparator = [total2Decimal descriptionWithLocale:[NSLocale currentLocale]];

  self.resultLabel.text = [NSString stringWithFormat:@"Total +Tax:  $%@", totalThousandSeparator];
  [self.priceTextField resignFirstResponder];
}

# pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

@end










