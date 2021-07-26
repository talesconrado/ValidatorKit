//
//  NSString+StringValidations.h
//  ValidatorKit
//
//  Created by Fernando de Lucas da Silva Gomes on 26/07/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (StringValidations)
- (BOOL) isEmpty;
- (BOOL) isEmail;
@end

NS_ASSUME_NONNULL_END
