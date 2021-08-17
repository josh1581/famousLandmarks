//
//  SettingsViewController.swift
//  famouseLandmark
//
//  Created by Joshua Hoyle on 4/22/21.
//

import UIKit


//MARK: = PROTOCOL
protocol SelectChoosingMethodDelegate: AnyObject {
    func choosingMethodWasSelected(choosingMethod: String)
}


class SettingsViewController: UIViewController {
    
    //MARK: - Properties
    weak var delegate: SelectChoosingMethodDelegate?
    var currentMethodOfChoosing: String?
    
    //MARK: - IBoutlets
    
    @IBOutlet weak var userChoiceSegmentedControl: UISegmentedControl!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegmententedControl()
    }
    
    func setSegmententedControl() {
        guard let currentMethodOfChoosing = currentMethodOfChoosing else {return}
        userChoiceSegmentedControl.selectedSegmentIndex = currentMethodOfChoosing == "name" ? 0 : 1
    }
    //MARK: - IB Actions
    
    
    @IBAction func userChoiceSegmentedControlDidChange(_ sender: UISegmentedControl) {
        delegate?.choosingMethodWasSelected(choosingMethod: sender.selectedSegmentIndex == 0 ? "name" : "country")
        self.dismiss(animated: true)
    }
}

