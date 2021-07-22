//
//  FTValidator.m
//  ValidatorKit
//
//  Created by Tales Conrado on 22/07/21.
//
#import <Foundation/Foundation.h>
#import "FTValidator.h"
#import "ErrorHandle.h"

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
        @try{
            [self validateMaxSize:text andSize:maxLength];
        } @catch(ErrorHandle *e) {
            NSLog(@"Exception: %@", e.errorMessage);
        } @finally{
            NSLog(@"Continuando");
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


- (void) validateMaxSize:(NSString *) text andSize: (int) size {
    if ([text length] > size) {
//        @throw [NSException exceptionWithName: (@"Error") reason:(@"Error") userInfo:nil];
        ErrorHandle *error = [[ErrorHandle alloc] init];
        error.errorMessage = [error errorFeedback:tooLong];
        @throw error;
//        return NO;
    } else {
//        return YES;
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


@implementation ErrorHandle

-(NSString *) errorFeedback: (InvalidString)invalidated{
    switch (invalidated) {
        case tooShort: return(@"Invalid"); break;
        case tooLong: return(@"Mais caracteres do que esperado"); break;
        case specialCharacterFound: return(@"Invalid"); break;
    }
}
@end
