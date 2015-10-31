//
//  MFDocumentManagerViewController.m
//  DiversityPDFReader
//
//  Created by Z on 10/31/15.
//  Copyright © 2015 dereknetto. All rights reserved.
//

#import "MFDocumentManagerViewController.h"
#import "C4QReaderViewController.h"

@interface MFDocumentManagerViewController () <SlidingViewDelegate>

@end

@implementation MFDocumentManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)actionOpenPlainDocument:(id)sender{
    /** Set document name */
    NSString *documentName = @"ObjectiveC";
    
    /** Get temporary directory to save thumbnails */
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    /** Set thumbnails path */
    NSString *thumbnailsPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",documentName]];
    
    /** Get document from the App Bundle */
    NSURL *documentUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:documentName ofType:@"pdf"]];
    
    /** Instancing the documentManager */
    self.documentManager = [[MFDocumentManager alloc]initWithFileUrl:documentUrl];
    
    /** Instancing the readerViewController */
    C4QReaderViewController *pdfViewController = [[C4QReaderViewController alloc]initWithDocumentManager:self.documentManager];
    
    //set pdfViewController's divView delegate
    pdfViewController.divView.delegate = self;
    
    /** Set resources folder on the manager */
    self.documentManager.resourceFolder = thumbnailsPath;
    
    /** Set document id for thumbnail generation */
    pdfViewController.documentId = documentName;
    
    /** Present the pdf on screen in a modal view */
    [self presentViewController:pdfViewController animated:YES completion:^{
        //
    }];
}

-(void)buttonPressed{
    NSLog(@"it works!");
    NSString *text = [self.documentManager wholeTextForPage:381];
    
    
    NSString *correctText = @"A dictionary is a collection of data consisting of key-object pairs. Just as you would look up the definition of a word in a dictionary, you obtain the value (object) from an Objective-C dictionary by its key. The keys in a dictionary must be unique, and they can be of any object type, although they are typically strings. The value associated with the key can also be of any object type, but it cannot be nil.";
    
}



@end
