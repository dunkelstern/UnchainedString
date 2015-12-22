//
//  UnchainedStringTests.swift
//  UnchainedStringTests
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

import XCTest

@testable import UnchainedString

class searchTests: XCTestCase {
    var allTests : [(String, () -> Void)] {
        return [
            ("testPositionOfChar", testPositionOfChar),
            ("testPositionOfCharNotFound", testPositionOfCharNotFound),
            ("testPositionOfCharReverse", testPositionOfCharReverse),
            ("testPositionOfCharStartIndex", testPositionOfCharStartIndex),
            ("testPositionOfCharStartIndexReverse", testPositionOfCharStartIndexReverse),
            ("testPositionsOfChar", testPositionsOfChar),
            ("testPositionsOfCharNotFound", testPositionsOfCharNotFound),
            ("testPositionOfString", testPositionOfString),
            ("testPositionOfStringNotFound", testPositionOfStringNotFound),
            ("testPositionOfStringReverse", testPositionOfStringReverse),
            ("testPositionOfStringStartIndex", testPositionOfStringStartIndex),
            ("testPositionOfStringStartIndexReverse", testPositionOfStringStartIndexReverse),
            ("testPositionsOfString", testPositionsOfString),
            ("testPositionsOfStringNotFound", testPositionsOfStringNotFound),
            ("testContainsChar", testContainsChar),
            ("testContainsCharNotFound", testContainsCharNotFound),
            ("testContainsString", testContainsString),
            ("testContainsStringNotFound", testContainsStringNotFound),
            ("testHasPrefix", testHasPrefix),
            ("testHasPrefixNotFound", testHasPrefixNotFound),
            ("testHasEmptyPrefix", testHasEmptyPrefix),
            ("testHasTooLongPrefix", testHasTooLongPrefix),
            ("testHasPrefixAlike", testHasPrefixAlike),
            ("testHasSuffix", testHasSuffix),
            ("testHasSuffixNotFound", testHasSuffixNotFound),
            ("testHasEmptySuffix", testHasEmptySuffix),
            ("testHasTooLongSuffix", testHasTooLongSuffix),
            ("testHasSuffixAlike", testHasSuffixAlike)
        ]
    }
    
    // MARK: Position of char
    
    func testPositionOfChar() {
        let c: Character = "."
        let s = "Just a string with a . in it"
        if let result = s.position(c) {
            XCTAssert(s.startIndex.advancedBy(21) == result)
        } else {
            XCTFail(". not found")
        }
    }

    func testPositionOfCharNotFound() {
        let c: Character = "!"
        let s = "Just a string with a . in it"
        if let _ = s.position(c) {
            XCTFail("Should not find a position")
        }
    }

    func testPositionOfCharReverse() {
        let c: Character = "i"
        let s = "Just a string with a . in it"
        if let result = s.position(c, reverse: true) {
            XCTAssert(s.startIndex.advancedBy(26) == result)
        } else {
            XCTFail("i not found")
        }
    }

    func testPositionOfCharStartIndex() {
        let c: Character = "i"
        let s = "Just a string with a . in it"
        if let result = s.position(c, index: s.startIndex.advancedBy(22)) {
            XCTAssert(s.startIndex.advancedBy(23) == result)
        } else {
            XCTFail("i not found")
        }
    }

    func testPositionOfCharStartIndexReverse() {
        let c: Character = "i"
        let s = "Just a string with a . in it"
        if let result = s.position(c, index: s.startIndex.advancedBy(25), reverse: true) {
            XCTAssert(s.startIndex.advancedBy(23) == result)
        } else {
            XCTFail("i not found")
        }
    }

    func testPositionsOfChar() {
        let c: Character = "i"
        let s = "Just a string with a . in it"
        let result = s.positions(c)
        XCTAssert(result.count == 4)
        if result.count == 4 {
            XCTAssert(result[0] == s.startIndex.advancedBy(10))
            XCTAssert(result[1] == s.startIndex.advancedBy(15))
            XCTAssert(result[2] == s.startIndex.advancedBy(23))
            XCTAssert(result[3] == s.startIndex.advancedBy(26))
        }
    }

    func testPositionsOfCharNotFound() {
        let c: Character = "!"
        let s = "Just a string with a . in it"
        let result = s.positions(c)
        XCTAssert(result.count == 0)
    }

    // MARK: Position of string
    
    func testPositionOfString() {
        let n = "a "
        let s = "Just a string with a . in it"
        if let result = s.position(n) {
            XCTAssert(s.startIndex.advancedBy(5) == result)
        } else {
            XCTFail("'a ' not found")
        }
    }
    
    func testPositionOfStringNotFound() {
        let n = "! "
        let s = "Just a string with a . in it"
        if let _ = s.position(n) {
            XCTFail("Should not find a position")
        }
    }
    
    func testPositionOfStringReverse() {
        let n = "a "
        let s = "Just a string with a . in it"
        if let result = s.position(n, reverse: true) {
            XCTAssert(s.startIndex.advancedBy(19) == result)
        } else {
            XCTFail("'a ' not found")
        }
    }
    
    func testPositionOfStringStartIndex() {
        let n = "a "
        let s = "Just a string with a . in it"
        if let result = s.position(n, index: s.startIndex.advancedBy(10)) {
            XCTAssert(s.startIndex.advancedBy(19) == result)
        } else {
            XCTFail("'a ' not found")
        }
    }
    
    func testPositionOfStringStartIndexReverse() {
        let n = "a "
        let s = "Just a string with a . in it"
        if let result = s.position(n, index: s.startIndex.advancedBy(10), reverse: true) {
            XCTAssert(s.startIndex.advancedBy(5) == result)
        } else {
            XCTFail("'a ' not found")
        }
    }
    
    func testPositionsOfString() {
        let n = "a "
        let s = "Just a string with a . in it"
        let result = s.positions(n)
        XCTAssert(result.count == 2)
        if result.count == 2 {
            XCTAssert(result[0] == s.startIndex.advancedBy(5))
            XCTAssert(result[1] == s.startIndex.advancedBy(19))
        }
    }
    
    func testPositionsOfStringNotFound() {
        let n = "! "
        let s = "Just a string with a . in it"
        let result = s.positions(n)
        XCTAssert(result.count == 0)
    }
    
    // MARK: Contains

    func testContainsChar() {
        let c: Character = "."
        let s = "Just a string with a . in it"
        XCTAssertTrue(s.contains(c))
    }

    func testContainsCharNotFound() {
        let c: Character = "!"
        let s = "Just a string with a . in it"
        XCTAssertFalse(s.contains(c))
    }

    func testContainsString() {
        let n = "in"
        let s = "Just a string with a . in it"
        XCTAssertTrue(s.contains(n))
    }
    
    func testContainsStringNotFound() {
        let n = "out"
        let s = "Just a string with a . in it"
        XCTAssertFalse(s.contains(n))
    }

    // MARK: Prefix
    
    func testHasPrefix() {
        let s = "Just a string with a . in it"
        XCTAssertTrue(s.isPrefixed("Just"))
    }
    
    func testHasPrefixNotFound() {
        let s = "Just a string with a . in it"
        XCTAssertFalse(s.isPrefixed("Foobar"))
    }

    func testHasEmptyPrefix() {
        let s = "Just a string with a . in it"
        XCTAssertTrue(s.isPrefixed(""))
    }
    
    func testHasTooLongPrefix() {
        let s = "Just"
        XCTAssertFalse(s.isPrefixed("Just a long prefix"))
    }

    func testHasPrefixAlike() {
        let s = "Just a string with a . in it"
        XCTAssertFalse(s.isPrefixed("Just a  thing"))
    }
    
    // MARK: Suffix

    func testHasSuffix() {
        let s = "Just a string with a . in it"
        XCTAssertTrue(s.isSuffixed("in it"))
    }
    
    func testHasSuffixNotFound() {
        let s = "Just a string with a . in it"
        XCTAssertFalse(s.isSuffixed("foobar"))
    }
    
    func testHasEmptySuffix() {
        let s = "Just a string with a . in it"
        XCTAssertTrue(s.isSuffixed(""))
    }
    
    func testHasTooLongSuffix() {
        let s = "Just"
        XCTAssertFalse(s.isSuffixed("Just a long prefix"))
    }
    
    func testHasSuffixAlike() {
        let s = "Just a string with a . in it"
        XCTAssertFalse(s.isSuffixed(". of it"))
    }
}
