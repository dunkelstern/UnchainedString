//
//  replace.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

/// String replacement functions
public extension String {

    /// Return new string with `range` replaced by `replacement`
    ///
    /// - parameter range: range to replace
    /// - parameter replacement: replacement
    /// - returns: new string with substituted range
    public func stringByReplacing(range: Range<String.Index>, replacement: String) -> String {
        let before = self.subString(self.startIndex..<range.startIndex)
        let after = self.subString(range.endIndex..<self.endIndex)
        return String.join([before, after], delimiter: replacement)
    }
    
    /// Search for a substring and replace with other string
    ///
    /// - parameter searchTerm: substring to search
    /// - parameter replacement: replacement to substitute
    /// - returns: new string with applied substitutions
    public func stringByReplacing(searchTerm: String, replacement: String) -> String {
        if searchTerm.characters.count == 0 {
            return self
        }
        let comps = self.split(searchTerm)
        return String.join(comps, delimiter: replacement)
    }
    
    /// Replace `range` in string with substitute, modifies self
    ///
    /// - parameter range: range to replace
    /// - parameter replacement: substitute
    public mutating func replace(range: Range<String.Index>, replacement: String) {
        self = self.stringByReplacing(range, replacement: replacement)
    }

    /// Replace substring in string, modifies self
    ///
    /// - parameter searchTerm: string to replace
    /// - parameter replacement: substitute
    public mutating func replace(searchTerm: String, replacement: String) {
        if searchTerm.characters.count == 0 {
            return
        }
        
        self = self.stringByReplacing(searchTerm, replacement: replacement)
    }
    
}