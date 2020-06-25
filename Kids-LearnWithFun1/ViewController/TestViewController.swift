//
//  TestViewController.swift
//  Kids-LearnWithFun1
//
//  Created by sheetal shinde on 24/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var btnHome: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - User defined Functions
    
    @IBAction func funcGoToHome(_ sender: Any) {
        //interstitial = createAndLoadInterstitial()
        navigationController?.popViewController(animated: true)
    }

}
