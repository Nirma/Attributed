# Attributed
[![Build Status](https://travis-ci.org/Nirma/Attributed.svg?branch=master)](https://travis-ci.org/Nirma/Attributed)
![CodeCov](https://img.shields.io/codecov/c/github/Nirma/Attributed.svg)
![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/AttributedLib.svg)](#cocoapods)
[![CocoaPods](https://img.shields.io/cocoapods/dt/AttributedLib.svg)]()
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

µframework for Attributed strings.

## What is Attributed?
Attributed aims to be a drop in replacement to the current programming interface of `NSAttributedString`.
The existing interface to using attributed strings has a few flaws, namely if you dont know the Key and type of value 
needed to set a certain attribute, you have spend time checking documentation or the reading the comments for `NSAttributedString`.
Another concern is safety, passing a dictionary of type `[String: Any]` to the constructor of `NSAttributedString` is a potential crash at runtime waiting to happen.

By wrapping the current official interface to `NSAttributedString` into a fluent easy to use API, Attributed was made
in an attempt to give developers an alternative option to the official interface.

# Features
- [x] Create `NSAttributedString` instances with a simple and fluid interface
- [x] Combine `NSAttributedString`s with `+`
- [x] Partially apply Attributes to parts of an `NSAttributedString` by providing a `Range`

### Dont see a feature you need?
Feel free to open an Issue requesting the feature you want or send over a pull request!

# Usage  

### Creating a new `NSAttributedString` by closure composition

```swift

"This is not a string".at.attributed {
  return $0.foreground(color: .red)
           .font(UIFont(name: "Chalkduster", size: 24.0)!)
           .underlineStyle(.styleSingle)
}
```

### Creating a new `NSAttributedString` by passing an attributes object

First create an `Attributes` object:

```swift
let attributes = Attributes {
    return $0.foreground(color: .red)
             .font(UIFont(name: "Chalkduster", size: 24.0)!)
             .underlineStyle(.styleSingle)
}
```

then simply apply the `Attributes` to a `String`:

```swift
"Hello".at.attributed(with: attributes)
```

### Combining `NSAttributedString` with `+`
This library defines a `+` operator for concatentating instances of `NSAttributedString`.
`+` works with `NSAttributedString` no different than it does for `String`.
This can be useful for combining `NSAttributedStrings` with different attributes to produce the 
desired effect without having to specify ranges to apply different attributes to.

```swift
let bodyAttributes = Attributes { 
    return $0.foreground(color: .purple)
             .font(UIFont(name: "Noteworthy-Light", size: 20.0)!)
}

let authorAttributes = bodyAttributes.foreground(color: .black)

"I think theres something strangely musical about noise.".at.attributed(with: bodyAttributes)
+ "\n  - Trent Reznor".at.attributed(with: authorAttributes)
```

## Installation

#### Carthage

If you use Carthage to manage your dependencies, simply add
Attributed to your `Cartfile`:

```
github "Nirma/Attributed"
```

If you use Carthage to build your dependencies, make sure you have added `Attributed.framework` to the "_Linked Frameworks and Libraries_" section of your target, and have included `Attributed.framework` in your Carthage framework copying build phase.

#### CocoaPods

If you use CocoaPods to manage your dependencies, simply add
Attributed to your `Podfile`:

```ruby
pod 'AttributedLib'
```

## Requirements

* Xcode 8.0
* Swift 3.0+

## Contribution
Contributions are more than welcome!

## License

Attributed is free software, and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: /LICENSE
