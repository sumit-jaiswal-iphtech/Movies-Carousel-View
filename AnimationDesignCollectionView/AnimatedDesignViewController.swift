//
//  ViewController.swift
//  AnimationDesignCollectionView
//
//  Created by iPHTech 29 on 28/04/23.
//

import UIKit

class AnimatedDesignViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var animatedCollectionView: UICollectionView!

    var moviesListArray = [Movies]()
    var firstIter = true
    let swipeUp = UISwipeGestureRecognizer()
    let swipeDown = UISwipeGestureRecognizer()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedCollectionView.delegate = self
        animatedCollectionView.dataSource = self
        moviesListArray = Movies.defaultMoviesList()
        animatedCollectionView.addGestureRecognizer(createSwipeGestureRecognizer(for: .up))
        animatedCollectionView.addGestureRecognizer(createSwipeGestureRecognizer(for: .down))
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
        searchBar.layer.cornerRadius = 11
        searchBar.clipsToBounds = true
    }

    private func createSwipeGestureRecognizer(for direction: UISwipeGestureRecognizer.Direction) -> UISwipeGestureRecognizer {
        // Initialize Swipe Gesture Recognizer
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))

        // Configure Swipe Gesture Recognizer
        swipeGestureRecognizer.direction = direction

        return swipeGestureRecognizer
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
            switch sender.direction {
            case .up,.down:
                var visibleRect    = CGRect()
                   visibleRect.origin = animatedCollectionView.contentOffset
                   visibleRect.size   = animatedCollectionView.bounds.size
                   let visiblePoint   = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
                guard let visibleIndexPath: IndexPath = animatedCollectionView.indexPathForItem(at: visiblePoint) else { return }
                let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: controllerIdentifier) as! MoviesDetailsViewController
                vc.titleN = moviesListArray[visibleIndexPath.row].movieName
                vc.ratingN = moviesListArray[visibleIndexPath.row].rating
                vc.typeN = moviesListArray[visibleIndexPath.row].moviesType
               vc.durationtime = moviesListArray[visibleIndexPath.row].duration
                vc.moviesN = "\(moviesListArray[visibleIndexPath.row].moviesImage)"
                self.navigationController?.pushViewController(vc, animated: false)
            default:
                break
        }
    }
}

extension AnimatedDesignViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return moviesListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimatedDesignCollectionViewCell.identifier, for: indexPath as IndexPath) as! AnimatedDesignCollectionViewCell
        cell.addShadowView.addShadowOnBottom()
        cell.movieImageView.makeRoundedCorner()
        cell.imdbLabel.layer.borderWidth = 1
        cell.imdbLabel.layer.cornerRadius = 4
        cell.imdbLabel.layer.borderColor = UIColor.systemGray4.cgColor
        cell.movieTitleNameLabel.text = moviesListArray[indexPath.row].movieName
        cell.movieRatingLabel.text = moviesListArray[indexPath.row].rating
        cell.movieTypeLabel.text = moviesListArray[indexPath.row].moviesType
        cell.movieImageView.image = UIImage(named: "\(moviesListArray[indexPath.row].moviesImage)")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.size.width
        if indexPath.row == 1 && firstIter{
            firstIter = false
            return CGSize(width: width/2 + 100, height: width + 150)
        }
            return CGSize(width: width/2 + 120, height: width + 250)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: controllerIdentifier) as! MoviesDetailsViewController
        vc.titleN = moviesListArray[indexPath.row].movieName
        vc.ratingN = moviesListArray[indexPath.row].rating
        vc.typeN = moviesListArray[indexPath.row].moviesType
        vc.durationtime = moviesListArray[indexPath.row].duration
        vc.moviesN = "\(moviesListArray[indexPath.row].moviesImage)"
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let centerX = scrollView.contentOffset.x + scrollView.frame.size.width/2
        print(centerX)
        for cell in animatedCollectionView.visibleCells {
            if cell.frame.size.height == 543 {
                cell.frame.size.height +=  100
                cell.frame.origin.y = cell.frame.origin.y - 50
            }
            var offsetX = centerX - cell.center.x
            print(offsetX)
            if offsetX < 0 {
                offsetX *= -1
            }
            cell.transform = CGAffineTransform(scaleX: 1.2, y: 1)
            if offsetX > 100 {
                let offsetPercentage = (offsetX - 100) / view.bounds.width
                var scaleX = 1-offsetPercentage
                if scaleX < 0.8 {
                    scaleX = 0.8
                }
                cell.transform = CGAffineTransform(scaleX: scaleX , y: scaleX )
            }
        }
    }
}
