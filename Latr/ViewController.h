//
//  ViewController.h
//  Latr
//
//  Created by John Redcorn on 1/24/17.
//  Copyright © 2017 Amyth. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PandocInterface.hpp"
#import "LatexDiffInferface.hpp"

//http://www.iconarchive.com/show/small-n-flat-icons-by-paomedia.html

@interface ViewController : NSViewController{
    PandocInterface pandocInterface;
    LatexDiffInterface latexdiffInterface;
    NSString *pandocLocation;
    NSString *latexdiffLocation;
}
@property (weak) IBOutlet NSTextField *lblBib;
@property (weak) IBOutlet NSTextField *lblCSL;
@property (weak) IBOutlet NSTextField *lblSource;
@property (weak) IBOutlet NSTextField *lblOutput;
- (IBAction)onPandocRun:(id)sender;
- (IBAction)openSource:(id)sender;
- (IBAction)outputLocation:(id)sender;
- (IBAction)openBib:(id)sender;
- (IBAction)openCSL:(id)sender;

/** Latexdiff functions **/
- (IBAction)openPrevious:(id)sender;
- (IBAction)onLatexDiffRun:(id)sender;
@property (weak) IBOutlet NSTextField *lblPrevious;
@end

