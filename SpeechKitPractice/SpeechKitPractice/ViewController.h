//
//  ViewController.h
//  SpeechKitPractice
//
//  Created by Bereket  on 10/31/15.
//  Copyright © 2015 Bereket . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpeechKit/SpeechKit.h>

@interface ViewController : UIViewController <SKRecognizerDelegate, UITextViewDelegate>{
    
    SKRecognizer* recognizer;
    BOOL isRecording;
}

- (IBAction)startRecordingButtonTapped:(id)sender;

- (IBAction)stopRecordingButtonTapped:(id)sender;

@property (nonatomic, retain) SKRecognizer* recognizer;

@property (nonatomic) NSMutableString* recordedString;

@property (strong, nonatomic) IBOutlet UITextView *recordedTextView;

@end

