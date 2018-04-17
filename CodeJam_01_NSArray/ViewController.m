//
//  ViewController.m
//  CodeJam_01_NSArray
//
//  Created by anthony volkov on 4/15/18.
//  Copyright © 2018 anthony volkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @autoreleasepool {
        
#pragma mark - 1. Create NSArray, containing several strings, using literal declaration.
        NSArray *immutableArray = @[@"bob", @"dan", @"walt", @"bill"];
        
        
        
#pragma mark - 2. Create mutable array from piviously created NSArray.
        NSMutableArray *mutableArrayFromImmutableArray = [immutableArray mutableCopy];
        NSLog(@"is mutableArrayFromImmutableArray kind of NSMutableArray class? - %@",
              [mutableArrayFromImmutableArray isKindOfClass:[NSMutableArray class]] ? @"yes" : @"no");
        
        [mutableArrayFromImmutableArray release];
        
        
        
#pragma mark - 3. Create an empty array and obtain its first and last element in a safe way.
        NSArray *emptyArray = @[];
        [emptyArray firstObject];
        [emptyArray lastObject];
        
        
        
#pragma mark - 4. Create NSArray, containing strings from 1 to 20.
        NSMutableArray *templateArray = [@[] mutableCopy];
        for (int q = 1; q <= 20; q++) {
            [templateArray addObject:[NSNumber numberWithInt:q]];
        }
        NSArray *arrayWithTwentyItems = [NSArray arrayWithArray:templateArray];
        [templateArray release];
        
        
        
#pragma mark - 5. Get its shallow copy and real deep copy.
        NSArray *shallowCopyArrayWithTwentyItems = [[NSArray alloc] initWithArray:arrayWithTwentyItems copyItems:YES];
        [shallowCopyArrayWithTwentyItems release];
        NSArray *realDeepCopyArrayWithTwentyItems = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:arrayWithTwentyItems]];
        
        
        
        
#pragma mark - 6. Iterate over array and obtain item at index 13. Print an item.
            int indexPrintingItem = 13;
            if ([arrayWithTwentyItems count] > indexPrintingItem) {
                [arrayWithTwentyItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    if (idx == indexPrintingItem) {
                        NSLog(@"index item - %ld, item - %@", idx, [arrayWithTwentyItems objectAtIndex:idx]);
                        *stop = YES;
                    }
                }];
            }else{
                NSLog(@"arrayWithTwentyItems haven't so much items");
            }
        
        
        
        
#pragma mark - 7. Make array mutable. Add two new entries to the end of the array, add an entry to the beginning of the array. Iterate over an array and remove item at index 5.
        NSMutableArray *mutableArray = [@[@"brad", @"mike", @"will"] mutableCopy];
        [mutableArray addObject:@"zoy"];
        [mutableArray addObject:@"ron"];
        [mutableArray insertObject:@"nick" atIndex:0];
        
        //removing item at index 5
        //first way:
        //    int indexRemovingItem1 = 5;
        //    if ([mutableArray count]-1 >= indexRemovingItem1) {
        //        for (int q = 0; q <= [mutableArray count]; q++) {
        //            if (q == indexRemovingItem1) {
        //                [mutableArray removeObjectAtIndex:q];
        //                break;
        //            }
        //        }
        //    }else{
        //        NSLog(@"mutableArray haven't so much items");
        //    }
        
        //second way:
            int indexRemovingItem2 = 5;
            if ([mutableArray count] > indexRemovingItem2) {
                [mutableArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    if (idx == indexRemovingItem2) {
                        [mutableArray removeObjectAtIndex:idx];
                       *stop = YES;
                    }
                }];
            }else{
                NSLog(@"mutableArray haven't so much items");
            }
        
        
        
#pragma mark - 8. Create new array of mixed numbers. Sort it in an ascending and descending order.
        NSMutableArray *mixedNumbersArray = [@[] mutableCopy];
        for (int q = 0; q <= 5; q++) {
            [mixedNumbersArray addObject:[NSNumber numberWithInt:arc4random()%10]];
        }
        //    NSLog(@"%@", mixedNumbersArray1);
        
        
        //sort it in an ascending order:
        mixedNumbersArray = [[mixedNumbersArray sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
        
        //sort it in an descending order:
        mixedNumbersArray = [[mixedNumbersArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [obj2 compare:obj1];
        }] mutableCopy];
        
        [mixedNumbersArray release];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
