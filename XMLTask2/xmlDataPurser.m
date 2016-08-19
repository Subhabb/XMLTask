//
//  xmlDataPurser.m
//  XMLTask2
//
//  Created by Subhabrata Banerjee on 16/08/16.
//  Copyright © 2016 Subhabrata Banerjee. All rights reserved.
//

#import "xmlDataPurser.h"
#import "xmlTableDataSource.h"

@interface xmlDataPurser () <NSXMLParserDelegate>

@property NSXMLParser *parser;
@property NSString *element;
@property NSDictionary *attribute;


// Data properties
@property NSString *currentTitle;
@property NSString *currentDate;
@property NSString *currentDescription;

@end



@implementation xmlDataPurser




- (id)initWithArray: (NSMutableArray *)dataArray {
    
    self = [super init];
    
    if (self) {
        
        self.dataArray = dataArray;
    }
    
    return self;
    
}

- (void)parseXMLFile {
    
    NSString *urlString = @"http://appamonline.com/feed/";
    
    NSURL *xmlURL = [NSURL URLWithString : urlString];
    
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL : xmlURL];
    self.parser.delegate = self;
    [self.parser parse];
    
}


- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
    self.element = elementName;
    self.attribute = attributeDict;
    
}

- (void)parser:(NSXMLParser *)parser
foundCharacters:(NSString *)string {
    
    
    if ([self.element isEqualToString:@"title"]) {
        
        self.currentTitle = string;
        
    }
    
    else if ([self.element isEqualToString:@"pubDate"]) {
        
        self.currentDate = string;
        
    }
    
    else if ([self.element isEqualToString:@"description"]) {
        
        self.currentDescription = string;
        
    }
    
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        
        xmlTableDataSource *dataSouecE;
        
        dataSouecE = [[xmlTableDataSource alloc]initWithName : self.currentTitle dateOfPublication : self.currentDate descriotion : self.description];
        
        [self.dataArray addObject : dataSouecE];
        
    }
    
    self.element = nil;
}



@end
