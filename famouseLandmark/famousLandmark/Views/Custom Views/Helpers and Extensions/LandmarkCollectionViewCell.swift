//
//  LandmarkCollectionViewCell.swift
//  famouseLandmark
//
//  Created by Joshua Hoyle on 4/22/21.
//

import UIKit

class LandmarkCollectionViewCell: UICollectionViewCell {
    ///MARK:  - Outlets
    
    @IBOutlet weak var landMarkImageView: UIImageView!
    
    //MARK: - Properties
    
    var landmark: Landmark? {
        didSet{
           updateViews()
        }
    }
    
    //MARK: - Helper Methods
    
    func updateViews() {
        guard let landmark = landmark else {return}
        landMarkImageView.contentMode = .scaleAspectFill
        landMarkImageView.image = landmark.landmarkImage
    }
    
}
