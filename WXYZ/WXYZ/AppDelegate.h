//
//  AppDelegate.h
//  WXYZ
//
//  Created by 王 政 on 13-6-20.
//  Copyright (c) 2013年 王政. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DragImageVIew;
@interface AppDelegate : UIResponder <UIApplicationDelegate,UICollisionBehaviorDelegate,UIDynamicAnimatorDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) UIDynamicAnimator *animator;
@property (nonatomic,strong) UIDynamicBehavior *behavior;
@property (nonatomic,strong) UICollisionBehavior *collBehavior;
@property (nonatomic,strong) DragImageVIew *imageView1;
@property (nonatomic,strong) DragImageVIew *imageView2;
@end
