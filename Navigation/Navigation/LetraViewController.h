//
//  LetraAViewController.h
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LetraViewController : UIViewController

-(int) indiceTela;
+(void) setIndiceTela:(int)valorIndice;


@property UILabel *letraLabel;
@property UIImageView *imageView;

@property LetraViewController *telaSucessora;
@property LetraViewController *telaPredecessora;
@property UITabBar *tabBar;
@property UITextField *textoField;
@property UIBarButtonItem *barButton;
@property UIBarButtonItem *searchBar;
@property UIToolbar *toolBar;

-(void)disparouTap:(UITapGestureRecognizer*)tap;
-(void)disparouPan:(UIPanGestureRecognizer*)pan;
-(void)disparouSwipe:(UISwipeGestureRecognizer*)swipe;

//- (IBAction)swipeViewzona:(UISwipeGestureRecognizer *)sender;

@end
