//
//  TRProfileViewController.swift
//  Travelia
//
//  Created by Adnan Zahid on 2/7/17.
//  Copyright © 2017 Adnan Zahid. All rights reserved.
//

import UIKit
import SwiftyJSON

class TRProfileViewController: LoaderViewController, TRProfileHeaderViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var headerView: TRProfileHeaderView?
    
    var travellingPostsArray: [TRTravellingPost] = []
    
    override func getService() -> Service {
        
        return TRProfileService()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func populateData(value: JSON) {
        
        setupTableView()
        
        headerView?.fullNameField.text = value["profileName"].string
        headerView?.descriptionField.text = value["desc"].string
        
        travellingPostsArray = TRTravellingPost.getTravellingPosts(value: value["travelingPostDtoList"])
        
        let totalNumberOfPost: Int = extractValue(value: value, key: "totalNumberOfPost")
        
        let numberOfFollowers: Int = extractValue(value: value, key: "numberOfFollowers")
        
        headerView?.setupSegmentedControl(postsCount: totalNumberOfPost, wishlistCount: 0, followersCount: numberOfFollowers)
            
        tableView.reloadData()
        
        TRUser.sharedInstance.setupPostsAndFollowers(totalNumberOfPost: totalNumberOfPost, numberOfFollowers: numberOfFollowers)
    }
    
    func extractValue(value: JSON, key: String) -> Int {
        
        if value[key].type != SwiftyJSON.Type.null {
            
            return value[key].int!
            
        } else {
            
            return 0
        }
    }
    
    override func callAPI() {
        
        let userService = service as! TRProfileService
        
        userService.otherProfileAPI(id: TRUser.sharedInstance.id!, success: {
            
            
            }, failure: {
                
            
        })
    }
    
    func editProfileAPI() {
        
        let userService = service as! TRProfileService
        
        let fullName: String = headerView!.fullNameField.text!
        let description: String = headerView!.descriptionField.text!
        
        let totalNumberOfPost: Int = TRUser.sharedInstance.totalNumberOfPost!
        let numberOfFollowers: Int = TRUser.sharedInstance.numberOfFollowers!
        
        userService.editProfileAPI(id: TRUser.sharedInstance.id!, fullName: fullName, description: description, totalNumberOfPost: totalNumberOfPost, numberOfFollowers: numberOfFollowers, success: {
            
            
            }, failure: {
                
                
        })
    }
    
    /**
     * Table view setup
     */
    func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        headerView = Bundle.main.loadNibNamed("TRProfileHeaderView", owner: self, options: nil)?.first as? TRProfileHeaderView
        
        headerView?.delegate = self
        
        tableView.tableHeaderView = headerView
        
        tableView.register(UINib(nibName: String(describing: TRTravelCardCell.self), bundle: Bundle.main), forCellReuseIdentifier: String(describing: TRTravelCardCell.self))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return travellingPostsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return travellingPostCardHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TRTravelCardCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TRTravelCardCell.self)) as! TRTravelCardCell
        
        cell.setupCell(travellingPost: travellingPostsArray[indexPath.row])
        
        return cell
    }
    
    @IBAction func createPostButtonTapped(_ sender: AnyObject) {
        
        performSegue(withIdentifier: kProfileToCreatePostSegue, sender: self)
    }
}
