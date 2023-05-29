//
//  Extension.swift
//  AnimationDesignCollectionView
//
//  Created by iPHTech 29 on 05/05/23.
//

import Foundation
import UIKit

extension UIView {
    
    func makeRoundedCorner() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
    func addShadowOnBottom(shadowColor: UIColor = .orange,shadowOffset: CGSize = CGSize(width: 0 , height: 0),shadowOpacity: Float = 1.0,shadowRadius: CGFloat = 10.0,cornerRadius: CGFloat = 20) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,y: bounds.maxY - layer.shadowRadius,width: bounds.width - 20,height: layer.shadowRadius)).cgPath
    }
    func addShadow(shadowColor: UIColor = .orange,shadowOffset: CGSize = .zero,shadowOpacity: Float = 8.0,shadowRadius: CGFloat = 8,cornerRadius: CGFloat = 20) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath
    }
    
    func segmentedShadow(shadowColor: UIColor = .systemGray4,backgroundColor: UIColor = .white,shadowOffset: CGSize = CGSize(width: 3,height: 3),shadowOpacity: Float = 0.5,shadowRadius: CGFloat = 5,masksToBounds: Bool = false) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = masksToBounds
        layer.backgroundColor = backgroundColor.cgColor
    }
}

//MARK: Find for visible index
extension UICollectionView {
  var visibleCurrentCellIndexPath: IndexPath? {
    for cell in self.visibleCells {
      let indexPath = self.indexPath(for: cell)
      return indexPath
    }
    return nil
  }
}
