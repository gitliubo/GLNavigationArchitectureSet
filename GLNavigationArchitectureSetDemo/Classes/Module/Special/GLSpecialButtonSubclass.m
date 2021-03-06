//
//  GLSpecialButtonSubclass.m
//  GLNavigationArchitectureSet
//
//  Created by ZK on 16/6/24.
//  Copyright © 2016年 ZK. All rights reserved.
//

#import "GLSpecialButtonSubclass.h"
#import "GLSpecialViewController.h"

@interface GLSpecialButtonSubclass ()

@property (nonnull,nonatomic,strong) UIViewController* vc;

@end

@implementation GLSpecialButtonSubclass

- (instancetype)init
{
	self = [super init];
	if (self) {
        UIImage *buttonImage = [UIImage imageNamed:@"tabbar_compose_button"];
        UIImage *highlightImage = [UIImage imageNamed:@"tabbar_compose_button_highlighted"];
        UIImage *iconImage = [UIImage imageNamed:@"tabbar_compose_icon_add"];
        UIImage *highlightIconImage = [UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"];
        
        self.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
//        self.frame = CGRectMake(0.0, 0.0, 200, 200);

        [self setImage:iconImage forState:UIControlStateNormal];
        [self setImage:highlightIconImage forState:UIControlStateSelected];
        [self setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [self setBackgroundImage:highlightImage forState:UIControlStateSelected];
        [self addTarget:self action:@selector(specialButtonclick) forControlEvents:UIControlEventTouchUpInside];
        
        UIViewController* vc=[[UIViewController alloc] init];
        vc.view.backgroundColor=[UIColor whiteColor];
        
        self.vc=vc;
	}
	return self;
}

- (void)specialButtonclick
{
    UIViewController* root= [UIApplication sharedApplication].delegate.window.rootViewController;
    [root presentViewController:[[GLSpecialViewController alloc] init] animated:NO completion:nil];

}

-(UIViewController *)specialViewController
{

    return self.vc;
    
}



@end
