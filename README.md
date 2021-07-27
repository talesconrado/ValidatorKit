# ValidatorKit


## Introduction

ValidatorKit is a Objective-C framework compatible with all iOS devices that helps developers to validate strings through some constraints. 
With ValidatorKit, all you had to do is create an instance of FTValidator with the constraints you want to, them call the function `validate(_ text: String)` to check if the passed string conform with the passed constraints.
The `validate(_ text: String)` check each constraint before returns an array of ErrorHandle, an exception containing all the constraints that failed. 

**Constraints**
``` maxLenght(int)``` define an max length for the given string. 

``` minLenght(int)``` define an min length for the given string.

``` allowsSpecialCharacters(bool)``` set to false to invalidate string special characters - default is true-. 

``` onlyNumbers(bool)``` set to true to invalidate a string if the string has a non number character - default is false-. 

``` notEmptyNorOnlyWhitespaces(bool)``` set to true to invalidate a string if the string is empty or has only whitespaces - default is false-. 

**Functions** 
``` swift 
validate(_ text: String) 
```  
Check if the given string text conform with the passed constraints; 


``` swift 
validateEmail(_ text: String) 
```  
Check if the given string is an email;

**Errors** 
All the functions can return one or an array of ErrorHandle, an object containing the error type and an errorMessage containing an description of what failed in the test. 

## Install

**CocoaPods**

    pod 'ValidatorKit', :git => 'https://github.com/talesconrado/ValidatorKit'

## Example

  

  
```swift
let stringValidator: FTValidator = {
    let validator = FTValidator()
    validator.maxLength = 4
    validator.minLength = 1
    validator.allowSpecialCharacters =` false
    return validator
    }()
    
    let myString = "MY STRING"
    
    guard stringValidator.validate(myString).count == 0 else { 
    // handle errors
    }
```
