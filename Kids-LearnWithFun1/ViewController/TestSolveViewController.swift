//
//  TestSolveViewController.swift
//  Kids-LearnWithFun1
//
//  Created by sheetal shinde on 28/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit

class TestSolveViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var btnSound: UIButton!
    @IBOutlet weak var collectionViewCard: UICollectionView!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnBackward: UIButton!
    @IBOutlet weak var lblQuestion: UILabel!

    var soundStatus:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func funcGoToTestHome(_ sender: Any) {
        //interstitial = createAndLoadInterstitial()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func funcSound_ON_OFF(_ sender: Any) {
        soundStatus = !soundStatus
        if soundStatus {
            btnSound.setBackgroundImage(UIImage(named: "Sound-Off.png"), for: .normal)
        } else {
            btnSound.setBackgroundImage(UIImage(named: "Sound-On.png"), for: .normal)
        }
    }
}
