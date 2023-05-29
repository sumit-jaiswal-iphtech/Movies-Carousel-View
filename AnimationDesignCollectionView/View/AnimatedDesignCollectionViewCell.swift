//
//  AnimatedDesignCollectionViewCell.swift
//  AnimationDesignCollectionView
//
//  Created by iPHTech 29 on 28/04/23.
//

import UIKit

class AnimatedDesignCollectionViewCell: UICollectionViewCell {

    static let identifier = "AnimatedDesignCollectionViewCell"
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieTitleNameLabel: UILabel!
    @IBOutlet weak var movieTypeLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var addShadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


