//
//  AddDogViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "AddDogViewController.h"
#import "Dog.h"

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
    Dog *doggy = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.owner.managedObjectContext];

    doggy.name = self.nameTextField.text;
    doggy.breed = self.breedTextField.text;
    doggy.color = self.colorTextField.text;
    doggy.myOwner = self.owner;

    [self.owner.managedObjectContext save:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
