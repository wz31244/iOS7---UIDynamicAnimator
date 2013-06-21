//
//  AppDelegate.m
//  WXYZ
//
//  Created by 王 政 on 13-6-20.
//  Copyright (c) 2013年 王政. All rights reserved.
//

#import "AppDelegate.h"
#import "DragImageVIew.h"
#import <SpriteKit/SpriteKit.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(50, 20, 80, 30);
    [button1 setTitle:@"开始" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(200, 20, 80, 30);
    [button2 setTitle:@"结束" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(end) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button2];
    
    // Override point for customization after application launch.
    self.imageView1 = [[DragImageVIew alloc]initWithFrame:CGRectMake(0, 180, 80, 80)];
    [self.window addSubview:self.imageView1];
    self.imageView1.image = [UIImage imageNamed:@"2.png"];
    
    self.imageView2 = [[DragImageVIew alloc]initWithFrame:CGRectMake(240, 180, 80, 80)];
    self.imageView2.image = [UIImage imageNamed:@"2"];
    [self.window addSubview:self.imageView2];
    
    self.animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.window];//创建环境，类似检索上下文。
    
    self.collBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.imageView1,self.imageView2]];//初始化碰撞特性
    self.collBehavior.collisionMode = UICollisionBehaviorModeEverything;//任意事物均有物理碰撞特性
    self.collBehavior.translatesReferenceBoundsIntoBoundary = YES;
    self.collBehavior.collisionDelegate = self;
    
    self.behavior = [[UIGravityBehavior alloc]initWithItems:@[self.imageView1, self.imageView2]];//初始化重力特性
    
    [UIView animateWithDuration:5 animations:^{
        self.imageView1.center = CGPointMake(130, 220);
        self.imageView2.center = CGPointMake(180, 220);
    }];
    [self performSelector:@selector(start) withObject:nil afterDelay:5];
    [self performSelector:@selector(startGravity) withObject:nil afterDelay:6];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)start
{
    NSLog(@"start");
    
//    [self.animator addBehavior:self.behavior];
    
     [self.animator addBehavior:self.collBehavior];//只要添加，马上触发特性
}

- (void)startGravity
{
//    [self.animator removeAllBehaviors];//先移除物理特性
    
    [self.animator addBehavior:self.behavior];
}

- (void)end
{
    [self.animator removeAllBehaviors];
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    NSLog(@"%@",NSStringFromCGPoint(p));
}


-(void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier
{
    NSLog(@"%@",item);
    // Restore the default color when ending a contcact.
//    [(UIView*)item setBackgroundColor:[UIColor redColor]];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
