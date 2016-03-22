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
   
    // MARK: New strings
    
    func testNewStringSubstring() throws {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing("World", replacement: "You") == "Hello You!")
    }

    func testNewStringSubstringWithEmpty() throws {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing(" World", replacement: "") == "Hello!")
    }

    func testNewStringEmptySubstring() throws {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing("", replacement: "You") == "Hello World!")
    }

    func testNewStringRange() throws {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing(s.startIndex.advanced(by: 6)..<s.startIndex.advanced(by: 6+5), replacement: "You") == "Hello You!")
    }
    
    func testNewStringRangeWithEmpty() throws {
        let s = "Hello World!"
        XCTAssert(s.stringByReplacing(s.startIndex.advanced(by: 5)..<s.startIndex.advanced(by: 6+5), replacement: "") == "Hello!")
    }

    // MARK: String modification
    
    func testModifySubstring() throws {
        var s = "Hello World!"
        s.replace("World", replacement: "You")
        XCTAssert(s == "Hello You!")
    }
    
    func testModifySubstringWithEmpty() throws {
        var s = "Hello World!"
        s.replace(" World", replacement: "")
        XCTAssert(s == "Hello!")
    }
    
    func testModifyEmptySubstring() throws {
        var s = "Hello World!"
        s.replace("", replacement: "You")
        XCTAssert(s == "Hello World!")
    }
    
    func testModifyRange() throws {
        var s = "Hello World!"
        s.replace(s.startIndex.advanced(by: 6)..<s.startIndex.advanced(by: 6+5), replacement: "You")
        XCTAssert(s == "Hello You!")
    }
    
    func testModifyRangeWithEmpty() throws {
        var s = "Hello World!"
        s.replace(s.startIndex.advanced(by: 5)..<s.startIndex.advanced(by: 6+5), replacement: "")
        XCTAssert(s == "Hello!")
    }  
}

#if os(Linux) 
extension replaceTests {
    static var allTests : [(String, replaceTests -> () throws -> Void)] {
        return [
            ("testNewStringSubstring", testNewStringSubstring),
            ("testNewStringSubstringWithEmpty", testNewStringSubstringWithEmpty),
            ("testNewStringEmptySubstring", testNewStringEmptySubstring)
        ]
    }
}
#endif
