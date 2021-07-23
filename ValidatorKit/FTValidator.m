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

- (NSMutableArray *) validate:(NSString *) text {
    NSMutableArray<ErrorHandle *> *errors = [[NSMutableArray<ErrorHandle *>  alloc] init];
    if (maxLength > 0) {
        @try{
            [self validateMaxSize:text andSize:maxLength];
        } @catch(ErrorHandle *e) {
            [errors addObject:e];
            NSLog(@"Exception: %@", e.errorMessage);
        } @finally{}
    }

    if (minLength > 0) {
        @try{
            [self validateMaxSize:text andSize:maxLength];
        } @catch(ErrorHandle *e) {
            [errors addObject:e];
            NSLog(@"Exception: %@", e.errorMessage);
        } @finally{}
    }

    if (allowSpecialCharacters == NO) {
        @try{
            [self validateSpecial:text];
        } @catch(ErrorHandle *e) {
            [errors addObject:e];
            NSLog(@"Exception: %@", e.errorMessage);
        } @finally{}
    }

    return errors;
}


- (void) validateMaxSize:(NSString *) text andSize: (int) size {
    if ([text length] > size) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = tooLong;
        @throw error;
//        return NO;
    } else {
//        return YES;
    }
    
}

- (void) validateMinSize:(NSString *) text andSize: (int) size {
    if ([text length] < size) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = tooShort;
        @throw error;
//        return NO;
    } else {
//        return YES;
    }
}

- (void) validateSpecial:(NSString *) text {

    NSCharacterSet * set = [[NSCharacterSet alphanumericCharacterSet] invertedSet];

    if ([text rangeOfCharacterFromSet:set].location != NSNotFound) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = specialCharacterFound;
        @throw error;
//        return NO;
    }

//    return YES;
}


@end


@implementation ErrorHandle

-(NSString *) errorFeedback: (InvalidString)invalidated{
    switch (invalidated) {
        case tooShort: return(@"Less characters than expected"); break;
        case tooLong: return(@"More characters than expected"); break;
        case specialCharacterFound: return(@"Found special characters"); break;
    }
}

- (void)setErrorType:(InvalidString) errorType{
    _errorType = errorType;
    _errorMessage = [self errorFeedback: errorType];
}
@end
