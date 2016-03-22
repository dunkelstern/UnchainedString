//
//  split.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

/// String splitting and joining
public extension String {
    
    /// Join array of strings by using a delimiter string
    ///
    /// - parameter parts: parts to join
    /// - parameter delimiter: delimiter to insert
    /// - returns: combined string
    public static func join(parts: [String], delimiter: String) -> String {

        // calculate final length to reserve space
        var len = 0
        for part in parts {
            len += part.characters.count + delimiter.characters.count
        }

        // reserve space
        var result = ""
        result.reserveCapacity(len)
        
        // join string parts
        for (idx, part) in parts.enumerated() {
            result.append(part)
            if idx < parts.count - 1 {
                result.append(delimiter)
            }
        }
        
        return result
    }

    /// Join array of strings by using a delimiter character
    ///
    /// - parameter parts: parts to join
    /// - parameter delimiter: delimiter to insert
    /// - returns: combined string
    public static func join(parts: [String], delimiter: Character) -> String {

        // calculate final length to reserve space
        var len = 0
        for part in parts {
            len += part.characters.count + 1
        }
        
        // reserve space
        var result = ""
        result.reserveCapacity(len)
        
        // join string parts
        for (idx, part) in parts.enumerated() {
            result.append(part)
            if idx < parts.count - 1 {
                result.append(delimiter)
            }
        }
        
        return result
    }

    /// Join array of strings
    ///
    /// - parameter parts: parts to join
    /// - returns: combined string
    public static func join(parts: [String]) -> String {

        // calculate final length to reserve space
        var len = 0
        for part in parts {
            len += part.characters.count
        }
        
        // reserve space
        var result = ""
        result.reserveCapacity(len)

        // join string parts
        for part in parts {
            result.append(part)
        }
        
        return result
    }
    
    /// Split string into array by using delimiter character
    ///
    /// - parameter character: delimiter to use
    /// - parameter maxSplits: (optional) maximum number of splits, set to 0 to allow unlimited splits
    /// - returns: array with string components
    public func split(character: Character, maxSplits: Int = 0) -> [String] {
        var result = [String]()
        var current = ""
        
        // reserve space, heuristic
        current.reserveCapacity(self.characters.count / 2)
    
        // create generator and add current char to `current`
        var i = 0
        var gen = self.characters.makeIterator()
        while let c = gen.next() {
            if c == character && ((maxSplits == 0) || (result.count < maxSplits)) {
                // if we don't have reached maxSplits or maxSplits is zero and the current character is a delimiter
                // append the current string to the result array and start over
                result.append(current)
                current = ""
                // reserve space again, heuristic
                current.reserveCapacity(self.characters.count - i)
            } else {
                current.append(c)
            }
            i += 1
        }
        result.append(current)
        
        return result
    }
    
    /// Split string into array by using delimiter string
    ///
    /// - parameter string: delimiter to use
    /// - parameter maxSplits: (optional) maximum number of splits, set to 0 to allow unlimited splits
    /// - returns: array with string components
    public func split(string: String, maxSplits: Int = 0) -> [String] {
        var result = [String]()
        let positions = self.positions(string)
        
        var start = self.startIndex
        for idx in positions {
            result.append(self.subString(start..<idx))
            start = idx.advanced(by: string.characters.count)
            if result.count == maxSplits {
                break
            }
        }
        result.append(self.subString(start..<self.endIndex))
        return result
    }

}