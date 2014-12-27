//
//  MainViewController.m
//  JMScrollablePages
//
//  Created by Mobmaxime on 27/12/14.
//  Copyright (c) 2014 Jigar. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet JMScrollableView *jmScrollableView;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"1.jpg"] drawInRect:self.jmScrollableView.bounds];
    UIImage *firstImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"2.jpg"] drawInRect:self.jmScrollableView.bounds];
    UIImage *secondImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"3.jpg"] drawInRect:self.jmScrollableView.bounds];
    UIImage *thirdImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"4.jpg"] drawInRect:self.jmScrollableView.bounds];
    UIImage *forthImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"5.jpg"] drawInRect:self.jmScrollableView.bounds];
    UIImage *fifthImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    JMScrollPage *firstPage = [[JMScrollPage alloc] init];
    firstPage.titleLabel.text = @"Beautiful and Awesome Party. Look at this party. want to go there..!!";
    [firstPage.backgroundView setBackgroundColor:[UIColor colorWithPatternImage:firstImage]];
    firstPage.titleBackgroundColor = [UIColor colorWithRed:255/255.0f green:64/255.0f blue:129/255.0f alpha:1.0];
    
    JMScrollPage *secondPage = [[JMScrollPage alloc] init];
    secondPage.titleLabel.text = @"Ohhooo Look at this ballons group. Looks like Freedom of life..!!";
    [secondPage.backgroundView setBackgroundColor:[UIColor colorWithPatternImage:secondImage]];
    secondPage.titleBackgroundColor = [UIColor colorWithRed:0/255.0f green:200/255.0f blue:83/255.0f alpha:1.0];
    
    JMScrollPage *thirdPage = [[JMScrollPage alloc] init];
    thirdPage.titleLabel.text = @"Now we're deep in a forest.Lots of shaped stones are here..";
    [thirdPage.backgroundView setBackgroundColor:[UIColor colorWithPatternImage:thirdImage]];
    thirdPage.titleBackgroundColor = [UIColor colorWithRed:216/255.0f green:67/255.0f blue:21/255.0f alpha:1.0];
    
    JMScrollPage *fourthPage = [[JMScrollPage alloc] init];
    fourthPage.titleLabel.text = @"Ahaaa!!!, Awesome Cstomize pic of Apple and Balloons.";
    [fourthPage.backgroundView setBackgroundColor:[UIColor colorWithPatternImage:forthImage]];
    fourthPage.titleBackgroundColor = [UIColor colorWithRed:249/255.0f green:168/255.0f blue:37/255.0f alpha:1.0];
    
    JMScrollPage *fifthPage = [[JMScrollPage alloc] init];
    fifthPage.titleLabel.text = @"This is like a Creature wallpaper. Its a new design of Areature.";
    [fifthPage.backgroundView setBackgroundColor:[UIColor colorWithPatternImage:fifthImage]];
    fifthPage.titleBackgroundColor = [UIColor colorWithRed:0/255.0f green:137/255.0f blue:123/255.0f alpha:1.0];
    
    [self.jmScrollableView setupViewsWithArray:@[firstPage, secondPage, thirdPage, fourthPage, fifthPage]];
}

@end
