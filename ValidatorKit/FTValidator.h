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
@property BOOL onlyNumbers;
@property BOOL notEmptyNorOnlyWhitespaces;
-(NSMutableArray *) validate:(NSString *) text;
-(BOOL) validateEmail:(NSString *) text;
-(NSString *) removeWhiteSpace:(NSString *) text;

@end
