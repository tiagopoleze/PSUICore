#if os(iOS)
import UIKit

/// Convenience initializers for `UICollectionView` with customizable styles and attributes.
public extension UICollectionView {
    /// Initializes a `UICollectionView` with the specified frame, collection view layout, style, attributes, and additional changes.
    /// - Parameters:
    /// - frame: The frame rectangle for the collection view, measured in points.
    /// - collectionViewLayout: The layout object to use for organizing items.
    /// - style: The custom style to apply to the collection view.
    /// - attributes: An array of attributes to modify the collection view.
    /// - additionalChanges: Additional changes to apply to the collection view.
    convenience init(
        frame: CGRect,
        collectionViewLayout: UICollectionViewLayout,
        style: (any PSUICore.Style)? = nil,
        attributes: [any Attribute] = [],
        additionalChanges: ((UICollectionView) -> Void)? = nil
    ) {
        self.init(frame: frame, collectionViewLayout: collectionViewLayout)
        style?.modify(view: self)
        for attribute in attributes {
            attribute.modify(view: self)
        }
        additionalChanges?(self)
    }
}
#endif
