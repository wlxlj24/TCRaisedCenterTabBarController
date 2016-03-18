//
//  ViewController.m
//  TCRaisedCenterTabBar_Demo
//
//  Created by TailCat on 16/3/18.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "ViewController.h"
#import "TCRaisedCenterTabBarController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	
	NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
	
	for (int i =0; i < 4; i++) {
		UIViewController *vc = [[UIViewController alloc] init];
		if (i % 2 == 0) {
			vc.view.backgroundColor = [UIColor redColor];
		}
		
		[viewControllers addObject:vc];
	}
	
	NSArray *images = @[[UIImage imageNamed:@"tab-today"],[UIImage imageNamed:@"tab-explore"],[UIImage imageNamed:@"tab-friends"],[UIImage imageNamed:@"tab-me"]];
	
	TCRaisedCenterTabBarController *vc = [[TCRaisedCenterTabBarController alloc] initWithViewControllers:viewControllers
																								  titles:@[@"1",@"2",@"3",@"4"]
																								  images:images
																						  selectedImages:nil
																							 centerImage:[UIImage imageNamed:@"cameraTabBarItem"]
																					 centerSelectedImage:nil
																						 withActionBlock:^{
																							 NSLog(@"===========");
																							 NSLog(@"fdsafdsa");
																							 NSLog(@"===========");
																						 }];
	
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
	
	[self presentViewController:nav animated:YES completion:nil];
	
}



@end
