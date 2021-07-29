//
//  ValidatorKitTests_Swift.swift
//  ValidatorKitTests-Swift
//
//  Created by Tales Conrado on 26/07/21.
//

import XCTest
@testable import ValidatorKit

class ValidatorKitTests_Swift: XCTestCase {
    var sut: FTValidator!

    override func setUp() {
        sut = FTValidator()
    }

    override func tearDown() {
        sut = nil
    }

    func test_maxLenghtSetBiggerThanSizeThenIsValid() {
        sut.maxLength = 15
        let errors = sut.validate("123")

        // should not return errors
        XCTAssert(errors?.count == 0)
    }

    func test_maxLenghtSetLowerThanSizeThenIsNotValid() {
        sut.maxLength = 1
        let errors = sut.validate("123")

        // should return 1 error
        XCTAssert(errors?.count == 1)
    }

    func test_minLenghtSetLowerThanSizeThenIsValid() {
        sut.minLength = 1
        let errors = sut.validate("123")

        // should not return errors
        XCTAssert(errors?.count == 0)
    }

    func test_minLenghtSetBiggerThanSizeThenIsNotValid() {
        sut.minLength = 15
        let errors = sut.validate("123")

        // should return 1 error
        XCTAssert(errors?.count == 1)
    }

    func test_allowSpecialCharsThenIsValid() {
        sut.allowSpecialCharacters = true
        let errors = sut.validate("!@#")

        // should not return errors
        XCTAssert(errors?.count == 0)
    }

    func test_forbidSpecialCharsThenIsNotValid() {
        sut.allowSpecialCharacters = false
        let errors = sut.validate("!@#")

        // should return 1 error
        XCTAssert(errors?.count == 1)
    }

    func test_onlyNumbersThenIsValid() {
        sut.onlyNumbers = true
        let errors = sut.validate("123")

        // should not return errors
        XCTAssert(errors?.count == 0)
    }

    func test_notOnlyNumbersThenIsValid() {
        sut.onlyNumbers = false
        let errors = sut.validate("!@#")

        // should not return errors
        XCTAssert(errors?.count == 0)
    }

    func test_onlyNumbersThenIsInvalid() {
        sut.onlyNumbers = true
        let errors = sut.validate("!@#")

        // should return 1 error
        XCTAssert(errors?.count == 1)
    }

    func test_allowEmptyString() {
        sut.notEmptyNorOnlyWhitespaces = false
        let errors = sut.validate(" ")

        XCTAssert(errors?.count == 0)
    }

    func test_dontAllowEmptyStringThenIsValid() {
        sut.notEmptyNorOnlyWhitespaces = true
        let errors = sut.validate("abc")

        XCTAssert(errors?.count == 0)
    }

    func test_dontAllowEmptyStringThenIsNotValid() {
        sut.notEmptyNorOnlyWhitespaces = true
        let errors = sut.validate(" ")

        XCTAssert(errors?.count == 1)
    }
    
    func test_notAnEmailThenIsNotValid() { XCTAssertFalse(sut.validateEmail("  ")) }
    
    func test_anEmailThenIsValid() { XCTAssertTrue(sut.validateEmail("example@gmail.com")) }
    
    func test_isEqualThenIsValid() {
        let testString = "Teste Teste"
        XCTAssertEqual( sut.removeWhiteSpace(testString), "TesteTeste")
    }
}

