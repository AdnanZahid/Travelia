//
//  TRProfileViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/7/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit
import HMSegmentedControl
import SwiftyJSON

class TRProfileViewController: LoaderViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var segmentedControl: HMSegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    var travellingPostsArray: [TRTravellingPost] = []
    
    override func getService() -> Service {
        
        return TRUserService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func populateData(value: JSON) {
        
        setupTableView()
        
        fullNameLabel.text = value["profileName"].string
        descriptionLabel.text = value["desc"].string
        
        travellingPostsArray = TRTravellingPost.getTravellingPosts(value: value["travelingPostDtoList"])
        
        setupSegmentedControl(postsCount: value["totalNumberOfPost"].int!, wishlistCount: 0, followersCount: value["numberOfFollowers"].int!)
            
        tableView.reloadData()
    }
    
    override func callAPI() {
        
        let userService = service as! TRUserService
        
        userService.otherProfileAPI(id: TRUser.sharedInstance.id!, success: {
            
            
            }, failure: {
                
            
        })
    }
    
    /**
     * Table view setup
     */
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: String(describing: TRTravelCardCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: TRTravelCardCell.self))
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return travellingPostsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return travellingPostCardHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TRTravelCardCell = tableView .dequeueReusableCell(withIdentifier: String(describing: TRTravelCardCell.self)) as! TRTravelCardCell
        
        cell.setupCell(travellingPost: travellingPostsArray[indexPath.row])
        
        return cell
    }
}
