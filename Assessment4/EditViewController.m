//
//  EditViewController.m
//  Assessment4
//
//  Created by Eduardo Alvarado Díaz on 10/24/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "EditViewController.h"
#import "Dog.h"

@interface EditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *breedTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Edit Dog";

    self.nameTextField.text = self.dog.name;
    self.breedTextField.text = self.dog.breed;
    self.colorTextField.text = self.dog.color;
}

- (IBAction)saveButtonPressed:(UIBarButtonItem *)sender {
    [self.dog setName:self.nameTextField.text];
    [self.dog setBreed:self.breedTextField.text];
    [self.dog setColor:self.colorTextField.text];

    [self.owner.managedObjectContext save:nil];
    [self performSegueWithIdentifier:@"cancelEdit" sender:self];
    //[self dismissViewControllerAnimated:YES completion:nil];

}

@end
