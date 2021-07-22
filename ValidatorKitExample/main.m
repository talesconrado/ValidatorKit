//
//  main.m
//  ValidatorKitExample
//
//  Created by Fernando de Lucas da Silva Gomes on 22/07/21.
//

#import <Foundation/Foundation.h>
#import "FTValidator.h"

int main(int argc, const char * argv[]) {
    FTValidator *validator = [[FTValidator alloc] init];
    validator.maxLength = 3;
    [validator validate:@"Maior"];
//    NSLog()

    return 0;
}
