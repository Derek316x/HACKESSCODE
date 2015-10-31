//
//  MFDocumentManagerViewController.h
//  DiversityPDFReader
//
//  Created by Z on 10/31/15.
//  Copyright © 2015 dereknetto. All rights reserved.
//

#import <FastPdfKit/FastPdfKit.h>
#import "SlidingViewDelegate.h"

@interface MFDocumentManagerViewController : UIViewController

@property (nonatomic) MFDocumentManager *documentManager;

-(IBAction)actionOpenPlainDocument:(id)sender;

@end
