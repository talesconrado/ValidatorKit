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
@synthesize maxLength, minLength, allowSpecialCharacters, onlyNumbers, notEmptyNorOnlyWhitespaces;

- (instancetype)init
{
    self = [super init];
    if (self) {
        allowSpecialCharacters = true;
        onlyNumbers = false;
        notEmptyNorOnlyWhitespaces = false;
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
            [self validateMinSize:text andSize:minLength];
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

    if (onlyNumbers) {
        @try{
            [self validateOnlyNumbers:text];
        } @catch(ErrorHandle *e) {
            [errors addObject:e];
            NSLog(@"Exception: %@", e.errorMessage);
        } @finally{}
    }

    if (notEmptyNorOnlyWhitespaces) {
        @try{
            [self validateNotEmptyNorWhitespace:text];
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
    }
    
}

- (void) validateMinSize:(NSString *) text andSize: (int) size {
    if ([text length] < size) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = tooShort;
        @throw error;
    }
}

- (void) validateSpecial:(NSString *) text {

    NSCharacterSet * set = [[NSCharacterSet alphanumericCharacterSet] invertedSet];

    if ([text rangeOfCharacterFromSet:set].location != NSNotFound) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = specialCharacterFound;
        @throw error;
    }
}

- (void) validateOnlyNumbers:(NSString *) text {
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([text rangeOfCharacterFromSet:notDigits].location != NSNotFound) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = notANumber;
        @throw error;
    }
}

- (void) validateNotEmptyNorWhitespace:(NSString *) text {
    NSString * newString = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([newString length] == 0) {
        ErrorHandle * error = [[ErrorHandle alloc] init];
        error.errorType = notEmptyNorWithWhitespace;
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
        case notANumber: return(@"Found a non number character"); break;
        case notEmptyNorWithWhitespace: return(@"The string is empty or has only whitespaces"); break;
    }
}

- (void)setErrorType:(InvalidString) errorType{
    _errorType = errorType;
    _errorMessage = [self errorFeedback: errorType];
}
@end
