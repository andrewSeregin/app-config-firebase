//
//  ViewController.swift
//  AppConfigDemo
//
//  Created by Andrew Seregin on 26.04.2022.
//

import AppConfig
import UIKit

class ViewController: UIViewController {
    
    @ConfigValue(\.bool_value)
    private var boolValue: Bool
    
    @ConfigValue(\.url)
    private var imagURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

