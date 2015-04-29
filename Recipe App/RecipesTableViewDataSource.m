//
//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Justin Huntington on 4/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RARecipes.h"

NSString static *cellID = @"cellID";

@implementation RecipesTableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell=[UITableViewCell new];
    }
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
                        
    [tableView addSubview:cell];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [RARecipes count];
}

-(void) registerTableView:(UITableView *)tableView
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

@end
