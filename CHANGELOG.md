# Change Log

All notable changes to this project will be documented in this file.
`Attributed` adheres to [Semantic Versioning](http://semver.org/).

--- 
## [1.3.0](https://github.com/Nirma/Attributed/releases/tag/1.3.0) (07/20/2017)

#### Summary

This is a purely additive release.

This release adds functionality for supporting the use of `NSBaseLineAttributeName` through this library's interface.
Just call `.baseOffset()` with an `NSNumber` value specifying the offset you wish to use. 


## [1.2.0](https://github.com/Nirma/Attributed/releases/tag/1.2.0) (06/16/2017)

#### Summary

This is a purely additive release.

The new functionality is the addition of the function `uniformLineHeight`:
```swift
func uniformLineHeight(_ uniformLineHeight: CGFloat) -> Attributes { ... }
```

This function is to be used when an attributed string has the same value for both `minimumLineHeight` and `maximumLineHeight`
allowing this to be specified in one line rather than two. 


