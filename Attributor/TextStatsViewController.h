//
//  TextStatsViewController.h
//  Attributor
//
//  Created by Vikash Soni on 18/07/14.
//  Copyright (c) 2014 Vikash Soni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextStatsViewController : UIViewController
{
  
}

@property (nonatomic, strong) NSAttributedString *textToAnalyze;
@property (readwrite, assign) NSInteger changedColourText;
@property (readwrite, assign) NSInteger changedOutlineText;


@end
