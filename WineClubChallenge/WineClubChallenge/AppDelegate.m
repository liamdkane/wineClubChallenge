//
//  AppDelegate.m
//  WineClubChallenge
//
//  Created by C4Q on 5/30/17.
//  Copyright © 2017 Liam Kane. All rights reserved.
//

#import "APINetworkCaller.h"
#import "AppDelegate.h"
#import "CategoryViewController.h"
#import "WineListTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //InitNetworking layer
    self.dataManager = [[DataMessanger alloc] init];
    APINetworkCaller *apiManager = [[APINetworkCaller alloc] init];
    //TODO: Add vcs for master and detail to manage.
    
    CategoryViewController *masterCategoryVC = [[CategoryViewController alloc] init];
    WineListTableViewController *wineListTVC = [[WineListTableViewController alloc] init];
    UINavigationController *detailNavVC = [[UINavigationController alloc] initWithRootViewController:wineListTVC];
    
    UISplitViewController *rootSplitViewController = [[UISplitViewController alloc] init];
    rootSplitViewController.viewControllers = [NSArray arrayWithObjects:masterCategoryVC, detailNavVC, nil];
    
    
    //Making call to get the initial wines
    
    
    //Making call to get the categories
    self.dataManager.categoryReceiver = masterCategoryVC;
    self.dataManager.wineReceiver = wineListTVC;
    [apiManager fetchCategories];
    [apiManager initialFetchWines];
    
    self.window.rootViewController = rootSplitViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
}

@end
