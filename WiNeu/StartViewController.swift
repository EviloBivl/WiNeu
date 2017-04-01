//
//  StartViewController.swift
//  WiNeu
//
//  Created by Paul Neuhold on 11.02.17.
//  Copyright © 2017 Paul Neuhold. All rights reserved.
//

import UIKit

class StartViewController: UITableViewController  {

    
    var viewModel : StartViewModel!
    class func create(with jsonKey: String) -> StartViewController {
        let startViewController = StoryboardScene.StartView.initialViewController()
        startViewController.viewModel = StartViewModel(with: jsonKey)
        startViewController.view.backgroundColor = Color(named: .secondaryColor)
        return startViewController
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        tableView.tintColor = .black
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK : UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell?
        if viewModel.rows.count == 1 {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
            cell?.backgroundColor = Color(named: .secondaryColor)
            cell?.textLabel?.text = viewModel.rows[indexPath.row]
            cell?.textLabel?.numberOfLines = 5
            cell?.accessoryType = .detailDisclosureButton
        } else {
            cell = UITableViewCell()
            cell?.backgroundColor = Color(named: .secondaryColor)
            cell?.textLabel?.text = viewModel.rows[indexPath.row]
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.tintColor = .black
      
        
        return cell ?? UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if viewModel.rows.count == 1 {
            return 120
        } else {
            return 64
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedKey : String?
        if indexPath.row < viewModel.rows.count {
            selectedKey = viewModel.rows[indexPath.row]
        }
        
        guard let jsonKey = selectedKey else {
            return
        }
        if !viewModel.isLast {
            self.navigationController?.pushViewController(StartViewController.create(with: jsonKey), animated: true)
        } else {
            self.navigationController?.pushViewController(DetailViewController.create(), animated: true)
        }
    }
    
    
}

