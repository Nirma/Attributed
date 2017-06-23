# Attributed
[![Build Status](https://travis-ci.org/Nirma/Attributed.svg?branch=master)](https://travis-ci.org/Nirma/Attributed)
![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg)
![Swift 3.1.1](https://img.shields.io/badge/Swift-3.1.1-orange.svg)
[![CocoaPods compatible](https://img.shields.io/cocoapods/v/AttributedLib.svg)](#cocoapods)
[![CocoaPods](https://img.shields.io/cocoapods/dt/AttributedLib.svg)]()
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

Modern Swift µframework for attributed strings.

## About this Library
This library aims to be a drop in replacement to the current programming interface of `NSAttributedString`.
The existing interface to using attributed strings has a few flaws, namely if you dont know the Key and type of value 
needed to set a certain attribute, you have spend time checking documentation or the reading the comments for `NSAttributedString`.
Another concern is safety, passing a dictionary of type `[String: Any]` to the constructor of `NSAttributedString` is a potential crash at runtime waiting to happen.

By wrapping the current official interface to `NSAttributedString` into a fluent easy to use API, Attributed was made
in an attempt to give developers an alternative option to the official interface. 

## Usage  

Using Attributed is fairly straight forward, just create the attributes you wish your attributed text to have:

```swift
let attributes = Attributes {
    return $0.foreground(color: .red)
             .font(UIFont(name: "Chalkduster", size: 24.0)!)
             .underlineStyle(.styleSingle)
}
```

And then simply apply them to a `String`:

```swift
"Hello".at.attributed(with: attributes)
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
 
let accentedAttributes = baseAttributes.foreground(color: .red) 
                                      .underlineStyle(.styleSingle)
```


### Extensions to `String`

Two extensions have been made to the type `String`.
The first is: `attributed(with: attributes)` where `attributes` is an object of type `Attributes`.
This function will return an `NSAttributedString` from an object of type `String`.

```swift
"Hello".at.attributed(with: attributes)
```

The second interface is similar but takes closure given a blank `Attributes` that the user can modify and return 
to be used in constructing an `NSAttributedString`.

```swift
let attributedText = "Steve".at.attributed {
                            return $0.font(UIFont(name: "Chalkduster", size: 24.0)!)
                                     .foreground(color: .red)
                                     .underlineStyle(.styleSingle)
                     }
```

## Swift 4
Swift 4 support is currently provided by the branch `swift_4` and will be merged into master as soon as Swift 4 is released.
If you need Swift 4 support please point to the `swift_4` branch.

The pull request tracking Swift 4 progress can be found here: [Swift 4 support](https://github.com/Nirma/Attributed/pull/34)


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
