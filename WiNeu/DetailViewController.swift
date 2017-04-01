//
//  DetailViewController.swift
//  WiNeu
//
//  Created by Paul Neuhold on 01.03.17.
//  Copyright © 2017 Paul Neuhold. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UITableViewController {
    
    
    let cells : [String] = ["attributes", "story"]
    
    class func create() -> DetailViewController {
        return StoryboardScene.DetailViewController.instantiateDetailView()
    }
    
    
    override func viewDidLoad() {
        
        
        
        for cell in cells {
            self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cell)
        }
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        
        
    }
    
    
    
    
    
    
    //MARK: UITableControllerDelegate 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cells[indexPath.row])
        
        cell.textLabel?.text = "Some Attributes"
        cell.detailTextLabel?.text = "some awesome story to be here you dont believe it."
        cell.detailTextLabel?.numberOfLines = 3
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "A tolles Tier"
    }
    
}
