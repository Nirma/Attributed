//
//  Attributed.swift
//  Attributed
//
//  Created by Nicholas Maccharoli on 2017/04/17.
//  Copyright © 2017年 Attributed. All rights reserved.
//

import Foundation
import UIKit


/**
 Features that exist in Attributed are written as extensions to this class `Attributed`.
 */

public final class Attributed<Base> {
    let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}


/**
 Types that have Attributed extensions extend `AttributedCompatible`.
 */

public protocol AttributedCompatible {
    associatedtype CompatibleType

    var at: CompatibleType { get }
}

public extension AttributedCompatible {
    public var at: Attributed<Self> {
        return Attributed(self)
    }
}


/**
 Types that wish to implement Attributed extensions should adapt `AttributedCompatible` first 
 and then write extensions in the format of: 
    
    `extension Attributed where Base == SomeType { ... }`
 
 The merit of adapting the `AttributedCompatible` protocol
 is that methods defined in this mannor are grouped under their own `at` namespace, therefore the chance 
 of naming collisions is lower and when reading through code that uses the attributed library it is clear 
 what is an extension that Attributed provides and what is not.
 */

extension String: AttributedCompatible { }
extension NSString: AttributedCompatible { }
extension NSAttributedString: AttributedCompatible { }
