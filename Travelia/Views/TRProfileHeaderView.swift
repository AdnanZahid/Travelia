//
//  TRProfileHeaderView.swift
//  Travelia
//
//  Created by Adnan Zahid on 3/1/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit
import HMSegmentedControl

protocol TRProfileHeaderViewDelegate: class {
    
    func editProfileAPI()
}

class TRProfileHeaderView: UIView {
    
    weak var delegate: TRProfileHeaderViewDelegate?
    
    @IBOutlet weak var segmentedControl: HMSegmentedControl!
    
    @IBOutlet weak var fullNameField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    var isEditingModeOn: Bool = false
    
    @IBAction func editButtonTapped(_ sender: AnyObject) {
        
        if isEditingModeOn == true {
            
            isEditingModeOn = false
            
            editButton.setTitle("Edit", for: UIControlState.normal)
            
            fullNameField.isUserInteractionEnabled = false
            descriptionField.isUserInteractionEnabled = false
            
            /**
             * Call edit profile API
             */
            delegate?.editProfileAPI()
            
        } else {
            
            isEditingModeOn = true
            
            editButton.setTitle("Done", for: UIControlState.normal)
            
            fullNameField.isUserInteractionEnabled = true
            descriptionField.isUserInteractionEnabled = true
        }
    }
    
    /**
     * Segmented control setup
     */
    func setupSegmentedControl(postsCount: Int, wishlistCount: Int, followersCount: Int) {
        
        let attr = [ NSFontAttributeName : SNACKBAR_FONT_BOLD, NSKernAttributeName : KERNING_FONT, NSForegroundColorAttributeName : UIColor.black ] as [String : Any]
        
        /**
         * UI setup for segmented control
         */
        segmentedControl.backgroundColor = LIGHT_SECONDARY_COLOR
        segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocation.down
        segmentedControl.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        
        segmentedControl.titleTextAttributes = attr
        segmentedControl.selectedTitleTextAttributes = attr
        
        segmentedControl.selectionIndicatorColor = UIColor.clear
        segmentedControl.selectionIndicatorHeight = 2.0
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.sectionTitles = ["POSTS\n\n\(postsCount)", "WISHLIST\n\n0", "FOLLOWERS\n\n\(followersCount)"]
    }
}
