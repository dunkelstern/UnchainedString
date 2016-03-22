//
//  whitespace.swift
//  UnchainedString
//
//  Created by Johannes Schriewer on 22/12/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

public extension String {
    
    /// Trim whitespace at start and end of string
    ///
    /// - returns: trimmed string
    public func stringByTrimmingWhitespace() -> String {
        let isWhitespace:(Character -> Bool) = { c in
            switch c {
            case " ", "\n", "\r\n", "\t": // ASCII
                return true
            case "\u{2028}", "\u{2029}": // Unicode paragraph seperators
                return true
            case "\u{00a0}", "\u{1680}", "\u{2000}"..."\u{200a}", "\u{202f}", "\u{205f}", "\u{3000}": // various spaces
                return true
            default:
                return false
            }
        }
        
        var startIndex:String.CharacterView.Index = self.startIndex
        for (index, c) in self.characters.enumerated() {
            if !isWhitespace(c) {
                startIndex = self.startIndex.advanced(by: index)
                break
            }
        }
        
        var endIndex = self.endIndex.advanced(by: -1)
        for _ in 0..<self.characters.count {
            if !isWhitespace(self.characters[endIndex]) {
                break
            }
            endIndex = endIndex.advanced(by: -1)
        }
        
        return self.subString(startIndex...endIndex)
    }
}