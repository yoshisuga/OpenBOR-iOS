//
//  IOSUtils.m
//  xm8-ios
//
//  Created by Yoshi Sugawara on 12/12/16.
//
//

#import "IOSUtils.h"
#import <UIKit/UIKit.h>

#include "ios-glue.h"

void ios_get_base_path(char *path) {
    NSArray *paths;
    NSString *DocumentsDirPath;
    
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    DocumentsDirPath = [paths objectAtIndex:0];
    sprintf(path, "%s/", [DocumentsDirPath UTF8String]);
}

void ios_get_screen_width_height(int *width, int *height) {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    *height = (int) screenRect.size.width;
    *width = (int) screenRect.size.height;
}

@implementation IOSUtils


@end

