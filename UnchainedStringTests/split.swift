//
//  UnchainedStringTests.swift
//  UnchainedStringTests
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

import XCTest

@testable import UnchainedString

class splitTests: XCTestCase {
    var allTests : [(String, () -> Void)] {
        return [
            ("testJoinWithString", testJoinWithString),
            ("testJoinWithStringAndEmptyArray", testJoinWithStringAndEmptyArray),
            ("testJoinWithStringAndSingleItemArray", testJoinWithStringAndSingleItemArray),
            ("testJoinWithEmptyString", testJoinWithEmptyString),
            ("testJoinWithEmptyStringAndEmptyArray", testJoinWithEmptyStringAndEmptyArray),
            ("testJoinWithChar", testJoinWithChar),
            ("testJoinWithCharAndEmptyArray", testJoinWithCharAndEmptyArray),
            ("testJoin", testJoin),
            ("testJoinWithEmptyArray", testJoinWithEmptyArray),
            ("testSplitByDelimiterChar", testSplitByDelimiterChar),
            ("testSplitByDelimiterCharAndEmptyString", testSplitByDelimiterCharAndEmptyString),
            ("testSplitByDelimiterCharMaxsplit", testSplitByDelimiterCharMaxsplit),
            ("testSplitByDelimiterString", testSplitByDelimiterString),
            ("testSplitByDelimiterStringAndEmptyString", testSplitByDelimiterStringAndEmptyString),
            ("testSplitByDelimiterStringMaxsplit", testSplitByDelimiterStringMaxsplit)
        ]
    }
    
    func testJoinWithString() {
        let result = String.join(["Item 0", "Item 1", "Item 2"], delimiter: ", ")
        XCTAssert(result == "Item 0, Item 1, Item 2")
    }

    func testJoinWithStringAndEmptyArray() {
        let result = String.join([String](), delimiter: ", ")
        XCTAssert(result == "")
    }

    func testJoinWithStringAndSingleItemArray() {
        let result = String.join(["Test"], delimiter: ", ")
        XCTAssert(result == "Test")
    }

    func testJoinWithEmptyString() {
        let delim: String = ""
        let result = String.join(["Item 0", "Item 1", "Item 2"], delimiter: delim)
        XCTAssert(result == "Item 0Item 1Item 2")
    }

    func testJoinWithEmptyStringAndEmptyArray() {
        let delim: String = ""
        let result = String.join([String](), delimiter: delim)
        XCTAssert(result == "")
    }

    func testJoinWithChar() {
        let delim: Character = ","
        let result = String.join(["Item 0", "Item 1", "Item 2"], delimiter: delim)
        XCTAssert(result == "Item 0,Item 1,Item 2")
    }

    func testJoinWithCharAndEmptyArray() {
        let delim: Character = ","
        let result = String.join([String](), delimiter: delim)
        XCTAssert(result == "")
    }

    func testJoin() {
        let result = String.join(["Item 0", "Item 1", "Item 2"])
        XCTAssert(result == "Item 0Item 1Item 2")
    }

    func testJoinWithEmptyArray() {
        let result = String.join([String]())
        XCTAssert(result == "")
    }
    
    func testSplitByDelimiterChar() {
        let delim: Character = ","
        let result = "Item 0,Item 1,Item 2".split(delim)
        XCTAssert(result.count == 3)
        if result.count == 3 {
            XCTAssert(result[0] == "Item 0")
            XCTAssert(result[1] == "Item 1")
            XCTAssert(result[2] == "Item 2")
        }
    }

    func testSplitByDelimiterCharAndEmptyString() {
        let delim: Character = ","
        let result = "".split(delim)
        XCTAssert(result.count == 1)
        if result.count == 1 {
            XCTAssert(result[0] == "")
        }
    }
    
    func testSplitByDelimiterCharMaxsplit() {
        let delim: Character = ","
        let result = "Item 0,Item 1,Item 2,Item 3".split(delim, maxSplits: 2)
        XCTAssert(result.count == 3)
        if result.count == 3 {
            XCTAssert(result[0] == "Item 0")
            XCTAssert(result[1] == "Item 1")
            XCTAssert(result[2] == "Item 2,Item 3")
        }
    }

    func testSplitByDelimiterString() {
        let result = "Item 0, Item 1, Item 2".split(", ")
        XCTAssert(result.count == 3)
        if result.count == 3 {
            XCTAssert(result[0] == "Item 0")
            XCTAssert(result[1] == "Item 1")
            XCTAssert(result[2] == "Item 2")
        }
    }
    
    func testSplitByDelimiterStringAndEmptyString() {
        let result = "".split(", ")
        XCTAssert(result.count == 1)
        if result.count == 1 {
            XCTAssert(result[0] == "")
        }
    }
    
    func testSplitByDelimiterStringMaxsplit() {
        let result = "Item 0, Item 1, Item 2, Item 3".split(", ", maxSplits: 2)
        XCTAssert(result.count == 3)
        if result.count == 3 {
            XCTAssert(result[0] == "Item 0")
            XCTAssert(result[1] == "Item 1")
            XCTAssert(result[2] == "Item 2, Item 3")
        }
    }

}
