#if os(iOS)
import UIKit

/// Convenience initializers for UIButton with customizable title, image, style, attributes, and additional changes.
public extension UIButton {
    
    /// Initializes a UIButton with a title, image, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - title: The title of the button.
    ///   - image: The image of the button.
    ///   - style: The style to apply to the button.
    ///   - attributes: The attributes to apply to the button.
    ///   - additionalChanges: Additional changes to apply to the button.
    convenience init(
        title: String?,
        image: UIImage? = nil,
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UIButton) -> Void)? = nil
    ) {
        self.init()
        if let title { setTitle(title, for: .normal) }
        if let image { setImage(image, for: .normal) }
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }

    /// Initializes a UIButton with a title, image, style, attributes, and additional changes.
    ///
    /// - Parameters:
    ///   - title: The title of the button.
    ///   - image: The image of the button.
    ///   - style: The style to apply to the button.
    ///   - attributes: The attributes to apply to the button.
    ///   - additionalChanges: Additional changes to apply to the button.
    convenience init(
        title: String?,
        image: UIImage? = nil,
        style: (any Style)? = nil,
        attributes: [ButtonAttribute] = [],
        additionalChanges: ((UIButton) -> Void)? = nil
    ) {
        self.init(
            title: title,
            image: image,
            style: style,
            attributes: attributes.map(\.value),
            additionalChanges: additionalChanges
        )
    }

    /// Initializes a UIButton with a title, image, style, attributes, configuration, and additional changes.
    ///
    /// - Parameters:
    ///   - title: The title of the button.
    ///   - image: The image of the button.
    ///   - style: The style to apply to the button.
    ///   - attributes: The attributes to apply to the button.
    ///   - configuration: The configuration to apply to the button.
    ///   - additionalChanges: Additional changes to apply to the button.
    @available(iOS 15.0, *)
    convenience init(
        title: String? = nil,
        image: UIImage? = nil,
        style: (any Style)? = nil,
        attributes: [any Attribute] = [],
        configuration: UIButton.Configuration,
        additionalChanges: ((UIButton) -> Void)? = nil
    ) {
        self.init(configuration: configuration)
        self.init(
            title: title,
            image: image,
            style: style,
            attributes: attributes,
            additionalChanges: additionalChanges
        )
    }

    /// Initializes a UIButton with a title, image, style, attributes, configuration, and additional changes.
    ///
    /// - Parameters:
    ///   - title: The title of the button.
    ///   - image: The image of the button.
    ///   - style: The style to apply to the button.
    ///   - attributes: The attributes to apply to the button.
    ///   - configuration: The configuration to apply to the button.
    ///   - additionalChanges: Additional changes to apply to the button.
    @available(iOS 15.0, *)
    convenience init(
        title: String? = nil,
        image: UIImage? = nil,
        style: (any Style)? = nil,
        attributes: [ButtonAttribute] = [],
        configuration: UIButton.Configuration,
        additionalChanges: ((UIButton) -> Void)? = nil
    ) {
        self.init(
            title: title,
            image: image,
            style: style,
            attributes: attributes.map(\.value),
            configuration: configuration,
            additionalChanges: additionalChanges
        )
    }
}
#endif
