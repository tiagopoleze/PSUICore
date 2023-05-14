//
//  ProgressViewAttribute.swift
//  
//
//  Created by Tiago Ferreira on 21/04/2023.
//

#if os(iOS)
import UIKit

public enum ProgressViewAttribute: Attribute {
    case trackTintColor(UIColor)
    case progressImage(UIImage)
    case trackImage(UIImage)
    case progressTintColor(UIColor)
    case view(ViewAttribute)

    public var value: any Attribute {
        switch self {
        case let .trackTintColor(value):
            return ProgressViewTrackTintColor(value: value)
        case let .progressImage(value):
            return ProgressViewProgressImage(value: value)
        case let .trackImage(value):
            return ProgressViewTrackImage(value: value)
        case let .progressTintColor(value):
            return ProgressViewProgressTintColor(value: value)
        case let .view(value):
            return value.value
        }
    }

    public func modify<V>(view: V) where V: UIView {
        value.modify(view: view)
    }
}

public struct ProgressViewTrackTintColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let progressView = view as? UIProgressView else { return }
        progressView.trackTintColor = value
    }
}

public struct ProgressViewTrackImage: Attribute {
    public var value: UIImage

    public init(value: UIImage) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let progressView = view as? UIProgressView else { return }
        progressView.trackImage = value
    }
}

public struct ProgressViewProgressTintColor: Attribute {
    public var value: UIColor

    public init(value: UIColor) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let progressView = view as? UIProgressView else { return }
        progressView.progressTintColor = value
    }
}

public struct ProgressViewProgressImage: Attribute {
    public var value: UIImage

    public init(value: UIImage) {
        self.value = value
    }

    public func modify<V>(view: V) where V: UIView {
        guard let progressView = view as? UIProgressView else { return }
        progressView.progressImage = value
    }
}
#endif
