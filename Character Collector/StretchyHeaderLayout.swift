//
//  StretchyHeaderLayout.swift
//  Character Collector
//
//  Created by nyato on 2017/10/2.
//  Copyright © 2017年 Razeware, LLC. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//
//        let layoutAttributes = super.layoutAttributesForElements(in: rect)!
//
//        let offset = collectionView!.contentOffset
//        if offset.y < 0 {
//            let deltaY = fabs(offset.y)
//            for attributes in layoutAttributes {
//                if let elementKind = attributes.representedElementKind, elementKind == UICollectionElementKindSectionHeader {
//                    var frame = attributes.frame
//                    frame.size.height = max(0, headerReferenceSize.height + deltaY)
//                    frame.origin.y = frame.minY - deltaY
//                    attributes.frame = frame
//                }
//
//            }
//        }
//        return layoutAttributes
//    }

    
    // add 20 height for navigation bar
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)!
        
        let inset = collectionView!.contentInset
        let offset = collectionView!.contentOffset
        let minY = -inset.top

        if offset.y < minY {
            let deltaY = fabs(offset.y - minY)
            for attributes in layoutAttributes {
                if let elementKind = attributes.representedElementKind, elementKind == UICollectionElementKindSectionHeader {
                    var frame = attributes.frame
                    frame.size.height = max(0, headerReferenceSize.height + deltaY)
                    frame.origin.y = frame.minY - deltaY
                    attributes.frame = frame
                }
                
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
