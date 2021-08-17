//
//  famousLandmark.swift
//  famouseLandmark
//
//  Created by Joshua Hoyle on 4/22/21.
//

import UIKit


class Landmark {
    
    //MARK: - Properties
    let uuid: String
    let landmarkName: String
    let landmarkLocation: String
    let landmarkImage: UIImage?
    
    //MARK: - Initializer
    
    init(uuid: String = UUID().uuidString, landmarkName: String, landmarkLocation: String, landmarkImage: UIImage?) {
    self.uuid = uuid
    self.landmarkName = landmarkName
    self.landmarkLocation = landmarkLocation
    self.landmarkImage = landmarkImage
    }
}//End of Class

//MARK: - Extension
extension Landmark: Equatable {
    static func == (lhs: Landmark, rhs: Landmark) -> Bool {
        lhs.uuid == rhs.uuid
    }
}//End of extension
