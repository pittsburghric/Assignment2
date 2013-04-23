//
//  ViewController.m
//  FruitCart
//
//  Created by David Evans on 1/29/13.
//  Copyright (c) 2013 DavidEvans. All rights reserved.
//

#import "ViewController.h"
#import "Fruit.h"
#import "Vegetables.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _cart = [NSMutableArray arrayWithCapacity:0];
    
    for(int i = 0; i < 50; i++){
        NSString * vegName = [NSString stringWithFormat:@"Vegetable %d", i];
        
        if((i % 10) == 0){
            vegName = [NSString stringWithFormat:@"Free Vegetable %d", i];
        }
        Vegetables * anonVegetables = [[Vegetables alloc] initWithWithName:vegName andColor:@"Brown" andShape:@"Round"];
        [_cart addObject:anonVegetables];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Vegetables";
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_cart count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TableViewCell"];
    }
    
    Vegetables * tempVegetables = [_cart objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [tempVegetables name];
    cell.detailTextLabel.text = [tempVegetables color];
    return cell;
}

@end
