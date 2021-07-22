//
//  ErrorHandle.h
//  ValidatorKit
//
//  Created by Fernando de Lucas da Silva Gomes on 22/07/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, InvalidString) {
    tooShort,
    tooLong,
    specialCharacterFound,
};


@interface ErrorHandle: NSObject

@property (nonatomic, readwrite, assign) InvalidString errorType;
@property (readwrite, assign) NSString* errorMessage;

- (NSString *) errorFeedback: (InvalidString) invalido;


@end


NS_ASSUME_NONNULL_END
