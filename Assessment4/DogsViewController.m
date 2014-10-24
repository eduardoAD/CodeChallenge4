//
//  DogsViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "DogsViewController.h"
#import "AddDogViewController.h"
#import "EditViewController.h"
#import "Dog.h"

@interface DogsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *dogsTableView;
@property NSMutableArray *dogs;

@end

@implementation DogsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dogs";
    [self loadDogData];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self loadDogData];
}

-(void)loadDogData{
    self.dogs = [NSMutableArray arrayWithArray:[self.owner.dogs allObjects]];
    //NSLog(@"Dogs: %lu",self.dogs.count);

    [self.dogsTableView reloadData];
}

#pragma mark - UITableView Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dogs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dogCell"];

    Dog *doggy = [self.dogs objectAtIndex:indexPath.row];
    cell.textLabel.text = doggy.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@",doggy.breed,doggy.color];

    return cell;
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"AddDogSegue"])
    {
        AddDogViewController *viewController = segue.destinationViewController;
        viewController.owner = self.owner;
    }else{
        EditViewController *viewController = segue.destinationViewController;
        Dog *dog = [self.dogs objectAtIndex:self.dogsTableView.indexPathForSelectedRow.row];
        viewController.dog = dog;
        viewController.owner = self.owner;
    }
}

-(IBAction)unwindFromEditViewController:(UIStoryboardSegue *)segue{
    
}

@end
