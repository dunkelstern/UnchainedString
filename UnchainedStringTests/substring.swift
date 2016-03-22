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
    
    func testSubstring() throws {
        let s = "Extract (a rather unimportant) substring"
        let substring = s.subString(s.startIndex.advanced(by: 8)...s.startIndex.advanced(by: 29))
        XCTAssert(substring == "(a rather unimportant)")
    }
    
    func testSubstringFullRange() throws {
        let s = "Extract (a rather unimportant) substring"
        let substring = s.subString(s.startIndex..<s.endIndex)
        XCTAssert(substring == s)
    }
    
    func testSubstringToIndex() throws {
        let s = "Extract (a rather unimportant) substring"
        let substring = s.subString(toIndex: s.startIndex.advanced(by: 8))
        XCTAssert(substring == "Extract ")
    }
    
    func testSubstringFromIndex() throws {
        let s = "Extract (a rather unimportant) substring"
        let substring = s.subString(fromIndex: s.startIndex.advanced(by: 8))
        XCTAssert(substring == "(a rather unimportant) substring")
    }
}

#if os(Linux)
extension substringTests {
    static var allTests : [(String, substringTests -> () throws -> Void)] {
        return [
            ("testSubstring", testSubstring),
            ("testSubstringFullRange", testSubstringFullRange),
            ("testSubstringToIndex", testSubstringToIndex),
            ("testSubstringFromIndex", testSubstringFromIndex),
        ]
    }
}
#endif