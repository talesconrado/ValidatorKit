# ValidatorKit
## Introduction

ValidatorKit is a Objective-C framework compatible with all iOS devices that helps developers to validate strings through some constraints. 
With ValidatorKit, all you had to do is create an instance of FTValidator with the constraints you want to, them call the function `validate(_ text: String)` to check if the passed string conform with the passed constraints.
The `validate(_ text: String)` check each constraint before returns an array of ErrorHandle, an exception containing all the constraints that failed. 


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
