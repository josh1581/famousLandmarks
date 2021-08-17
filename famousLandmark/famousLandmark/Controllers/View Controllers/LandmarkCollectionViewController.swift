//
//  LandmarkCollectionViewController.swift
//  famouseLandmark
//
//  Created by Joshua Hoyle on 4/22/21.
//

import UIKit

class LandmarkCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    var targetLandmark: Landmark?
    var selectedMethodOfChoosing = "name"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LandmarkController.landmarks.shuffle()
        updateview()
    }
    
    //MARK: - Helper Functions
   
    func updateview() {
        
        targetLandmark = LandmarkController.landmarks.randomElement()
        guard let landmark = targetLandmark else {return}
        self.title = selectedMethodOfChoosing == "name" ? "Pick \(landmark.landmarkName)" : "Pick \(landmark.landmarkLocation)"
        LandmarkController.landmarks.shuffle()
        collectionView.reloadData()
        
    }
    
    func showAlert(landMark: Landmark) {
        let correctChoice = landMark == targetLandmark
        let alert = UIAlertController(title: correctChoice ? "Great Job!" : "Nope", message: correctChoice ? "Wannna play again?" : "Not even close...try again.", preferredStyle: .alert)
        let playAgainAction = UIAlertAction(title: "Play again", style: .default) { _ in
            self.updateview()
            
        }
        let doneAction = UIAlertAction(title: correctChoice ? "Nah, I'm done." : "Try again", style: .cancel)
        alert.addAction(doneAction)
        if correctChoice {
            alert.addAction(playAgainAction)
        }
        present(alert, animated: true)
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSettingsVC" {
            guard let destination = segue.destination as? SettingsViewController else {return}
            destination.currentMethodOfChoosing = selectedMethodOfChoosing
            destination.delegate = self
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return LandmarkController.landmarks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "landmarkCell", for: indexPath) as? LandmarkCollectionViewCell else {return UICollectionViewCell()}
        let landmark = LandmarkController.landmarks[indexPath.row]
        cell.landmark = landmark
         
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        showAlert(landMark: LandmarkController.landmarks[indexPath.row])
    }
    
    
    
    
    
}//End of Class

extension LandmarkCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 20, height: width + 20)
    }
}

extension LandmarkCollectionViewController: SelectChoosingMethodDelegate {
    func choosingMethodWasSelected(choosingMethod: String) {
        selectedMethodOfChoosing = choosingMethod
        updateview()
    }
    
    
    
}
