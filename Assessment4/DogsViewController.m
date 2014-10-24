//
//  DogsViewController.m
//  Assessment4
//
//  Created by Vik Denic on 8/11/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import "DogsViewController.h"
#import "AddDogViewController.h"
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
    if (self.dogs == nil) {
        self.dogs = [[NSMutableArray alloc]init];
    }
}

-(void)loadDogData{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Dog"];
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];

    request.sortDescriptors = [NSArray arrayWithObjects:sortDescriptor1, nil];
    NSArray *doggies = [self.managedObjectContext executeFetchRequest:request error:nil];
    self.dogs = [NSMutableArray arrayWithArray:doggies];

    NSLog(@"Dogs: %lu",self.dogs.count);
    if (self.dogs.count == 0) {

    }

    [self.dogsTableView reloadData];
}

-(void)saveDogWithName:(NSString *)name breed:(NSString *)breed color:(NSString *)color{
    Dog *dog = [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:self.managedObjectContext];
    dog.name = name;
    dog.breed = breed;
    dog.color = color;

    [self.managedObjectContext save:nil];
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

    return cell;
}

#pragma mark - Segue

-(IBAction)unwindFromAddDogViewController:(UIStoryboardSegue*)segue{
    NSLog(@"Unwind");
    if ([segue.sourceViewController isKindOfClass:[AddDogViewController class]]) {
        AddDogViewController *viewController = segue.sourceViewController;
        if (viewController.name && viewController.breed && viewController.color) {
            [self.dogs addObject:viewController.name];
            [self.dogsTableView reloadData];
            [self saveDogWithName:viewController.name breed:viewController.breed color:viewController.color];
        }
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"AddDogSegue"])
    {
        NSLog(@"Add a dog");
    }
    else
    {
        NSLog(@"other identifier");
    }
}

@end
