//
//  RecipeViewController.m
//  Recipe App
//
//  Created by Justin Huntington on 4/29/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RARecipeDetailViewController.h"
#import "RARecipes.h"

@interface RecipeViewController () <UITableViewDelegate>

@property (strong) UITableView *tableView;
@property (strong) RecipesTableViewDataSource *dataSource;

@end

@implementation RecipeViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.dataSource = [RecipesTableViewDataSource new];
    [self.dataSource registerTableView:self.tableView];
    self.tableView.dataSource = self.dataSource;
    
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RARecipeDetailViewController *recipeDetailView = [RARecipeDetailViewController new];
    recipeDetailView.recipeIndex = indexPath.row;
    
    
//    NSString *name = [RARecipes titleAtIndex:];
//    recipeDetailView.title = name;
    
    [self.navigationController pushViewController:recipeDetailView animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
