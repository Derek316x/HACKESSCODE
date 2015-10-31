//
//  ViewController.m
//  SpeechKitPractice
//
//  Created by Bereket  on 10/31/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import "ViewController.h"
#import<SpeechKit/SpeechKit.h>


@interface ViewController ()

@end

const unsigned char SpeechKitApplicationKey[] = {0xb1, 0x0e, 0x79, 0x35, 0x3d, 0xbf, 0xe0, 0xfc, 0xf4, 0xc1, 0xad, 0x14, 0xd3, 0xea, 0x78, 0x50, 0x44, 0x5d, 0xbc, 0xd5, 0x40, 0x86, 0xdb, 0xef, 0x85, 0x5c, 0xe9, 0x1f, 0xb1, 0xba, 0xde, 0x62, 0xc8, 0x57, 0x98, 0x06, 0x16, 0x78, 0x02, 0x0a, 0x3a, 0xb0, 0x1f, 0x0d, 0x9a, 0x97, 0x5d, 0xde, 0xf5, 0x19, 0xb4, 0x35, 0xa0, 0x8f, 0x25, 0x25, 0xeb, 0x0e, 0x44, 0x9c, 0xc8, 0x22, 0xfe, 0x90};


@implementation ViewController
@synthesize recognizer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [SpeechKit setupWithID:@"NMDPTRIAL_bereket6725_gmail_com20151031144710"
                      host:@"sandbox.nmdp.nuancemobility.net"
                      port:443
                    useSSL:NO
                  delegate:nil];
    
    
}
#pragma mark-
#pragma mark  SpeechKit Methods

-(void)recognizerDidBeginRecording:(SKRecognizer *)recognizer{
}

-(void)recognizerDidFinishRecording:(SKRecognizer *)recognizer{
  
}
-(void)recognizer:(SKRecognizer *)recognizer didFinishWithResults:(SKRecognition *)results{
    
    NSString* search = [results firstResult];
    
    self.recordedTextView.text = search;
    
    
}
- (IBAction)startRecordingButtonTapped:(id)sender {
    
    
  
        
        [self resignFirstResponder];
        self.recognizer = [[SKRecognizer alloc] initWithType:SKSearchRecognizerType detection:SKShortEndOfSpeechDetection language:@"en_US" delegate:self];
    
}

-(void)recognizer:(SKRecognizer *)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion{
    NSLog(@"Yo dude, something is Wrong!");
}

- (IBAction)stopRecordingButtonTapped:(id)sender {
    
    [recognizer stopRecording];
}
@end
