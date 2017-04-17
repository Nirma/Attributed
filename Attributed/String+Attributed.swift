//
//  String+Attributed.swift
//  Attributed
//
//  Created by Nicholas Maccharoli on 2016/12/08.
//  Copyright © 2016年 Attributed. All rights reserved.
//

import Foundation
import UIKit

// MARK: Primary Extension

extension Attributed where Base == String {

    public func attributed(with attributes: Attributes) -> NSAttributedString {
        let attributes = attributes.dictionary
        return NSAttributedString(string: base, attributes: attributes)
    }

    public func attributed(_ attributeBlock: (Attributes) -> (Attributes)) -> NSAttributedString {
        let attributes = attributeBlock(Attributes())
        return attributed(with: attributes)
    }
}

public extension Attributed where Base == NSMutableAttributedString {

    public func add(_ attributes: Attributes, to range: NSRange) {
        base.addAttributes(attributes.dictionary, range: range)
    }

}

public extension Attributed where Base == NSAttributedString {

    public func modified(with attributes: Attributes, for range: NSRange) -> NSAttributedString {
        let string = base as NSAttributedString

        let result = NSMutableAttributedString(attributedString: string)
        result.at.add(attributes, to: range)
        return NSAttributedString(attributedString: result)
    }
}
