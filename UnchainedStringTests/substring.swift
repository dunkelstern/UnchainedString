//
//  substring.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

import XCTest

@testable import UnchainedString

class substringTests: XCTestCase {
    var allTests : [(String, () -> Void)] {
        return [
            ("testSubstring", testSubstring),
            ("testSubstringFullRange", testSubstringFullRange),
            ("testSubstringToIndex", testSubstringToIndex),
            ("testSubstringFromIndex", testSubstringFromIndex),
        ]
    }
    
    func testSubstring() {
        let s = "Extract (a rather unimportant) substring"
        let substring = s.subString(s.startIndex.advancedBy(8)...s.startIndex.advancedBy(29))
        XCTAssert(substring == "(a rather unimportant)")
    }
    
    func testSubstringFullRange() {
        let s = "Extract (a rather unimportant) substring"
        let substring = s.subString(s.startIndex..<s.endIndex)
        XCTAssert(substring == s)
    }
    
    func testSubstringToIndex() {
        let s = "Extract (a rather unimportant) substring"
        let substring = s.subString(toIndex: s.startIndex.advancedBy(8))
        XCTAssert(substring == "Extract ")
    }
    
    func testSubstringFromIndex() {
        let s = "Extract (a rather unimportant) substring"
        let substring = s.subString(fromIndex: s.startIndex.advancedBy(8))
        XCTAssert(substring == "(a rather unimportant) substring")
    }
}