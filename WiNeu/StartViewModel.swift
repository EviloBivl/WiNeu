//
//  StartViewModel.swift
//  WiNeu
//
//  Created by Paul Neuhold on 01.03.17.
//  Copyright © 2017 Paul Neuhold. All rights reserved.
//

import Foundation


final class StartViewModel {
    
    var rows : [String] = []
    var jsonKey : String = "rows"
    var isLast : Bool = false
    
    init(with jsonKey: String) {
        self.jsonKey = jsonKey
        initJSONData()
    }
    
    
    fileprivate func initJSONData(){
        
        let file = Bundle.main.path(forResource: "data", ofType: "json")
        let url = URL(fileURLWithPath: file!)
        guard let data = try? Data(contentsOf: url), let json = try? JSONSerialization.jsonObject(with: data) else {
            print("nothing to do here")
            return
        }
      
        guard let dictionary = json as? [String:Any],
            let rows = dictionary[jsonKey] as? [String]  else{
                return
        }
        self.rows = rows
        if self.rows.count == 1 {
            isLast = true
        }
        
    }
    
    
    
}
