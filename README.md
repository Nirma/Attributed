# Attributed
[![Build Status](https://travis-ci.org/Nirma/Attributed.svg?branch=master)](https://travis-ci.org/Nirma/Attributed)
![Swift 3.0.1](https://img.shields.io/badge/Swift-3.0.1-orange.svg)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/Attributed.svg)](#cocoapods)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

A Modern interface for attributed strings.

## Usage 

This library aims to be a drop in replacement to the current programming interface of `NSAttributedString`.
The existing interface to using attributed strings has a few flaws, namely if you dont know the Key and type of value 
needed to set a certain attribute, you have spend time checking documentation or the reading the comments for `NSAttributedString`.
Another concern is safety, passing a dictionary of type `[String: Any]` to the constructor of `NSAttributedString` is a potential crash at runtime waiting to happen. 

Say for example one wished to create a attributed string with text colored red, a font of `Chalkduster` and to have the string underlined.

Given the existing API that would look something like this:

```swift
let attributes: [String: Any] = [
    NSForegroundColorAttributeName: UIColor.red,
    NSFontAttributeName: UIFont(name: "Chalkduster", size: 24.0)!,
    NSUnderlineStyleAttributeName: 1,
]

let text = NSAttributedString(string: "Hello", attributes: attributes)
```
To produce the exact same string using this library one could write the following:

```swift
let attributes = Attributes {
    return $0.foreground(color: .red)
             .font(UIFont(name: "Chalkduster", size: 24.0)!)
             .underlineStyle(.styleSingle)
}

"Hello".attributed(with: attributes)
```

### Attributes
The `[String: Any]` attributes dictionary that was passed to the NSAttributedString constructor as in `NSAttributedString(string: "Hello", attributes: attributes)` has been made an actual type `Attributes`.

There are two intefaces for working with the `Attributes` type.
The suggested interface is the Constructor interface that accepts a closure that returns an `Attributes` object.

```swift
let attributes = Attributes {
    return $0.foreground(color: .red)
             .font(UIFont(name: "Chalkduster", size: 24.0)!)
             .underlineStyle(.styleSingle)
}
```

The second way of working with `Attribute` objects is to set properties one method call at a time.
The benefit of this interface is a base set of attributes can be created and then that base set of attributes can then
be freely modified. 
Since `Attributes` is of type `struct` there is zero chance of corrupting the  original base `Attributes` object by working this way. 

```swift
let baseAttributes = Attributes().font(UIFont(name: "Chalkduster", size: 24.0)!)
 
let accentedAttributes = baseAttribues.foreground(color: .red) 
                                      .underlineStyle(.styleSingle)
```


### Extensions to `String`

Two extensions have been made to the type `String`.
The first is: `attributed(with: attributes)` where `attributes` is an object of type `Attributes`.
This function will return an `NSAttributedString` from an object of type `String`.

```swift
"Hello".attributed(with: attributes)
```

The second interface is similar but takes closure given a blank `Attributes` that the user can modify and return 
to be used in constructing an `NSAttributedString`.

```swift
let nameLabel.attributedText = "Steve".attributed {
                                      return $0.font(UIFont(name: "Chalkduster", size: 24.0)!)
                                               .foreground(color: .red)
                                               .underlineStyle(.styleSingle)
                               }
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

```
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
