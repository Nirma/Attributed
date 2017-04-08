//
//  NSString+Attributed.swift
//  Attributed
//
//  Created by Nicholas Maccharoli on 2017/04/08.
//  Copyright © 2017年 Attributed. All rights reserved.
//

import Foundation

extension NSString {

    public func attributed(with attributes: Attributes) -> NSAttributedString {
        return (self as String).attributed(with: attributes)
    }

    public func attributed(_ attributeBlock: (Attributes) -> (Attributes)) -> NSAttributedString {
        return (self as String).attributed(attributeBlock)
    }

}
