//
//  TCRaisedCenterTabBarController.h
//  TCRaisedCenterTabBar_Demo
//
//  Created by TailC on 16/3/18.
//  Copyright © 2016年 TailC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^centerButtonAction)(void);

@interface TCRaisedCenterTabBarController : UITabBarController

/**
 *  初始化TCRaisedCenterTabBarController
 *
 *  @param viewControllers     viewController数组(数组内为UIViewController)
 *  @param titles              title数组(NSString)
 *  @param images              image图标数组(UIImage)
 *  @param selectedImages      image选中图标数组(UIImage)
 *  @param centerImage         中间图标(UIImage)
 *  @param selectedCenterImage 中间选中图标(UIImage)
 *  @param action			   点击Block回调
 *
 *  @return TCRaisedCenterTabBarController
 */
-(instancetype)initWithViewControllers:(NSArray *)viewControllers
								titles:(NSArray *)titles
								images:(NSArray *)images
						selectedImages:(NSArray *)selectedImages
						   centerImage:(UIImage *)centerImage
				   centerSelectedImage:(UIImage *)selectedCenterImage
					   withActionBlock:(centerButtonAction)action;



@end
