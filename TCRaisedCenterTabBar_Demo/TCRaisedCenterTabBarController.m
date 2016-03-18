//
//  TCRaisedCenterTabBarController.m
//  TCRaisedCenterTabBar_Demo
//
//  Created by TailC on 16/3/18.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import "TCRaisedCenterTabBarController.h"
#import <objc/runtime.h>

@interface TCRaisedCenterTabBarController ()

@end

@implementation TCRaisedCenterTabBarController

static char overviewKey;

- (void)viewDidLoad
{
	[super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Init Method
-(instancetype)initWithViewControllers:(NSArray *)viewControllers
								titles:(NSArray *)titles
								images:(NSArray *)images
						selectedImages:(NSArray *)selectedImages
						   centerImage:(UIImage *)centerImage
				   centerSelectedImage:(UIImage *)selectedCenterImage
					   withActionBlock:(centerButtonAction)action{
	
	//插入一个占位中间图标的item
	NSMutableArray *nViewControllers = [[NSMutableArray alloc] initWithArray:viewControllers];
	UIViewController *centerViewController = [[UIViewController alloc] init];
	centerViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:nil selectedImage:nil];
	[nViewControllers insertObject:centerViewController atIndex:(viewControllers.count/2)];
	
	self.viewControllers = nViewControllers;

	for (int i = 0; i < viewControllers.count; i++) {
		
		if (viewControllers.count != titles.count)	return nil;
		
		if ([viewControllers[i] isKindOfClass:[UIViewController class]]) {
			UIViewController *vc = viewControllers[i];
			vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titles[i] image:images[i] selectedImage:selectedImages[i]];
		}
		
	}
	
	[self addCenterButtonWithImage:centerImage highlightImage:selectedCenterImage action:action];
	
	return  self;
}


#pragma mark Private Method

// Create a custom UIButton and add it to the center of our tab bar
-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage action:(centerButtonAction)block
{
	UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
	//  设定button大小为适应图片
	button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
	[button setBackgroundImage:buttonImage forState:UIControlStateNormal];
	[button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
	
	 //去掉选中button时候的阴影
	button.adjustsImageWhenHighlighted = NO;
	
	//设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
	CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
	if (heightDifference < 0)
		button.center = self.tabBar.center;
	else
	{
		CGPoint center = self.tabBar.center;
		center.y = center.y - heightDifference/2.0;
		button.center = center;
	}
	
	objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
	[button addTarget:self action:@selector(callActionBlock:) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:button];
}

- (void)callActionBlock:(id)sender {
	centerButtonAction block = (centerButtonAction)objc_getAssociatedObject(self, &overviewKey);
	if (block) {
		block();
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
