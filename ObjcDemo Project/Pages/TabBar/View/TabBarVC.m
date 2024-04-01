//
//  TabBarVC.m
//  ObjcDemo Project
//
//  Created by Neosoft on 01/04/24.
//

#import "TabBarVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabbar];
}

- (void)setTabbar{
    // Create instances of the view controllers
    HomeVC *homeVC = [[HomeVC alloc] init];
    ProfileVC *profileVC = [[ProfileVC alloc] init];
    CartVC *cartVC = [[CartVC alloc] init];
    
    // Set titles and tab bar icons for each view controller
    profileVC.title = @"Profile";
    profileVC.tabBarItem.image = [UIImage systemImageNamed:@"person.fill"];
    profileVC.tabBarItem.badgeColor = UIColor.redColor;
    
    homeVC.title = @"Home";
    homeVC.tabBarItem.image = [UIImage systemImageNamed:@"house.fill"];
    homeVC.tabBarItem.badgeColor = [UIColor colorNamed:@"secondary"];
    
    cartVC.title = @"Cart";
    cartVC.tabBarItem.image = [UIImage systemImageNamed:@"cart.fill"];
    cartVC.tabBarItem.badgeColor = [UIColor colorNamed:@"secondary"];

    // Create an array of view controllers
    NSArray *vc = @[profileVC, homeVC, cartVC];
       
    self.tabBar.backgroundColor = [UIColor colorNamed:@"primary"];
    self.tabBar.tintColor = UIColor.whiteColor;
    self.viewControllers = vc;
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 800;
    tabFrame.origin.y = self.view.frame.size.height - 300;
    self.tabBar.frame = tabFrame;
}

@end
