//
//  FTValidator.m
//  ValidatorKit
//
//  Created by Tales Conrado on 22/07/21.
//
#import <Foundation/Foundation.h>
#import "FTValidator.h"
#import "ErrorHandle.h"
/// An object that represents a FTValidator.
///
/// FTValidator is a string validator. Create a new FTValidator() to build constraints and use then to validate your input.
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

/// Validate the passed string throw the constraints
/// @param text The string you want to validade.
/// @return Returns an array containing all the non-passed constraints.
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

/// Recieve a string and a size and throw an error if the string is bigger than the given size
- (void) validateMaxSize:(NSString *) text andSize: (int) size {
    if ([text length] > size) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = tooLong;
        @throw error;
    }
}

/// Recieve a string and a size and throw an error if the string is smaller than the given size
- (void) validateMinSize:(NSString *) text andSize: (int) size {
    if ([text length] < size) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = tooShort;
        @throw error;
    }
}

/// Recieve a string throw an error if the string has an special character.
- (void) validateSpecial:(NSString *) text {

    NSCharacterSet * set = [[NSCharacterSet alphanumericCharacterSet] invertedSet];

    if ([text rangeOfCharacterFromSet:set].location != NSNotFound) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = specialCharacterFound;
        @throw error;
    }
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
