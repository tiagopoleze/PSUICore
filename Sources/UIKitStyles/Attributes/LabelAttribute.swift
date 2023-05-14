//
//  LabelAttribute.swift
//  
//
//  Created by Tiago Ferreira on 21/04/2023.
//

#if os(iOS)
import UIKit

public enum LabelAttribute: Attribute {
    case accessibility(String)
    case attributedText(NSAttributedString)
    case font(UIFont)
    case lineBreakMode(NSLineBreakMode)
    case lineBreakStrategy(NSParagraphStyle.LineBreakStrategy)
    case numberOfLines(Int)
    case textAlignment(NSTextAlignment)
    case textColor(UIColor)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case let .accessibility(value):
            return LabelAccessibility(value: value)
        case let .attributedText(value):
            return LabelAttributedText(value: value)
        case let .font(value):
            return LabelFont(value: value)
        case let .lineBreakMode(value):
            return LabelLineBreakMode(value: value)
        case let .numberOfLines(value):
            return LabelNumberOfLines(value: value)
        case let .textAlignment(value):
            return LabelTextAlignment(value: value)
        case let .textColor(value):
            return LabelTextColor(value: value)
        case let .view(value):
            return value.value
        default:
            if #available(iOS 14.0, *), case let .lineBreakStrategy(value) = self {
                return LabelLineBreakStrategy(value: value)
            }
            return EmptyAttribute()
        }
    }

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct LabelAccessibility: Attribute {
    public let value: String?

    public init(value: String? = nil) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        if let value { label.accessibilityIdentifier = value }
    }
}

public struct LabelTextColor: Attribute {
    public let value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.textColor = value
    }
}

public struct LabelTextAlignment: Attribute {
    public let value: NSTextAlignment

    public init(value: NSTextAlignment) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.textAlignment = value
    }
}

public struct LabelNumberOfLines: Attribute {
    public let value: Int

    public init(value: Int) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.numberOfLines = value
    }
}

@available(iOS 14.0, *)
public struct LabelLineBreakStrategy: Attribute {
    public var value: NSParagraphStyle.LineBreakStrategy

    public init(value: NSParagraphStyle.LineBreakStrategy) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.lineBreakStrategy = value
    }
}

public struct LabelLineBreakMode: Attribute {
    public var value: NSLineBreakMode

    public init(value: NSLineBreakMode) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.lineBreakMode = value
    }
}

public struct LabelFont: Attribute {
    public let value: UIFont

    public init(value: UIFont) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.font = value
    }
}

public struct LabelAttributedText: Attribute {
    public var value: NSAttributedString

    public init(value: NSAttributedString) { self.value = value }

    public func modify<V>(view: V) where V: UIView {
        guard let label = view as? UILabel else { return }
        label.attributedText = value
    }
}
#endif
