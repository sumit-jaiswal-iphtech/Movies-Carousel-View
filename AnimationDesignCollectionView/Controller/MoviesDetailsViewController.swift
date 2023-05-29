//
//  MoviesDetailsViewController.swift
//  AnimationDesignCollectionView
//
//  Created by iPHTech 29 on 28/04/23.
//

import UIKit

class MoviesDetailsViewController: UIViewController, UIScrollViewDelegate{
    
    //MARK: Define all IBOutlets
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var moviesImage: UIImageView!
    @IBOutlet weak var segmentControlOutlet: UISegmentedControl!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var crossButton: UIButton!
    @IBOutlet weak var uiView: UIView!
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var ratingValue: UILabel!
    @IBOutlet weak var imdbLbl: UILabel!
    
    //MARK: Define all Variables
    var moviesN = ""
    var titleN = ""
    var ratingN = ""
    var typeN = ""
    var durationtime = ""
    
    //MARK: Life Cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleName.text = titleN
        ratingValue.text = ratingN
        typeName.text = typeN
        duration.text = durationtime
        moviesImage.image = UIImage(named: moviesN)
        setUpButton()
        setUpSegmentedControl()
    }
    
    func setUpButton() {
        
        // set button corner Radius
        crossButton.layer.cornerRadius = crossButton.frame.width / 2
        playButton.layer.cornerRadius = playButton.frame.width / 2
        playButton.layer.borderWidth = 0.25
        playButton.layer.borderColor =  .init(gray: 200, alpha: 1)
        
        // set label conrner Radius
        imdbLbl.layer.borderWidth = 1
        imdbLbl.layer.cornerRadius = 4
        imdbLbl.layer.borderColor = UIColor.systemGray4.cgColor
        
        // Add shadow for view
        shadowView.addShadow()
        moviesImage.makeRoundedCorner()
    }
    
    // Add shadow in segmented Control
    func setUpSegmentedControl() {
        segmentControlOutlet.segmentedShadow()
        for i in 0..<segmentControlOutlet.numberOfSegments {
            if i == segmentControlOutlet.selectedSegmentIndex {
                segmentControlOutlet.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
            } else {
                segmentControlOutlet.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
            }
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}



