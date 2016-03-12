//
//  whitespace.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

import Foundation

import XCTest

@testable import UnchainedString

class whitespaceTests: XCTestCase {
    var allTests : [(String, () throws -> Void)] {
        return [
            ("testWhitespaceAtBeginning", testWhitespaceAtBeginning),
            ("testWhitespaceAtEnd", testWhitespaceAtEnd),
            ("testWhitespaceAtBeginningAndEnd", testWhitespaceAtBeginningAndEnd),
            ("testNoWhitespace", testNoWhitespace),
        ]
    }
    
    func testWhitespaceAtBeginning() throws {
        let s = "\n \t whitespace"
        XCTAssert(s.stringByTrimmingWhitespace() == "whitespace")
    }
    
    func testWhitespaceAtEnd() throws {
        let s = "whitespace\n \t "
        XCTAssert(s.stringByTrimmingWhitespace() == "whitespace")
    }
    
    func testWhitespaceAtBeginningAndEnd() throws {
        let s = "  \n \t \r\nwhitespace\n \t "
        XCTAssert(s.stringByTrimmingWhitespace() == "whitespace")
    }
    
    func testNoWhitespace() throws {
        let s = "whitespace"
        XCTAssert(s.stringByTrimmingWhitespace() == "whitespace")
    }
}
