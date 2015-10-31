//
//  C4QReaderViewController.m
//  DiversityPDFReader
//
//  Created by Z on 10/31/15.
//  Copyright © 2015 dereknetto. All rights reserved.
//

#import "C4QReaderViewController.h"
#import "MyView.h"

@interface C4QReaderViewController ()

@end

@implementation C4QReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    CGFloat halfSizeOfView = 25.0f;
    NSInteger maxViews = 1;
    CGSize insetSize = CGRectInset(self.view.bounds, 2*halfSizeOfView, 2*halfSizeOfView).size;
    
    //add Views
    for (int i = 0; i < maxViews; i++) {
        CGFloat pointX = random () % ((int)insetSize.width) + halfSizeOfView;
        CGFloat pointY = random () % ((int)insetSize.height) + halfSizeOfView;
        MyView *newView = [[MyView alloc]initWithFrame:CGRectMake(pointX, pointY, 3000, 1000)];
        [self.view addSubview:newView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
