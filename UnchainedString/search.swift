//
//  search.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

/// Character and substring search
public extension String {
    
    /// Search for a character in a string
    ///
    /// - parameter character: character to search
    /// - parameter index: (optional) start index, defaults to start or end of string depending on `reverse`
    /// - parameter reverse: (optional) search backwards from the `index` or the end of the string
    /// - returns: `String.Index` if character was found or `nil`
    public func position(character: Character, index: String.Index? = nil, reverse: Bool = false) -> String.Index? {
        if reverse {
            var i = (index == nil) ? self.endIndex.predecessor() : index!
            while i >= self.startIndex {
                if self.characters[i] == character {
                    return i
                }
                i = i.predecessor()
            }
        } else {
            let start = (index == nil) ? self.startIndex : index!
            for i in start..<self.endIndex {
                if self.characters[i] == character {
                    return i
                }
            }
        }
        return nil
    }
    
    /// Return array with string indices of found character positions
    ///
    /// - parameter character: character to search
    /// - returns: array of `String.Index` or empty array if character not found
    public func positions(character: Character) -> [String.Index] {
        var result = Array<String.Index>()
        var p = self.position(character)
        while p != nil  {
            result.append(p!)
            p = self.position(character, index: p!.successor())
        }
        return result
    }

    /// Search for a substring
    ///
    /// - parameter string: substring to search
    /// - parameter index: (optional) start index, defaults to start or end of string depending on `reverse`
    /// - parameter reverse: (optional) search backwards from the `index` or the end of the string
    /// - returns: `String.Index` if character was found or `nil`
    public func position(string: String, index: String.Index? = nil, reverse: Bool = false) -> String.Index? {
        if self.characters.count < string.characters.count {
            // search term longer than self
            return nil
        }

        if reverse {
            if index != nil && self.startIndex.distanceTo(index!) < string.characters.count {
                // can not find match because string is too short for match
                return nil
            }
            
            // start with index/self.endIndex and go back
            var i = (index == nil) ? self.endIndex.advancedBy(-string.characters.count) : index!
            while i >= self.startIndex {

                var idx = i
                
                // compare substring
                var match = true
                for character in string.characters {
                    if self.characters[idx] != character {
                        match = false
                        break
                    }
                    idx = idx.successor()
                }
                if match {
                    return i
                }
                i = i.predecessor()
            }
        } else {
            if index != nil && index!.distanceTo(self.endIndex) < string.characters.count {
                // can not find match because string is too short for match
                return nil
            }
            let start = (index == nil) ? self.startIndex : index!
            
            // iterate from start to end - search string length
            for i in start..<self.endIndex.advancedBy(-string.characters.count) {
                var idx = i
                
                // compare substring
                var match = true
                for character in string.characters {
                    if self.characters[idx] != character {
                        match = false
                        break
                    }
                    idx = idx.successor()
                }
                if match {
                    return i
                }
            }
        }
        return nil
    }
    
    /// Return array with string indices of found substring positions
    ///
    /// - parameter string: substring to search
    /// - returns: array of `String.Index` or empty array if substring not found
    public func positions(string: String) -> [String.Index] {
        var result = Array<String.Index>()
        var p = self.position(string)
        while p != nil  {
            result.append(p!)
            p = self.position(string, index: p!.successor())
        }
        return result
    }

    /// Search for a substring
    ///
    /// - parameter string: string to search
    /// - returns: `true` if the string contains the substring
    public func contains(string: String) -> Bool {
        return self.position(string) != nil
    }
    
    /// Search for a character
    ///
    /// - parameter char: character to search
    /// - returns: `true` if the string contains the character
    public func contains(char: Character) -> Bool {
        return self.position(char) != nil
    }
}
