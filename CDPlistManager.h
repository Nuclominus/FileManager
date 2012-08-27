//
//  CDPlistManager.h
//  CDPlistManager
//
//  Created by Roman Luxoron 20.08.12.
//  Copyright (c) 2012 Nuclominus. All rights reserved.
//

//  class for working with files type .plist 

#import <Foundation/Foundation.h>

@interface CDPlistManager : NSObject

{
    
}

// create file
+(void)createFile:(NSString *)fileName;
+(void)createFile:(NSString *)fileName filePath:(NSString*)path;
+(void)createFile:(NSString *)fileName dataToFile:(NSMutableDictionary*)data;
+(void)createFile:(NSString *)fileName filePath:(NSString*)path 
                                dataToFile:(NSMutableDictionary *)data;


// write to file
+(void)writeToFile:(NSString*)fileName dataToFile:(NSMutableDictionary*)data;
+(void)writeToFile:(NSString*)fileName dataToFile:(NSMutableDictionary*)data 
                                filePath:(NSString*)path;

// read from file
+(NSMutableDictionary*)readFromFile:(NSString*)fileName;
+(NSMutableDictionary*)readFromFile:(NSString*)fileName filePath:(NSString*)path;
+(NSMutableArray*)readFromResourcePlist:(NSString*)namePlist;

// output file names are on the way "./document/path"
+(NSArray*)checkFileFromFolder:(NSString*)path;

// delete file
+(void)deleteFile:(NSString*)filePath;

@end
