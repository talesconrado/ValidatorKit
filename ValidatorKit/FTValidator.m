//
//  FTValidator.m
//  ValidatorKit
//
//  Created by Tales Conrado on 22/07/21.
//

#import "FTValidator.h"

@implementation FTValidator
@synthesize maxLength, minLength, allowSpecialCharacters;

- (instancetype)init
{
    self = [super init];
    if (self) {
        allowSpecialCharacters = true;
    }
    return self;
}

- (BOOL) validate:(NSString *) text {
    if (maxLength > 0) {
        if (![self validateMaxSize:text andSize:maxLength]) {
            return NO;
        }
    }

    if (minLength > 0) {
        if (![self validateMinSize:text andSize:minLength]) {
            return NO;
        }
    }

    if (allowSpecialCharacters == NO) {
        if (![self validateSpecial:text]) {
            return NO;
        }
    }

    return YES;
}


- (BOOL) validateMaxSize:(NSString *) text andSize: (int) size {
    if ([text length] > size) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL) validateMinSize:(NSString *) text andSize: (int) size {
    if ([text length] < size) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL) validateSpecial:(NSString *) text {

    NSCharacterSet * set = [[NSCharacterSet alphanumericCharacterSet] invertedSet];

    if ([text rangeOfCharacterFromSet:set].location != NSNotFound) {
        return NO;
    }

    return YES;
}


@end


