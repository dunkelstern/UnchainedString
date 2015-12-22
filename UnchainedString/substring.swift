//
//  substring.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

/// Substring creation
public extension String {
    
    /// Create substring from string
    ///
    /// - parameter range: range of the substring, will be clamped to `self.endIndex`
    /// - returns: substring or `nil` if start index out of range
    public func subString(range: Range<String.Index>) -> String {
        var result = ""
        result.reserveCapacity(range.count)
        for idx in range {
            result.append(self.characters[idx])
        }
        return result
    }
    
    /// Create substring from start to index
    ///
    /// - parameter index: end index, excluded
    /// - returns: substring
    public func subString(toIndex index: String.Index) -> String {
        return self.subString(self.startIndex..<index)
    }
    
    /// Create substring from index to end
    ///
    /// - parameter index: start index, included
    /// - returns: substring or `nil` if start index out of range
    public func subString(fromIndex index: String.Index) -> String {
        return self.subString(index..<self.endIndex)
    }
}
