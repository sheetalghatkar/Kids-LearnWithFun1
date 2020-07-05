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
    @IBOutlet weak var imgVwTest1: UIImageView!
    @IBOutlet weak var imgVwTest2: UIImageView!
    @IBOutlet weak var imgVwTest3: UIImageView!
    @IBOutlet weak var imgVwTest4: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognImgVwTest1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwTest1.addGestureRecognizer(tapGestureRecognImgVwTest1)
        imgVwTest1.tag = 1

        let tapGestureRecognImgVwTest2 = UITapGestureRecognizer(
            target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwTest2.addGestureRecognizer(tapGestureRecognImgVwTest2)
        imgVwTest2.tag = 2

        let tapGestureRecognImgVwTest3 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwTest3.addGestureRecognizer(tapGestureRecognImgVwTest3)
        imgVwTest3.tag = 3


        let tapGestureRecognImgVwTest4 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwTest4.addGestureRecognizer(tapGestureRecognImgVwTest4)
        imgVwTest4.tag = 4

    }
    
    @IBAction func funcGoToTestHome(_ sender: Any) {
        //interstitial = createAndLoadInterstitial()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let setTestSolveVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestSolveViewController") as! TestSolveViewController
        if tapGestureRecognizer.view?.tag == 1 {
            let solveTestArray = [[
                      CommanArray.wildAnimalNameArray[2]+"-"+"0",
                      CommanArray.wildAnimalNameArray[10]+"-"+"0",
                      CommanArray.wildAnimalNameArray[0]+"-"+"1",
                      CommanArray.wildAnimalNameArray[7]+"-"+"0"
                  ],
                  [
                       CommanArray.wildAnimalNameArray[3]+"-"+"0",
                       CommanArray.wildAnimalNameArray[1]+"-"+"1",
                       CommanArray.wildAnimalNameArray[5]+"-"+"0",
                       CommanArray.wildAnimalNameArray[14]+"-"+"0"
                  ],
                  [
                       CommanArray.wildAnimalNameArray[2]+"-"+"1",
                       CommanArray.wildAnimalNameArray[0]+"-"+"0",
                       CommanArray.wildAnimalNameArray[7]+"-"+"0",
                       CommanArray.wildAnimalNameArray[10]+"-"+"0"
                  ],
                  [
                       CommanArray.wildAnimalNameArray[9]+"-"+"0",
                       CommanArray.wildAnimalNameArray[1]+"-"+"0",
                       CommanArray.wildAnimalNameArray[15]+"-"+"0",
                       CommanArray.wildAnimalNameArray[3]+"-"+"1"
                  ],
                  [
                       CommanArray.wildAnimalNameArray[8]+"-"+"0",
                       CommanArray.wildAnimalNameArray[4]+"-"+"1",
                       CommanArray.wildAnimalNameArray[7]+"-"+"0",
                       CommanArray.wildAnimalNameArray[14]+"-"+"0"
                  ],
                  [
                       CommanArray.wildAnimalNameArray[3]+"-"+"0",
                       CommanArray.wildAnimalNameArray[1]+"-"+"0",
                       CommanArray.wildAnimalNameArray[5]+"-"+"1",
                       CommanArray.wildAnimalNameArray[6]+"-"+"0"
                  ],
                  [
                       CommanArray.wildAnimalNameArray[0]+"-"+"0",
                       CommanArray.wildAnimalNameArray[6]+"-"+"1",
                       CommanArray.wildAnimalNameArray[13]+"-"+"0",
                       CommanArray.wildAnimalNameArray[10]+"-"+"0"
                  ],
                  [
                       CommanArray.wildAnimalNameArray[11]+"-"+"0",
                       CommanArray.wildAnimalNameArray[4]+"-"+"0",
                       CommanArray.wildAnimalNameArray[7]+"-"+"1",
                       CommanArray.wildAnimalNameArray[9]+"-"+"0"
                   ],
                   [
                       CommanArray.wildAnimalNameArray[3]+"-"+"0",
                       CommanArray.wildAnimalNameArray[14]+"-"+"0",
                       CommanArray.wildAnimalNameArray[5]+"-"+"0",
                       CommanArray.wildAnimalNameArray[8]+"-"+"1"
                   ],
                   [
                       CommanArray.wildAnimalNameArray[0]+"-"+"0",
                       CommanArray.wildAnimalNameArray[9]+"-"+"1",
                       CommanArray.wildAnimalNameArray[7]+"-"+"0",
                       CommanArray.wildAnimalNameArray[13]+"-"+"0"
                   ],
                   [
                       CommanArray.wildAnimalNameArray[3]+"-"+"0",
                       CommanArray.wildAnimalNameArray[10]+"-"+"1",
                       CommanArray.wildAnimalNameArray[11]+"-"+"0",
                       CommanArray.wildAnimalNameArray[6]+"-"+"0"
                   ],
                   [
                       CommanArray.wildAnimalNameArray[11]+"-"+"1",
                       CommanArray.wildAnimalNameArray[4]+"-"+"0",
                       CommanArray.wildAnimalNameArray[0]+"-"+"0",
                       CommanArray.wildAnimalNameArray[10]+"-"+"0"
                   ],
                   [
                       CommanArray.wildAnimalNameArray[1]+"-"+"0",
                       CommanArray.wildAnimalNameArray[8]+"-"+"0",
                       CommanArray.wildAnimalNameArray[12]+"-"+"1",
                       CommanArray.wildAnimalNameArray[7]+"-"+"0"
                   ],
                   [
                       CommanArray.wildAnimalNameArray[2]+"-"+"0",
                       CommanArray.wildAnimalNameArray[13]+"-"+"1",
                       CommanArray.wildAnimalNameArray[5]+"-"+"0",
                       CommanArray.wildAnimalNameArray[4]+"-"+"0"
                   ],
                   [
                       CommanArray.wildAnimalNameArray[14]+"-"+"1",
                       CommanArray.wildAnimalNameArray[8]+"-"+"0",
                       CommanArray.wildAnimalNameArray[3]+"-"+"0",
                       CommanArray.wildAnimalNameArray[7]+"-"+"0"
                   ],
                   [
                       CommanArray.wildAnimalNameArray[0]+"-"+"0",
                       CommanArray.wildAnimalNameArray[2]+"-"+"0",
                       CommanArray.wildAnimalNameArray[15]+"-"+"1",
                       CommanArray.wildAnimalNameArray[9]+"-"+"0"
                   ]]
            setTestSolveVC.showOptionsArray = solveTestArray
            setTestSolveVC.getImageNameArray = CommanArray.wildAnimalNameArray
        }
        else if tapGestureRecognizer.view?.tag == 2 {
            let solveTestArray = [
                  [
                     CommanArray.domesticAnimalNameArray[2]+"-"+"0",
                     CommanArray.domesticAnimalNameArray[10]+"-"+"0",
                     CommanArray.domesticAnimalNameArray[0]+"-"+"1",
                     CommanArray.domesticAnimalNameArray[7]+"-"+"0"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[3]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[1]+"-"+"1",
                      CommanArray.domesticAnimalNameArray[5]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[4]+"-"+"0"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[2]+"-"+"1",
                      CommanArray.domesticAnimalNameArray[0]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[7]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[10]+"-"+"0"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[9]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[1]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[5]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[3]+"-"+"1"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[8]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[4]+"-"+"1",
                      CommanArray.domesticAnimalNameArray[7]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[0]+"-"+"0"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[3]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[1]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[5]+"-"+"1",
                      CommanArray.domesticAnimalNameArray[6]+"-"+"0"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[0]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[6]+"-"+"1",
                      CommanArray.domesticAnimalNameArray[2]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[10]+"-"+"0"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[1]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[4]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[7]+"-"+"1",
                      CommanArray.domesticAnimalNameArray[9]+"-"+"0"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[6]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[10]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[5]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[8]+"-"+"1"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[0]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[9]+"-"+"1",
                      CommanArray.domesticAnimalNameArray[7]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[3]+"-"+"0"
                  ],
                  [
                      CommanArray.domesticAnimalNameArray[4]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[10]+"-"+"1",
                      CommanArray.domesticAnimalNameArray[1]+"-"+"0",
                      CommanArray.domesticAnimalNameArray[6]+"-"+"0"
                  ]
            ]
            setTestSolveVC.showOptionsArray = solveTestArray
            setTestSolveVC.getImageNameArray = CommanArray.domesticAnimalNameArray
        }
        else if tapGestureRecognizer.view?.tag == 3 {
            let solveTestArray = [
                [
                   CommanArray.birdNameArray[2]+"-"+"0",
                   CommanArray.birdNameArray[10]+"-"+"0",
                   CommanArray.birdNameArray[0]+"-"+"1",
                   CommanArray.birdNameArray[7]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[3]+"-"+"0",
                   CommanArray.birdNameArray[1]+"-"+"1",
                   CommanArray.birdNameArray[5]+"-"+"0",
                   CommanArray.birdNameArray[9]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[2]+"-"+"1",
                   CommanArray.birdNameArray[0]+"-"+"0",
                   CommanArray.birdNameArray[7]+"-"+"0",
                   CommanArray.birdNameArray[10]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[9]+"-"+"0",
                   CommanArray.birdNameArray[11]+"-"+"0",
                   CommanArray.birdNameArray[5]+"-"+"0",
                   CommanArray.birdNameArray[3]+"-"+"1"
                ],
                [
                   CommanArray.birdNameArray[8]+"-"+"0",
                   CommanArray.birdNameArray[4]+"-"+"1",
                   CommanArray.birdNameArray[7]+"-"+"0",
                   CommanArray.birdNameArray[2]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[3]+"-"+"0",
                   CommanArray.birdNameArray[12]+"-"+"0",
                   CommanArray.birdNameArray[5]+"-"+"1",
                   CommanArray.birdNameArray[6]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[0]+"-"+"0",
                   CommanArray.birdNameArray[6]+"-"+"1",
                   CommanArray.birdNameArray[1]+"-"+"0",
                   CommanArray.birdNameArray[10]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[11]+"-"+"0",
                   CommanArray.birdNameArray[4]+"-"+"0",
                   CommanArray.birdNameArray[7]+"-"+"1",
                   CommanArray.birdNameArray[9]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[3]+"-"+"0",
                   CommanArray.birdNameArray[1]+"-"+"0",
                   CommanArray.birdNameArray[5]+"-"+"0",
                   CommanArray.birdNameArray[8]+"-"+"1"
                ],
                [
                   CommanArray.birdNameArray[0]+"-"+"0",
                   CommanArray.birdNameArray[9]+"-"+"1",
                   CommanArray.birdNameArray[7]+"-"+"0",
                   CommanArray.birdNameArray[12]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[3]+"-"+"0",
                   CommanArray.birdNameArray[10]+"-"+"1",
                   CommanArray.birdNameArray[11]+"-"+"0",
                   CommanArray.birdNameArray[6]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[11]+"-"+"1",
                   CommanArray.birdNameArray[4]+"-"+"0",
                   CommanArray.birdNameArray[0]+"-"+"0",
                   CommanArray.birdNameArray[10]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[1]+"-"+"0",
                   CommanArray.birdNameArray[8]+"-"+"0",
                   CommanArray.birdNameArray[12]+"-"+"1",
                   CommanArray.birdNameArray[7]+"-"+"0"
                ]
            ]
            setTestSolveVC.showOptionsArray = solveTestArray
            setTestSolveVC.getImageNameArray = CommanArray.birdNameArray
        }
        else if tapGestureRecognizer.view?.tag == 4 {
            let solveTestArray = [[
                    CommanArray.flowerNameArray[2]+"-"+"0",
                    CommanArray.flowerNameArray[10]+"-"+"0",
                    CommanArray.flowerNameArray[0]+"-"+"1",
                    CommanArray.flowerNameArray[7]+"-"+"0"
                ],
               [
                       CommanArray.flowerNameArray[3]+"-"+"0",
                       CommanArray.flowerNameArray[1]+"-"+"1",
                       CommanArray.flowerNameArray[5]+"-"+"0",
                       CommanArray.flowerNameArray[9]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[2]+"-"+"1",
                       CommanArray.flowerNameArray[0]+"-"+"0",
                       CommanArray.flowerNameArray[7]+"-"+"0",
                       CommanArray.flowerNameArray[10]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[9]+"-"+"0",
                       CommanArray.flowerNameArray[1]+"-"+"0",
                       CommanArray.flowerNameArray[5]+"-"+"0",
                       CommanArray.flowerNameArray[3]+"-"+"1"
                   ],
                [
                       CommanArray.flowerNameArray[8]+"-"+"0",
                       CommanArray.flowerNameArray[4]+"-"+"1",
                       CommanArray.flowerNameArray[7]+"-"+"0",
                       CommanArray.flowerNameArray[2]+"-"+"0"
                   ],
                [
                       CommanArray.flowerNameArray[3]+"-"+"0",
                       CommanArray.flowerNameArray[1]+"-"+"0",
                       CommanArray.flowerNameArray[5]+"-"+"1",
                       CommanArray.flowerNameArray[6]+"-"+"0"
                   ],
                [
                       CommanArray.flowerNameArray[0]+"-"+"0",
                       CommanArray.flowerNameArray[6]+"-"+"1",
                       CommanArray.flowerNameArray[12]+"-"+"0",
                       CommanArray.flowerNameArray[10]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[11]+"-"+"0",
                       CommanArray.flowerNameArray[4]+"-"+"0",
                       CommanArray.flowerNameArray[7]+"-"+"1",
                       CommanArray.flowerNameArray[9]+"-"+"0"
                   ],
                [
                       CommanArray.flowerNameArray[3]+"-"+"0",
                       CommanArray.flowerNameArray[1]+"-"+"0",
                       CommanArray.flowerNameArray[5]+"-"+"0",
                       CommanArray.flowerNameArray[8]+"-"+"1"
                   ],
                 [
                       CommanArray.flowerNameArray[0]+"-"+"0",
                       CommanArray.flowerNameArray[9]+"-"+"1",
                       CommanArray.flowerNameArray[7]+"-"+"0",
                       CommanArray.flowerNameArray[2]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[3]+"-"+"0",
                       CommanArray.flowerNameArray[10]+"-"+"1",
                       CommanArray.flowerNameArray[11]+"-"+"0",
                       CommanArray.flowerNameArray[6]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[11]+"-"+"1",
                       CommanArray.flowerNameArray[4]+"-"+"0",
                       CommanArray.flowerNameArray[0]+"-"+"0",
                       CommanArray.flowerNameArray[10]+"-"+"0"
                   ],
                [
                       CommanArray.flowerNameArray[1]+"-"+"0",
                       CommanArray.flowerNameArray[8]+"-"+"0",
                       CommanArray.flowerNameArray[12]+"-"+"1",
                       CommanArray.flowerNameArray[7]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[3]+"-"+"0",
                       CommanArray.flowerNameArray[13]+"-"+"1",
                       CommanArray.flowerNameArray[5]+"-"+"0",
                       CommanArray.flowerNameArray[9]+"-"+"0"
                   ]]
            
            setTestSolveVC.showOptionsArray = solveTestArray
            setTestSolveVC.getImageNameArray = CommanArray.flowerNameArray
        }
        self.navigationController?.pushViewController(setTestSolveVC, animated: true)
    }
    // MARK: - User defined Functions
    @IBAction func funcGoToHome(_ sender: Any) {
        //interstitial = createAndLoadInterstitial()
        navigationController?.popViewController(animated: true)
    }
}
