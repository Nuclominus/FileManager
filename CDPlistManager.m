//
//  CDPlistManager.m
//  CDPlistManager
//
//  Created by Roman Luxor on 20.08.12.
//  Copyright (c) 2012 Nuclominus. All rights reserved.
//

#import "CDPlistManager.h"

@implementation CDPlistManager 

// create file in root folder (./document/)
+(void)createFile:(NSString *)fileName

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    [array writeToFile:newPlistFile atomically:YES];
}

// create file in custom folder (./document/path/)
+(void)createFile:(NSString *)fileName filePath:(NSString *)path

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * pathFolder = [NSString stringWithFormat:@"%@/%@/", documentFolder,path];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.plist",path,fileName]];
    
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    
    if (![defaultManager fileExistsAtPath:path])
        [defaultManager createDirectoryAtPath:pathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    [array writeToFile:newPlistFile atomically:YES];
    
}

//  create file with data in root folder (./document/)
+(void)createFile:(NSString *)fileName dataToFile:(NSMutableDictionary*)data

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    [data writeToFile:newPlistFile atomically:YES];
    
    
}

//  create file with data in custom folder (./document/path)
+(void)createFile:(NSString *)fileName filePath:(NSString *)path dataToFile:(NSMutableDictionary *)data

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * pathFolder = [NSString stringWithFormat:@"%@/%@/", documentFolder,path];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.plist",path,fileName]];
    
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    
    if (![defaultManager fileExistsAtPath:path])
        [defaultManager createDirectoryAtPath:pathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    [data writeToFile:newPlistFile atomically:YES];
    
    
}


// write to file
+(void)writeToFile:(NSString *)fileName dataToFile:(NSMutableDictionary *)data

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    [data writeToFile:newPlistFile atomically:YES]; 
    
    
}

// write to file on the path
+(void)writeToFile:(NSString *)fileName dataToFile:(NSMutableDictionary *)data filePath:(NSString *)path

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * pathFolder = [NSString stringWithFormat:@"%@/%@/", documentFolder,path];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.plist",path,fileName]];
    
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    
    if (![defaultManager fileExistsAtPath:path])
        [defaultManager createDirectoryAtPath:pathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    [data writeToFile:newPlistFile atomically:YES];
}


// read from file
+(NSMutableDictionary*)readFromFile:(NSString *)fileName

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    NSString *plistPath = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    NSMutableDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    return dict;
}

// read from file in root folder (.plist created in the project root)
+(NSMutableArray*)readFromResourcePlist:(NSString*)namePlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      namePlist ofType:@"plist"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    for (NSString *str in array)
        NSLog(@"--%@", str);
    
    return array;
}

// read from file on the path
+(NSMutableDictionary*)readFromFile:(NSString *)fileName filePath:(NSString *)path

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * pathFolder = [NSString stringWithFormat:@"%@/%@/", documentFolder,path];
    
    NSString *plistPath = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.plist",path,fileName]];
    
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    
    if (![defaultManager fileExistsAtPath:path])
        [defaultManager createDirectoryAtPath:pathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    
    NSMutableDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    return dict;
    
}


// output file names are on the way "./document/path"
+(NSArray*)checkFileFromFolder:(NSString *)path
{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    
    NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"%@/%@/",documentFolder,path] error:nil];
    
    for (int i = 0; i<[dirContents count ]; i++) {
        NSLog(@"document  = %@",[dirContents objectAtIndex:i]);
    }
    
    return dirContents;
    
}

// delete file
+(void)deleteFile:(NSString *)filePath

{
    
    NSError *error;
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * result = @"";
    result = [result stringByAppendingFormat:documentFolder];
    result = [result stringByAppendingFormat:@"/"];
    result = [result stringByAppendingFormat:filePath];
    if ([[NSFileManager defaultManager] removeItemAtPath:result error:&error] != YES)
        NSLog(@"Unable to delete file: %@", [error localizedDescription]);
}

@end
