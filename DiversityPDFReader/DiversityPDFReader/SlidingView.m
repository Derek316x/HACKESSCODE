//
//  MyView.m
//  dyslexiaTest
//
//  Created by Christian Maldonado on 10/31/15.
//  Copyright © 2015 Christian Maldonado. All rights reserved.
//
#import "SlidingView.h"

@implementation SlidingView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(detectPan:)];
        self.gestureRecognizers = @[panRecognizer];
        
        UIColor *redColor = [UIColor colorWithRed:206/255.0 green:17/255.0 blue:38/255.0 alpha:1.0];
        UIColor *orangeColor = [UIColor colorWithRed:255/255.0 green:123/255.0 blue:0/255.0 alpha:1.0];
        
        //add orange underline
        UIView *orangeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 3000, 15)];
        orangeView.backgroundColor = orangeColor;
        [self addSubview:orangeView];
        
        //add button
        UIButton *speechTestButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        speechTestButton.frame = orangeView.frame;
        [speechTestButton setTitle:@"" forState:UIControlStateNormal];
        [speechTestButton addTarget:self action:@selector(speechTestButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [orangeView addSubview:speechTestButton];
        
        self.backgroundColor = redColor;
    }
    return self;
}

-(void)speechTestButtonPressed{
    [self.delegate buttonPressed];
}

-(void) detectPan: (UIPanGestureRecognizer *) uiPanGestureRecognizer{
    CGPoint translation = [uiPanGestureRecognizer translationInView:self.superview];
    self.center = CGPointMake(self.lastLocation.x + translation.x, self.lastLocation.y + translation.y);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //promote the touch view
    [self.superview bringSubviewToFront:self];
    
    //remember original location
    self.lastLocation = self.center;
}

@end