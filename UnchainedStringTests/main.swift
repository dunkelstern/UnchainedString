//
//  main.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

import XCTest

print("Starting tests...")
XCTMain([
	testCase(searchTests.allTests),
	testCase(splitTests.allTests),
	testCase(substringTests.allTests),
	testCase(whitespaceTests.allTests),
	testCase(replaceTests.allTests)
])