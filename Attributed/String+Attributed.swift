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

extension String {

    public func attributed(with attributes: Attributes) -> NSAttributedString {
        let attributes = attributes.dictionary
        return NSAttributedString(string: self, attributes: attributes)
    }

    public func attributed(_ attributeBlock: (Attributes) -> (Attributes)) -> NSAttributedString {
        let attributes = attributeBlock(Attributes())
        return attributed(with: attributes)
    }
}

extension NSAttributedString {

    public func modified(with attributes: Attributes, for range: NSRange) -> NSAttributedString {
        let result = NSMutableAttributedString(attributedString: self)
        result.add(attributes, to: range)
        return NSAttributedString(attributedString: result)
    }

}

extension NSMutableAttributedString {

    public func add(_ attributes: Attributes, to range: NSRange) {
        self.addAttributes(attributes.dictionary, range: range)
    }

}
