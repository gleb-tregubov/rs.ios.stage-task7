//
//  AppDelegate.m
//  rs.ios.stage-task7
//
//  Created by Gleb Tregubov on 05.07.2021.
//

#import "AppDelegate.h"
#import "LoginViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    LoginViewController *rootVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [window setRootViewController:rootVC];
    
    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
