//
//  ViewController.swift
//  StarTrivia
//
//  Created by Ahmed Sayed on 11/2/20.
//  Copyright © 2020 Ahmed Sayed. All rights reserved.
//

import UIKit

class SelectPersonVC: UIViewController {
    
    var personApi = PersonApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personApi.getRandomPersonUrlSession()

    }


}

