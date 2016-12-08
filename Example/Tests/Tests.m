//
//  config-reader-iosTests.m
//  config-reader-iosTests
//
//  Created by ramdhany on 12/08/2016.
//  Copyright (c) 2016 ramdhany. All rights reserved.
//

@import XCTest;
#import <config_reader_ios/ConfigReader.h>

@interface Tests : XCTestCase

@property ConfigReader *config_reader;
@property NSDictionary *configValues;


@end

@implementation Tests
{
   
}

- (void)setUp
{
    [super setUp];
    
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithConfigFile
{
    NSString *configFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Config"
                                                                                ofType:@"plist"];
    
     XCTAssertNotNil(configFilePath, @"File not found");
    
    if (configFilePath){
        
        self.configValues = [NSDictionary dictionaryWithContentsOfFile:configFilePath];
        
        XCTAssertNotNil(self.configValues, @"contents of file not a dictionary");

        self.config_reader = [ConfigReader getInstanceWith: [NSBundle bundleForClass:[self class]]
                              ConfigFile:@"Config.plist"];
        
        XCTAssertNotNil(self.config_reader, @"contents of file not a dictionary");
     
        NSString* expectedResult = [_configValues objectForKey:@"TWEET_URL"];
        
        XCTAssertTrue([[_config_reader stringForKey:@"TWEET_URL" defaultValue:@"some default string"] isEqualToString:expectedResult],
                      @"Strings are not equal %@ %@", expectedResult, [_config_reader stringForKey:@"TWEET_URL" defaultValue:@"some default string"]);

    }
    
    
}


- (void)testInitWithInvalidConfigFile
{
    
     ConfigReader *config_reader = [ConfigReader getInstanceWith: [NSBundle bundleForClass:[self class]] ConfigFile:@"a_wrong_file.plist"];
    
    
    XCTAssertNil(config_reader, @"expected nil for config reader");
    
    
}



- (void)testDefaultValues
{
    ConfigReader *config_reader = [ConfigReader getInstanceWith: [NSBundle bundleForClass:[self class]] ConfigFile:@"Config.plist"];
    
    NSString* expectedResult = @"some default string";
    
    XCTAssertTrue([[config_reader stringForKey:@"A_NON_EXISTENT_PROPERTY" defaultValue:@"some default string"] isEqualToString:expectedResult],
                  @"Strings are not equal %@ %@", expectedResult, [config_reader stringForKey:@"TWEET_URL" defaultValue:@"some default string"]);
    
    
}


@end

