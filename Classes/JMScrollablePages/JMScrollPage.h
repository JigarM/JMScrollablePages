//
//  JMScrollPage.h
//  JMScrollablePages
//
//  Created by Mobmaxime on 27/12/14.
//  Copyright (c) 2014 Jigar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JMScrollPage : NSObject

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIColor *titleBackgroundColor;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImage *icon;

-(id)init;

@end
