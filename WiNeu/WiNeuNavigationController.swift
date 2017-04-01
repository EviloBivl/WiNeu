//
//  WiNeuNavigationController.swift
//  WiNeu
//
//  Created by Paul Neuhold on 11.02.17.
//  Copyright © 2017 Paul Neuhold. All rights reserved.
//

import Foundation
import UIKit

class WiNeuNavigationController : UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.navigationBar.barTintColor = Color(named: .primaryColor)
        self.navigationBar.isTranslucent = true
        self.navigationBar.topItem?.title = "WiNeu"
        self.navigationBar.tintColor = .black

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
}
