//
//  webViewContainer.m
//  XMLTask2
//
//  Created by Subhabrata Banerjee on 16/08/16.
//  Copyright © 2016 Subhabrata Banerjee. All rights reserved.
//

#import "webViewContainer.h"

@implementation webViewContainer
@synthesize getLinkString;

-(void)viewDidLoad{

    NSLog(@"%@", getLinkString);
    
}


- (IBAction)backButtonAction:(id)sender {
    
    [self dismissViewControllerAnimated:false completion: nil];
    
}
@end
