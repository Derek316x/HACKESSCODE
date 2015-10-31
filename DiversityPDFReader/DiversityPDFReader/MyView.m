//
//  MyView.m
//  dyslexiaTest
//
//  Created by Christian Maldonado on 10/31/15.
//  Copyright © 2015 Christian Maldonado. All rights reserved.
//
#import "MyView.h"
@implementation MyView


-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(detectPan:)];
        self.gestureRecognizers = @[panRecognizer];
        
        //randomize view color
        
        CGFloat hue = ( arc4random()% 256/256.0); // 0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0) + 0.5; //0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0) + 0.5; // o.5 to 1.0 away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        
        self.backgroundColor = color;
    }
    return self;
    
}

-(void) detectPan: (UIPanGestureRecognizer *) uiPanGestureRecognizer{
    CGPoint translation = [uiPanGestureRecognizer translationInView:self.superview];
    self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //promote the touch view
    [self.superview bringSubviewToFront:self];
    
    //remember original location
    lastLocation = self.center;
}

@end
