//
//  AppDelegate.m
//  leisure
//
//  Created by qianfeng0 on 16/2/22.
//  Copyright © 2016年 陈希. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarViewController.h"
#import "ViewController.h"
#import "YanJieViewController.h"
#import "EnterViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)setNav{
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置显示的颜色
    bar.barTintColor = [UIColor colorWithRed:6/255.0 green:6/255.0 blue:6/255.0 alpha:0.1];
    //设置字体颜色
    bar.tintColor = [UIColor whiteColor];
//    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //或者用这个都行
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 5;
    
//
//    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont fontWithName:@"Wyue-GutiFangsong-NC" size:15], NSParagraphStyleAttributeName:paragraphStyle};
    [bar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont fontWithName:@"Wyue-GutiFangsong-NC" size:18], NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
//    bar.attributedText = [[NSAttributedString alloc]initWithString:cell.Content.text attributes:attributes];
    //    [bar setTitleTextAttributes:@{UITextAttributeTextColor : [UIColor whiteColor]}];
    
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setNav];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[EnterViewController alloc] init];
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    [Bmob registerWithAppKey:@"075c9e426a01a48a81aa12305924e532"];

//    //往GameScore表添加一条playerName为小明，分数为78的数据
//    BmobObject *gameScore = [BmobObject objectWithClassName:@"appKaiGuan"];
//    [gameScore setObject:@"关" forKey:@"DuLiApp"];
//    [gameScore saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
//
//    }];
    
    
    NSString *nowStatus = [[NSUserDefaults standardUserDefaults] objectForKey:@"KaiGuanShiFouDaKai"];
    
    if ([nowStatus isEqualToString:@"开"]) {
        
    }else{
        //查找GameScore表
        BmobQuery   *bquery = [BmobQuery queryWithClassName:@"appKaiGuan"];
        //查找GameScore表里面id为0c6db13c的数据
        [bquery getObjectInBackgroundWithId:@"e36a4b8195" block:^(BmobObject *object,NSError *error){
            if (error){
                //进行错误处理
            }else{
                //表里有id为0c6db13c的数据
                if (object) {
                    //得到playerName和cheatMode
                    NSString *KaiGuanStatus = [object objectForKey:@"DuLiApp"];
                    NSLog(@"%@-",KaiGuanStatus);
                    [[NSUserDefaults standardUserDefaults] setObject:KaiGuanStatus forKey:@"KaiGuanShiFouDaKai"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                }
            }
        }];
    }
 
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.1520.leisure" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"leisure" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"leisure.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        ////NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         //   //NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"Calling Application Bundle ID: %@", sourceApplication);
    NSLog(@"URL scheme:%@", [url scheme]);
    NSLog(@"URL query: %@", [url query]);
    
    // Customer Code
    return YES;
}



@end
