//
//  xmlDataPurser.h
//  XMLTask2
//
//  Created by Subhabrata Banerjee on 16/08/16.
//  Copyright © 2016 Subhabrata Banerjee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xmlDataPurser : NSObject 


@property NSMutableArray *dataArray;

- (id)initWithArray: (NSMutableArray *)dataArray;

- (void)parseXMLFile;

@end
