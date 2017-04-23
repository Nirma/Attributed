//
//  Attributes.swift
//  Attributed
//
//  Created by Nicholas Maccharoli on 2017/04/08.
//  Copyright © 2017年 Attributed. All rights reserved.
//

import Foundation

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

    public func font(_ font: UIFont) -> Attributes {
        return self + Attributes(dictionary: [NSFontAttributeName: font])
    }

    public func kerning(_ kerning: Double) -> Attributes {
        return self + Attributes(dictionary: [NSKernAttributeName: NSNumber(floatLiteral: kerning)])
    }

    public func strikeThroughStyle(_ strikeThroughStyle: NSUnderlineStyle) -> Attributes {
        return self + Attributes(dictionary: [NSStrikethroughStyleAttributeName: strikeThroughStyle.rawValue])
    }

    public func underlineStyle(_ underlineStyle: NSUnderlineStyle) -> Attributes {
        return self + Attributes(dictionary: [NSUnderlineStyleAttributeName: underlineStyle.rawValue])
    }

    public func strokeColor(_ strokeColor: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSStrokeColorAttributeName: strokeColor])
    }

    public func strokeWidth(_ strokewidth: Double) -> Attributes {
        return self + Attributes(dictionary: [NSStrokeWidthAttributeName: NSNumber(floatLiteral: strokewidth)])
    }

    public func foreground(color: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSForegroundColorAttributeName: color])
    }

    public func background(color: UIColor) -> Attributes {
        return self + Attributes(dictionary: [NSBackgroundColorAttributeName: color])
    }

    public func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> Attributes {
        return self + Attributes(dictionary: [NSParagraphStyleAttributeName: paragraphStyle])
    }

    public func shadow(_ shadow: NSShadow) -> Attributes {
        return self + Attributes(dictionary: [NSShadowAttributeName: shadow])
    }

    public func obliqueness(_ value: CGFloat) -> Attributes {
        return self + Attributes(dictionary: [NSObliquenessAttributeName: value])
    }

    public func link(_ link: String) -> Attributes {
        return self + Attributes(dictionary: [NSLinkAttributeName: link])
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
