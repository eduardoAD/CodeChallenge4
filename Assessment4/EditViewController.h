//
//  EditViewController.h
//  Assessment4
//
//  Created by Eduardo Alvarado Díaz on 10/24/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Owner.h"
#import "Dog.h"

@interface EditViewController : UIViewController

@property (strong, nonatomic) Owner *owner;
@property (strong, nonatomic) Dog *dog;

@end
