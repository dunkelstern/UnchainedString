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
            if index != nil && self.startIndex.distance(to: index!) < string.characters.count {
                // can not find match because string is too short for match
                return nil
            }
            
            // start with index/self.endIndex and go back
            var i = (index == nil) ? self.endIndex.advanced(by: -string.characters.count) : index!
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
            if index != nil && index!.distance(to: self.endIndex) < string.characters.count {
                // can not find match because string is too short for match
                return nil
            }
            let start = (index == nil) ? self.startIndex : index!
            
            // iterate from start to end - search string length
            for i in start..<self.endIndex.advanced(by: -string.characters.count) {
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

#if os(Linux)
    /// Check if a string has a prefix
    ///
    /// - parameter prefix: the prefix to check for
    /// - returns: true if the prefix was an empty string or the string has the prefix
    public func hasPrefix(prefix: String) -> Bool {
        if prefix.characters.count == 0 {
            // if the prefix has a length of zero every string is prefixed by that
            return true
        }
        if self.characters.count < prefix.characters.count {
            // if self is shorter than the prefix
            return false
        }
        if prefix.characters.count == 1 {
            // single char prefix is simple
            return self.characters.first! == prefix.characters.first!
        }
        
        // quick check if first and last char match
        if self.characters.first! == prefix.characters.first! && self.characters[self.startIndex.advanced(by: prefix.characters.count - 1)] == prefix.characters.last! {
            // if prefix length == 2 instantly return true
            if prefix.characters.count == 2 {
                return true
            }

            // match, thorough check
            var selfIndex = self.startIndex.successor()
            var prefixIndex = prefix.startIndex.successor()

            // first and last already checked
            for _ in 1..<(prefix.characters.count - 1) {
                if self.characters[selfIndex] != prefix.characters[prefixIndex] {
                    return false
                }
                selfIndex = selfIndex.successor()
                prefixIndex = prefixIndex.successor()
            }
            return true
        }
        return false
    }
    
    /// Check if a string has a suffix
    ///
    /// - parameter suffix: the suffix to check for
    /// - returns: true if the suffix was an empty string or the string has the suffix
    public func hasSuffix(suffix: String) -> Bool {
        if suffix.characters.count == 0 {
            // if the suffix has a length of zero every string is suffixed by that
            return true
        }
        if self.characters.count < suffix.characters.count {
            // if self is shorter than the suffix
            return false
        }
        if suffix.characters.count == 1 {
            // single char prefix is simple
            return self.characters.last! == suffix.characters.first!
        }
        
        // quick check if first and last char match
        if self.characters.last! == suffix.characters.last! && self.characters[self.startIndex.advanced(by: self.characters.count - suffix.characters.count)] == suffix.characters.first! {
            // if suffix length == 2 instantly return true
            if suffix.characters.count == 2 {
                return true
            }
            
            // match, thorough check
            var selfIndex = self.startIndex.advanced(by: self.characters.count - suffix.characters.count + 1)
            var suffixIndex = suffix.startIndex.successor()
            
            // first and last already checked
            for _ in 1..<(suffix.characters.count - 1) {
                if self.characters[selfIndex] != suffix.characters[suffixIndex] {
                    return false
                }
                selfIndex = selfIndex.successor()
                suffixIndex = suffixIndex.successor()
            }
            return true
        }
        return false
    }
#endif
}
