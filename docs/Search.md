# Search functions

## String contains `String`/`Character`

Two functions, returning `true` if the string contains a specified search term

## Simple positions

- position of `Character` in String
- position of `String` in String

Those two functions have two optional parameters:

- `index` start index where to start the search from
- `reverse` set to `true` to search backwards from `index` or the end of the string

## Array of positions

- array of `String.Index` objects for a `Character` in a String
- array of `String.Index` objects for a `String` in a String

## Prefix/Suffix comparison

Functions have been named `isPrefixed` and `isSuffixed` to avoid clash on OSX with the Foundation `hasPrefix` and `hasSuffix` functions.