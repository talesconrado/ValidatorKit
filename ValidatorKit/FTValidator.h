//
//  FTValidator.h
//  ValidatorKit
//
//  Created by Tales Conrado on 22/07/21.
//
#import <Foundation/Foundation.h>

@interface FTValidator : NSObject
@property int maxLength;
@property int minLength;
@property BOOL allowSpecialCharacters;
- (BOOL) validate:(NSString *) text;

@end
