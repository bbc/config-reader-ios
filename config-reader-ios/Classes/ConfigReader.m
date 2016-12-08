//
//  ConfigReader.m
//
//  Created by Rajiv Ramdhany on 18/08/2014.
//  Copyright (c) 2014 BBC R&D. All rights reserved.
//
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.


#import "ConfigReader.h"

@interface ConfigReader()

@property NSDictionary *configValues;

@end


@implementation ConfigReader



+ (ConfigReader *)getInstanceWith:(NSBundle*) app_bundle ConfigFile:(NSString*) filename
{
    static ConfigReader *instance = nil;
    
    instance = [[ConfigReader alloc] initWith:app_bundle ConfigFile:filename];
    
    return instance;
}

//- (id)init {
//    self = [super init];
//    if (self) {
//        NSString *configFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Config"
//                                                                   ofType:@"plist"];
//        self.configValues = [NSDictionary dictionaryWithContentsOfFile:configFilePath];
//    }
//    return self;
//}

- (id)initWith: (NSBundle*) bundle ConfigFile:(NSString*) file {
    self = [super init];
    if (self) {
        
        NSString* filename = [file stringByDeletingPathExtension];
        NSString* ext = [file pathExtension];
        NSString* configFilePath =  [bundle pathForResource:filename ofType:ext];
        if (configFilePath){
        
            self.configValues = [NSDictionary dictionaryWithContentsOfFile:configFilePath];
        }else{
            return nil;
        }
    }
    return self;
}



- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue {
    id valueObject = [_configValues objectForKey:key];
    if ([valueObject isKindOfClass:[NSString class]]) {
        return (NSString *)valueObject;
    }
    else {
        return defaultValue;
    }
}

- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue {
    id valueObject = [_configValues objectForKey:key];
    if ([valueObject isKindOfClass:[NSNumber class]]) {
        return [valueObject integerValue];
    }
    else {
        return defaultValue;
    }
}

- (NSInteger)LongIntegerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue {
    id valueObject = [_configValues objectForKey:key];
    if ([valueObject isKindOfClass:[NSNumber class]]) {
        return [valueObject longValue];
    }
    else {
        return defaultValue;
    }
}


- (unsigned int) unsignedIntegerForKey:(NSString *)key defaultValue:(unsigned int)defaultValue{
    id valueObject = [_configValues objectForKey:key];
    if ([valueObject isKindOfClass:[NSNumber class]]) {
        return [valueObject unsignedIntValue];
    }
    else {
        return defaultValue;
    }
}

- (unsigned long) unsignedLongIntegerForKey:(NSString *)key defaultValue:(unsigned long)defaultValue{
    id valueObject = [_configValues objectForKey:key];
    if ([valueObject isKindOfClass:[NSNumber class]]) {
        return [valueObject unsignedLongValue];
    }
    else {
        return defaultValue;
    }
}

- (double)doubleForKey:(NSString *)key defaultValue:(double)defaultValue {
    id valueObject = [_configValues objectForKey:key];
    if ([valueObject isKindOfClass:[NSNumber class]]) {
        return [valueObject doubleValue];
    }
    else {
        return defaultValue;
    }
}

- (BOOL)boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue {
    id valueObject = [_configValues objectForKey:key];
    if ([valueObject isKindOfClass:[NSNumber class]]) {
        return [valueObject boolValue];
    }
    else {
        return defaultValue;
    }
}
@end
