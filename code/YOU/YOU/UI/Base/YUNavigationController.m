

#import "YUNavigationController.h"


@interface YUNavigationController ()

@end

@implementation YUNavigationController
+ (void)initialize
{
    UIColor* topicColor = [UIColor colorWithRed:133/255.f green:108/255.f blue:215/255.f alpha:1];;
    UINavigationBar *  navBar = [UINavigationBar appearance];
    [navBar setTitleTextAttributes:@{
                                     NSForegroundColorAttributeName: [UIColor whiteColor],
                                     NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                     }];
    navBar.tintColor = [UIColor whiteColor];
    navBar.barTintColor = topicColor;
    UIImage *bgImage = [self imageWithColor:topicColor size:CGSizeMake(1, 64)];
    //[navBar setBackgroundImage:bgImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [navBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

//add by donglin
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.topViewController supportedInterfaceOrientations];
}

+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count>0){
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}


@end
