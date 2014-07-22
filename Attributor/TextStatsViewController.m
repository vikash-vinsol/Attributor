//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Vikash Soni on 18/07/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import "TextStatsViewController.h"
#import "ViewController.h"

@interface TextStatsViewController ()
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *colorfulColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlinedColorLabel;

@end

@implementation TextStatsViewController

-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    
    if (self.view.window)
    {
  //      [self updateUI];
    }
}

-(void)updateUI
{
//    self.outlinedColorLabel.text = [NSString stringWithFormat:@"%d colorful char",[[self charactersWithAttributes:NSForegroundColorAttributeName] length]];
//    self.colorfulColorLabel.text = [NSString stringWithFormat:@"%d outline char",[[self charactersWithAttributes:NSStrokeWidthAttributeName] length]];
    
    self.colorfulColorLabel.text = [NSString stringWithFormat:@"color %d",self.changedColourText];
    self.outlinedColorLabel.text = [NSString stringWithFormat:@"outline %d",self.changedOutlineText];
}

-(NSAttributedString *)charactersWithAttributes: (NSString *)attributeName
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc] init];
    
    int index = 0;
    while (index < [self.textToAnalyze length])
    {
        NSRange range;
        
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        
        NSLog(@"Value %@",value);
        if (value)
        {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
        }
        
        else
        {
            index ++;
        }
    }
    
    return characters;
}
-(void)viewWillAppear:(BOOL)animated
{
    ViewController *myVC1ref = (ViewController*)[self.tabBarController.viewControllers objectAtIndex:0];
    
    //myVC1ref.changedOutlineText = self.colorfulColorLabel.text;
    
    _colorfulColorLabel.text = [NSString stringWithFormat:@"color %d",myVC1ref.colorfulNumber];
    _outlinedColorLabel.text = [NSString stringWithFormat:@"outline %d",myVC1ref.outlinedNumber];
    
    NSLog(@"check %@",_colorfulColorLabel.text);
    
}

@end
