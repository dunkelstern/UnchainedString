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
    var allTests : [(String, () throws -> Void)] {
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
        ]
    }
    
    // MARK: Position of char
    
    func testPositionOfChar() throws {
        let c: Character = "."
        let s = "Just a string with a . in it"
        if let result = s.position(c) {
            XCTAssert(s.startIndex.advancedBy(21) == result)
        } else {
            XCTFail(". not found")
        }
    }

    func testPositionOfCharNotFound() throws {
        let c: Character = "!"
        let s = "Just a string with a . in it"
        if let _ = s.position(c) {
            XCTFail("Should not find a position")
        }
    }

    func testPositionOfCharReverse() throws {
        let c: Character = "i"
        let s = "Just a string with a . in it"
        if let result = s.position(c, reverse: true) {
            XCTAssert(s.startIndex.advancedBy(26) == result)
        } else {
            XCTFail("i not found")
        }
    }

    func testPositionOfCharStartIndex() throws {
        let c: Character = "i"
        let s = "Just a string with a . in it"
        if let result = s.position(c, index: s.startIndex.advancedBy(22)) {
            XCTAssert(s.startIndex.advancedBy(23) == result)
        } else {
            XCTFail("i not found")
        }
    }

    func testPositionOfCharStartIndexReverse() throws {
        let c: Character = "i"
        let s = "Just a string with a . in it"
        if let result = s.position(c, index: s.startIndex.advancedBy(25), reverse: true) {
            XCTAssert(s.startIndex.advancedBy(23) == result)
        } else {
            XCTFail("i not found")
        }
    }

    func testPositionsOfChar() throws {
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

    func testPositionsOfCharNotFound() throws {
        let c: Character = "!"
        let s = "Just a string with a . in it"
        let result = s.positions(c)
        XCTAssert(result.count == 0)
    }

    // MARK: Position of string
    
    func testPositionOfString() throws {
        let n = "a "
        let s = "Just a string with a . in it"
        if let result = s.position(n) {
            XCTAssert(s.startIndex.advancedBy(5) == result)
        } else {
            XCTFail("'a ' not found")
        }
    }
    
    func testPositionOfStringNotFound() throws {
        let n = "! "
        let s = "Just a string with a . in it"
        if let _ = s.position(n) {
            XCTFail("Should not find a position")
        }
    }
    
    func testPositionOfStringReverse() throws {
        let n = "a "
        let s = "Just a string with a . in it"
        if let result = s.position(n, reverse: true) {
            XCTAssert(s.startIndex.advancedBy(19) == result)
        } else {
            XCTFail("'a ' not found")
        }
    }
    
    func testPositionOfStringStartIndex() throws {
        let n = "a "
        let s = "Just a string with a . in it"
        if let result = s.position(n, index: s.startIndex.advancedBy(10)) {
            XCTAssert(s.startIndex.advancedBy(19) == result)
        } else {
            XCTFail("'a ' not found")
        }
    }
    
    func testPositionOfStringStartIndexReverse() throws {
        let n = "a "
        let s = "Just a string with a . in it"
        if let result = s.position(n, index: s.startIndex.advancedBy(10), reverse: true) {
            XCTAssert(s.startIndex.advancedBy(5) == result)
        } else {
            XCTFail("'a ' not found")
        }
    }
    
    func testPositionsOfString() throws {
        let n = "a "
        let s = "Just a string with a . in it"
        let result = s.positions(n)
        XCTAssert(result.count == 2)
        if result.count == 2 {
            XCTAssert(result[0] == s.startIndex.advancedBy(5))
            XCTAssert(result[1] == s.startIndex.advancedBy(19))
        }
    }
    
    func testPositionsOfStringNotFound() throws {
        let n = "! "
        let s = "Just a string with a . in it"
        let result = s.positions(n)
        XCTAssert(result.count == 0)
    }
    
    // MARK: Contains

    func testContainsChar() throws {
        let c: Character = "."
        let s = "Just a string with a . in it"
        XCTAssertTrue(s.contains(c))
    }

    func testContainsCharNotFound() throws {
        let c: Character = "!"
        let s = "Just a string with a . in it"
        XCTAssertFalse(s.contains(c))
    }

    func testContainsString() throws {
        let n = "in"
        let s = "Just a string with a . in it"
        XCTAssertTrue(s.contains(n))
    }
    
    func testContainsStringNotFound() throws {
        let n = "out"
        let s = "Just a string with a . in it"
        XCTAssertFalse(s.contains(n))
    }

}
