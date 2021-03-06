//
//  JMScrollableView.m
//  JMScrollablePages
//
//  Created by Mobmaxime on 27/12/14.
//  Copyright (c) 2014 Jigar. All rights reserved.
//

#import "JMScrollableView.h"

static int xOffset = 50;
static int titleViewHeight = 85;
static int bottomTitleViewPadding = 75;
static int rightTitleViewPadding = 50;
static int pageViewPadding = 20;

@interface JMScrollableView()

@property (strong, nonatomic) NSMutableArray *pageArray;
@property (strong, nonatomic) UIScrollView *titleScrollView;
@property (strong, nonatomic) UIScrollView *labelScrollView;
@property (strong, nonatomic) NSMutableArray *labelScrollViewArray;

@property CGRect backgroundFrame;

@property CGRect titleViewFrame;
@property CGRect titleLabelFrame;
@property CGRect titleDetailLabelFrame;
@property CGRect iconFrame;

@end

@implementation JMScrollableView

-(void)addJMScrollPage:(JMScrollPage *)page
{
    if(self.pageArray == nil)
    {
        [self setupScrollPresenter];
    }
    
    [self.pageArray addObject:page];
    
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for(JMScrollPage *page in self.pageArray)
    {
        [[page.titleView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self setupViews];
}

-(void)setupViewsWithArray:(NSMutableArray *)array
{
    [self setupScrollPresenter];
    
    self.pageArray = array;
    
    [self setupViews];
}

-(void)setupScrollPresenter
{
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.pagingEnabled = YES;
    self.delegate = self;
    self.bounces = NO;
    
    self.pageArray = [[NSMutableArray alloc] init];
    self.labelScrollViewArray = [[NSMutableArray alloc] init];
}

-(void)setupViews
{
    self.titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - titleViewHeight - bottomTitleViewPadding, self.frame.size.width * [self.pageArray count], titleViewHeight)];
    //[self.titleScrollView setBackgroundColor:[UIColor brownColor]];
    [self addSubview:self.titleScrollView];
    
    int pageArrayIndex = 0;
    
    for (JMScrollPage *page in self.pageArray)
    {
        //--------------------------------------------------------------------------------
        //Backgroung Image
        //--------------------------------------------------------------------------------
        self.backgroundFrame = CGRectMake(self.frame.size.width * pageArrayIndex, 0, self.frame.size.width, self.frame.size.height);
        [page.backgroundView setFrame:self.backgroundFrame];
        [self addSubview:page.backgroundView];
        [self sendSubviewToBack:page.backgroundView];
        //--------------------------------------------------------------------------------
        
        
        
        //UIImageView *iconView = [[UIImageView alloc] initWithImage:page.icon];
        
        //--------------------------------------------------------------------------------
        // Title View
        //--------------------------------------------------------------------------------
        if(pageArrayIndex == 0)
        {
            self.titleViewFrame = CGRectMake(0, 0, self.backgroundFrame.size.width - rightTitleViewPadding, titleViewHeight);
        }
        else if(pageArrayIndex != [self.pageArray count] - 1)
        {
            self.titleViewFrame = CGRectMake(self.frame.size.width * pageArrayIndex, 0, self.backgroundFrame.size.width - rightTitleViewPadding, titleViewHeight);
        }
        else if(pageArrayIndex == [self.pageArray count] - 1)
        {
            self.titleViewFrame = CGRectMake(self.frame.size.width * pageArrayIndex, 0, self.backgroundFrame.size.width - rightTitleViewPadding, titleViewHeight);
        }
        [page.titleView setFrame:self.titleViewFrame];
        
        self.labelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, page.titleView.frame.size.width, page.titleView.frame.size.height)];
        [page.titleView addSubview:self.labelScrollView];
        
        //Title
        UIView *titleViewBackground = [[UIView alloc] initWithFrame:self.labelScrollView.frame];
        titleViewBackground.alpha = 0.5;
        [titleViewBackground setBackgroundColor:page.titleBackgroundColor];
        [page.titleView addSubview:titleViewBackground];
        
        //SlatLine : black color Default
        UIView *slateLine = [[UIView alloc] initWithFrame:CGRectMake(titleViewBackground.frame.size.width-15, 0, 15, titleViewBackground.frame.size.height)];
        //UIView *slateLine = [[UIView alloc] initWithFrame:CGRectMake(0, titleViewBackground.frame.size.height-3, titleViewBackground.frame.size.width, 3)];
        [slateLine setBackgroundColor:[UIColor colorWithRed:38/255.0f green:50/255.0f blue:56/255.0f alpha:0.5]];
        [page.titleView addSubview:slateLine];
        [page.titleView sendSubviewToBack:titleViewBackground];
        [self.titleScrollView addSubview:page.titleView];
        
        //--------------------------------------------------------------------------------
        
        CGRect titleLabelFrame = CGRectMake(10, titleViewHeight/100, page.titleView.frame.size.width - slateLine.frame.size.width-15, titleViewHeight-(titleViewHeight/100));
        page.titleLabel.frame = titleLabelFrame;
        [self.labelScrollView addSubview:page.titleLabel];
        
        /*CGRect titleLabelFrame = CGRectMake(10 + (xOffset * pageArrayIndex), titleViewHeight / 100, page.titleView.frame.size.width - pageViewPadding, titleViewHeight / 1.7);
         page.titleLabel.frame = titleLabelFrame;
         
         CGRect titleDetailLabelFrame = CGRectMake(10 + (xOffset * pageArrayIndex), titleViewHeight / 2.2, page.titleView.frame.size.width - pageViewPadding, titleViewHeight / 2);
         page.detailLabel.frame = titleDetailLabelFrame;
         
         self.labelScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, page.titleView.frame.size.width, page.titleView.frame.size.height)];
         [page.titleView addSubview:self.labelScrollView];
         
         UIView *titleViewBackground = [[UIView alloc] initWithFrame:self.labelScrollView.frame];
         titleViewBackground.alpha = 0.5;
         [titleViewBackground setBackgroundColor:page.titleBackgroundColor];
         [page.titleView addSubview:titleViewBackground];
         [page.titleView sendSubviewToBack:titleViewBackground];
         
         //[self.labelScrollView addSubview:page.detailLabel];
         //[self.labelScrollView addSubview:page.titleLabel];
         
         [self.titleScrollView addSubview:page.titleView];
         
         [self.labelScrollViewArray addObject:self.labelScrollView];*/
        
        //[iconView setFrame:self.iconFrame];
        //[self.labelScrollView addSubview:iconView];
        
        pageArrayIndex++;
    }
    
    self.contentSize = CGSizeMake(self.frame.size.width * self.pageArray.count, self.frame.size.height);
    self.titleScrollView.contentSize = self.contentSize;
}

-(int)currentPage
{
    return self.contentOffset.x / self.frame.size.width;
}

-(void)animateToPageAtIndex:(int)index
{
    [self setContentOffset:CGPointMake(self.frame.size.width * index, self.contentOffset.y) animated:YES];
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    /*[scrollView setContentOffset: CGPointMake(scrollView.contentOffset.x, 0)];
     
     //[self.titleScrollView setContentOffset:CGPointMake(scrollView.contentOffset.x * -(xOffset / self.frame.size.width), scrollView.contentOffset.y) animated:NO];
     
     for(UIScrollView *labelScrollView in self.labelScrollViewArray)
     {
     //[labelScrollView setContentOffset:CGPointMake(scrollView.contentOffset.x * (xOffset / self.frame.size.width), scrollView.contentOffset.y) animated:NO];
     }*/
}

@end
