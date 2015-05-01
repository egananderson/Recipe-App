//
//  RARecipeDetailViewController.m
//  Recipe App
//
//  Created by Egan Anderson on 4/30/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RARecipeDetailViewController.h"
#import "RARecipes.h"

static CGFloat topMargin = 20;

@interface RARecipeDetailViewController ()


@end

@implementation RARecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [RARecipes titleAtIndex:self.recipeIndex];
    self.view.backgroundColor = [UIColor whiteColor];

    CGFloat labelWidth = self.view.frame.size.width;
    CGFloat margin = 15;
    
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scroll];
    
    UILabel *descriptionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, topMargin, labelWidth - margin * 2, 20)];
    descriptionTitleLabel.text =  @"Description";
    [scroll addSubview:descriptionTitleLabel];
    CGFloat top = topMargin + 20 + margin;
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth - margin * 2, [self descriptionLabelHeight:[RARecipes descriptionAtIndex:self.recipeIndex]])];
    descriptionLabel.text =  [RARecipes descriptionAtIndex:self.recipeIndex];
    descriptionLabel.numberOfLines = 0;
    [scroll addSubview:descriptionLabel];
    top += [self descriptionLabelHeight:[RARecipes descriptionAtIndex:self.recipeIndex]] + margin;
    
    UILabel *ingredientsLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth - margin * 2, 20)];
    ingredientsLabel.text =  @"Ingredients";
    [scroll addSubview:ingredientsLabel];
    top += margin + 20;

    for (int i = 0; i < [RARecipes ingredientCountAtIndex:self.recipeIndex]; i++){
        UILabel *volume = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, (labelWidth - margin * 2)/4, 20)];
        volume.font = [UIFont boldSystemFontOfSize:17];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scroll addSubview:volume];
        
        UILabel *type = [[UILabel alloc] initWithFrame:CGRectMake(margin + (labelWidth - margin * 2)/4, top, (labelWidth - margin * 2)/2, 20)];
        type.font = [UIFont italicSystemFontOfSize:15];
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scroll addSubview:type];
        top += margin + 20 + 20;
    }
    
    UILabel *directionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth - margin * 2, 20)];
    directionsLabel.text =  @"Directions";
    [scroll addSubview:directionsLabel];
    top += margin + 20;
    
    for (int i = 0; i < [[RARecipes directionsAtIndex:self.recipeIndex] count]; i++){
        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, labelWidth - margin * 2, 20)];
        NSString *countText = [NSString stringWithFormat:@"%d", i+1];

        count.text = countText;
        [scroll addSubview:count];
        
        UILabel *directions = [[UILabel alloc] initWithFrame:CGRectMake(margin + 30, top, labelWidth - margin * 2 - 20, [self directionsLabelHeight:[RARecipes directionsAtIndex:self.recipeIndex][i]] - 20)];
        directions.text = [RARecipes directionsAtIndex:self.recipeIndex][i];
        directions.numberOfLines = 0;
        [scroll addSubview:directions];
        top += margin + [self directionsLabelHeight:[RARecipes directionsAtIndex:self.recipeIndex][i]];
    }
    scroll.contentSize = CGSizeMake(labelWidth, top);
}

-(CGFloat)descriptionLabelHeight:(NSString *)string{
    
    CGRect bounding = [string boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 30, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil];
    return bounding.size.height;
}

-(CGFloat)directionsLabelHeight:(NSString *)string{
    
    CGRect bounding = [string boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 30 - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:nil];
    return bounding.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
