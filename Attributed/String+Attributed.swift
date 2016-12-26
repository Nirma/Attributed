//
//  String+Attributed.swift
//  Attributed
//
//  Created by Nicholas Maccharoli on 2016/12/08.
//  Copyright © 2016年 Attributed. All rights reserved.
//

import Foundation
import UIKit

public struct Attributes {
    
    let dictionary: [String: Any]
    
    public init() {
        dictionary = [:]
    }
    
    public init(_ attributesBlock: (Attributes) -> Attributes) {
        self = attributesBlock(Attributes())
    }
    
    internal init(dictionary: [String: Any]) {
        self.dictionary = dictionary
    }
    
    func font(_ font: UIFont) -> Attributes {
        return self + Attributes(dictionary: [NSFontAttributeName: font])
    }
    
    func kerning(_ kerning: Double) -> Attributes {
        return self + Attributes(dictionary: [NSKernAttributeName: NSNumber(floatLiteral: kerning)])
    }
    
    func strikeThroughStyle(_ strikeThroughStyle: NSUnderlineStyle) -> Attributes {
        return self + Attributes(dictionary: [NSStrikethroughStyleAttributeName: strikeThroughStyle.rawValue])
    }
    
    func underlineStyle(_ underlineStyle: NSUnderlineStyle) -> Attributes {
        return self + Attributes(dictionary: [NSUnderlineStyleAttributeName: underlineStyle.rawValue])
    }
    
    func strokeColor(_ strokeColor: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSStrokeColorAttributeName: strokeColor])
    }
    
    func strokeWidth(_ strokewidth: Double) -> Attributes {
        return self + Attributes(dictionary: [NSStrokeWidthAttributeName: NSNumber(floatLiteral: strokewidth)])
    }
    
    func foreground(color: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSForegroundColorAttributeName: color])
    }
    
    func background(color: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSForegroundColorAttributeName: color])
    }
    
    func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> Attributes {
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
}


// MARK: NSParagraphStyle related

extension Attributes {
    
    public func lineSpacing(_ lineSpacing: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.lineSpacing = lineSpacing
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func paragraphSpacing(_ paragraphSpacing: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.paragraphSpacing =  paragraphSpacing
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func alignment(_ alignment: NSTextAlignment) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.alignment = alignment
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func firstLineHeadIndent(_ firstLineHeadIndent: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.firstLineHeadIndent = firstLineHeadIndent
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func headIndent(_ headIndent: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.headIndent = headIndent
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func tailIndent(_ tailIndent: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.tailIndent = tailIndent
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = lineBreakMode
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func minimumLineHeight(_ minimumLineHeight: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.minimumLineHeight = minimumLineHeight
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func maximumLineHeight(_ maximumLineHeight: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.maximumLineHeight = maximumLineHeight
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func baseWritingDirection(_ baseWritingDirection: NSWritingDirection) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.baseWritingDirection = baseWritingDirection
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func lineHeightMultiple(_ lineHeightMultiple: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func paragraphSpacingBefore(_ paragraphSpacingBefore: CGFloat) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
    
    public func hyphenationFactor(_ hyphenationFactor: Float) -> Attributes {
        let paragraphStyle = (dictionary[NSParagraphStyleAttributeName] ?? NSMutableParagraphStyle.default.mutableCopy()) as! NSMutableParagraphStyle
        paragraphStyle.hyphenationFactor = hyphenationFactor
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }
}


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
