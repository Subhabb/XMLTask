//
//  xmlTableDataSource.h
//  XMLTask2
//
//  Created by Subhabrata Banerjee on 16/08/16.
//  Copyright © 2016 Subhabrata Banerjee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xmlTableDataSource : NSObject

@property NSString *titleString;
@property NSString *dateString;
@property NSString *descriptioN;


- (id)initWithName : (NSString *)titleString
 dateOfPublication : (NSString*)dateString
       descriotion : (NSString *)descriptioN;


@end
