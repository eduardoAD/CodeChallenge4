//
//  AddDogViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "AddDogViewController.h"

@interface AddDogViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *breedTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;

@end

@implementation AddDogViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Add Dog";
}


- (IBAction)onPressedUpdateDog:(UIButton *)sender
{
    self.name = self.nameTextField.text;
    self.breed = self.breedTextField.text;
    self.color = self.colorTextField.text;

    [self performSegueWithIdentifier:@"saveDog" sender:self];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

@end
