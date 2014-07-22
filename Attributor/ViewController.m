//
//  ViewController.m
//  Attributor
//
//  Created by Vikash Soni on 17/07/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;

@end

@implementation ViewController
{


}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewWillAppear
{
    
    [[NSNotificationCenter defaultCenter] addObserver : self
                                              selector: @selector(preferredFontsChanged:)
                                                 name :UIContentSizeCategoryDidChangeNotification object : nil];
}

-(void)viewWillDisappear:(BOOL)animated
{

}

-(void)preferredFontsChanged:(NSNotification *)notification
{
    [self usePreferredFonts];
}

-(void) usePreferredFonts
{
    self.body.font = [UIFont preferredFontForTextStyle: UIFontTextStyleBody];
}


- (IBAction)changeBodyColorButton:(UIButton *)sender
{
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
    
    _colorfulNumber += self.body.selectedRange.length;
}

- (IBAction)outlineButton:(id)sender
{
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-4,NSStrokeColorAttributeName : [UIColor blackColor]} range:self.body.selectedRange];
     
    _outlinedNumber += self.body.selectedRange.length;
    
    NSLog(@"%d",self.body.selectedRange.length);
}

- (IBAction)unOutlineButton:(id)sender
{
    _outlinedNumber = [self strokeCount:NSStrokeWidthAttributeName :_outlinedNumber];
    
//    [self.body.textStorage removeAttribute: NSStrokeWidthAttributeName range:self.body.selectedRange];
//    outlinedNumber -= self.body.selectedRange.length;
//    
//    if (outlinedNumber < 0)
//        outlinedNumber = 0;

}
- (IBAction)clearColor:(id)sender
{
    
  _colorfulNumber =  [self strokeCount:NSForegroundColorAttributeName :_colorfulNumber];
    
    NSLog(@"numbercolor %d",_colorfulNumber);
}

-(NSInteger) strokeCount : (NSString *)attributeName : (NSInteger) number
{
    [self.body.textStorage removeAttribute:attributeName range:self.body.selectedRange];

    number -= self.body.selectedRange.length;
   
    if (number < 0)
    {
        number = 0;
    }
    
    return number;
}


@end
