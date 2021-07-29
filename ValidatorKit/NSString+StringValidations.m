//
//  NSString+StringValidations.m
//  ValidatorKit
//
//  Created by Fernando de Lucas da Silva Gomes on 26/07/21.
//

#import "NSString+StringValidations.h"

@implementation NSString (StringValidations)

// Return false if the string has no character
- (BOOL) isEmpty{
    return ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0);
}

// Return true if the string is an email
-(BOOL) isEmail {
    NSString *emailRegex = (@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isValid = [emailTest evaluateWithObject: self];
    return isValid;
}
@end
