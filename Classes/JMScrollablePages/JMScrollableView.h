//
//  JMScrollableView.h
//  JMScrollablePages
//
//  Created by Mobmaxime on 27/12/14.
//  Copyright (c) 2014 Jigar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMScrollPage.h"

@interface JMScrollableView : UIScrollView <UIScrollViewDelegate>

-(void)addMMScrollPage:(JMScrollPage *)page;
-(void)setupViewsWithArray:(NSArray *)array;

-(int)currentPage;
-(void)animateToPageAtIndex:(int)index;

@end
