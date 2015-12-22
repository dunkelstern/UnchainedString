//
//  replace.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

import Foundation

import XCTest

@testable import UnchainedString

class replaceTests: XCTestCase {
    var allTests : [(String, () -> Void)] {
        return [
            ("testNewStringSubstring", testNewStringSubstring),
            ("testNewStringSubstringWithEmpty", testNewStringSubstringWithEmpty),
            ("testNewStringEmptySubstring", testNewStringEmptySubstring)
        ]
    }
    
    // MARK: New strings
    
    func testNewStringSubstring() {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing("World", replacement: "You") == "Hello You!")
    }

    func testNewStringSubstringWithEmpty() {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing(" World", replacement: "") == "Hello!")
    }

    func testNewStringEmptySubstring() {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing("", replacement: "You") == "Hello World!")
    }

    func testNewStringRange() {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing(s.startIndex.advancedBy(6)..<s.startIndex.advancedBy(6+5), replacement: "You") == "Hello You!")
    }
    
    func testNewStringRangeWithEmpty() {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing(s.startIndex.advancedBy(5)..<s.startIndex.advancedBy(6+5), replacement: "") == "Hello!")
    }

    // MARK: String modification
    
    func testModifySubstring() {
        var s = "Hello World!"
        s.replace("World", replacement: "You")
        XCTAssert(s == "Hello You!")
    }
    
    func testModifySubstringWithEmpty() {
        var s = "Hello World!"
        s.replace(" World", replacement: "")
        XCTAssert(s == "Hello!")
    }
    
    func testModifyEmptySubstring() {
        var s = "Hello World!"
        s.replace("", replacement: "You")
        XCTAssert(s == "Hello World!")
    }
    
    func testModifyRange() {
        var s = "Hello World!"
        s.replace(s.startIndex.advancedBy(6)..<s.startIndex.advancedBy(6+5), replacement: "You")
        XCTAssert(s == "Hello You!")
    }
    
    func testModifyRangeWithEmpty() {
        var s = "Hello World!"
        s.replace(s.startIndex.advancedBy(5)..<s.startIndex.advancedBy(6+5), replacement: "")
        XCTAssert(s == "Hello!")
    }

    

}