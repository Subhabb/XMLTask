//
//  xmlTableDataSource.m
//  XMLTask2
//
//  Created by Subhabrata Banerjee on 16/08/16.
//  Copyright © 2016 Subhabrata Banerjee. All rights reserved.
//

#import "xmlTableDataSource.h"

@implementation xmlTableDataSource


- (id)initWithName : (NSString *)titleString
 dateOfPublication : (NSString*)dateString
       descriotion : (NSString *)descriptioN{

    self = [super init];
    
    if (self) {
        
        self.titleString = titleString;
        self.dateString  = dateString;
        self.descriptioN = descriptioN;
    }
    
    return self;


}


@end
