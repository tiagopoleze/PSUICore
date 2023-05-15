#if os(iOS)
import UIKit

public extension UICollectionView {
    convenience init(
        frame: CGRect,
        collectionViewLayout: UICollectionViewLayout,
        style: (any UIKitStyles.Style)? = nil,
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
