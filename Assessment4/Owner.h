//
//  Owner.h
//  Assessment4
//
//  Created by Eduardo Alvarado Díaz on 10/24/14.
//  Copyright (c) 2014 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Owner : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *dogs;
@end

@interface Owner (CoreDataGeneratedAccessors)

- (void)addDogsObject:(NSManagedObject *)value;
- (void)removeDogsObject:(NSManagedObject *)value;
- (void)addDogs:(NSSet *)values;
- (void)removeDogs:(NSSet *)values;

@end
