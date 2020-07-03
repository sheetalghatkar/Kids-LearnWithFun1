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
            let solveTestArray = [
             CommanArray.wildAnimalNameArray[0]: [
                    CommanArray.wildAnimalImageArray[2]: 0,
                    CommanArray.wildAnimalImageArray[10]: 0,
                    CommanArray.wildAnimalImageArray[0]: 1,
                    CommanArray.wildAnimalImageArray[7]: 0
                ],
                CommanArray.wildAnimalNameArray[1]: [
                       CommanArray.wildAnimalImageArray[3]: 0,
                       CommanArray.wildAnimalImageArray[1]: 1,
                       CommanArray.wildAnimalImageArray[5]: 0,
                       CommanArray.wildAnimalImageArray[14]: 0
                   ],
                CommanArray.wildAnimalNameArray[2]: [
                       CommanArray.wildAnimalImageArray[2]: 1,
                       CommanArray.wildAnimalImageArray[0]: 0,
                       CommanArray.wildAnimalImageArray[7]: 0,
                       CommanArray.wildAnimalImageArray[10]: 0
                   ],
                CommanArray.wildAnimalNameArray[3]: [
                       CommanArray.wildAnimalImageArray[9]: 0,
                       CommanArray.wildAnimalImageArray[1]: 0,
                       CommanArray.wildAnimalImageArray[15]: 0,
                       CommanArray.wildAnimalImageArray[3]: 1
                   ],
                CommanArray.wildAnimalNameArray[4]: [
                       CommanArray.wildAnimalImageArray[8]: 0,
                       CommanArray.wildAnimalImageArray[4]: 1,
                       CommanArray.wildAnimalImageArray[7]: 0,
                       CommanArray.wildAnimalImageArray[14]: 0
                   ],
                CommanArray.wildAnimalNameArray[5]: [
                       CommanArray.wildAnimalImageArray[3]: 0,
                       CommanArray.wildAnimalImageArray[1]: 0,
                       CommanArray.wildAnimalImageArray[5]: 1,
                       CommanArray.wildAnimalImageArray[6]: 0
                   ],
                CommanArray.wildAnimalNameArray[6]: [
                       CommanArray.wildAnimalImageArray[0]: 0,
                       CommanArray.wildAnimalImageArray[6]: 1,
                       CommanArray.wildAnimalImageArray[13]: 0,
                       CommanArray.wildAnimalImageArray[10]: 0
                   ],
                CommanArray.wildAnimalNameArray[7]: [
                       CommanArray.wildAnimalImageArray[11]: 0,
                       CommanArray.wildAnimalImageArray[4]: 0,
                       CommanArray.wildAnimalImageArray[7]: 1,
                       CommanArray.wildAnimalImageArray[9]: 0
                   ],
                CommanArray.wildAnimalNameArray[8]: [
                       CommanArray.wildAnimalImageArray[3]: 0,
                       CommanArray.wildAnimalImageArray[14]: 0,
                       CommanArray.wildAnimalImageArray[5]: 0,
                       CommanArray.wildAnimalImageArray[8]: 1
                   ],
                CommanArray.wildAnimalNameArray[9]: [
                       CommanArray.wildAnimalImageArray[0]: 0,
                       CommanArray.wildAnimalImageArray[9]: 1,
                       CommanArray.wildAnimalImageArray[7]: 0,
                       CommanArray.wildAnimalImageArray[13]: 0
                   ],
                CommanArray.wildAnimalNameArray[10]: [
                       CommanArray.wildAnimalImageArray[3]: 0,
                       CommanArray.wildAnimalImageArray[10]: 1,
                       CommanArray.wildAnimalImageArray[11]: 0,
                       CommanArray.wildAnimalImageArray[6]: 0
                   ],
                CommanArray.wildAnimalNameArray[11]: [
                       CommanArray.wildAnimalImageArray[11]: 1,
                       CommanArray.wildAnimalImageArray[4]: 0,
                       CommanArray.wildAnimalImageArray[0]: 0,
                       CommanArray.wildAnimalImageArray[10]: 0
                   ],
                CommanArray.wildAnimalNameArray[12]: [
                       CommanArray.wildAnimalImageArray[1]: 0,
                       CommanArray.wildAnimalImageArray[8]: 0,
                       CommanArray.wildAnimalImageArray[12]: 1,
                       CommanArray.wildAnimalImageArray[7]: 0
                   ],
                CommanArray.wildAnimalNameArray[13]: [
                       CommanArray.wildAnimalImageArray[2]: 0,
                       CommanArray.wildAnimalImageArray[13]: 1,
                       CommanArray.wildAnimalImageArray[5]: 0,
                       CommanArray.wildAnimalImageArray[4]: 0
                   ],
                CommanArray.wildAnimalNameArray[14]: [
                       CommanArray.wildAnimalImageArray[14]: 1,
                       CommanArray.wildAnimalImageArray[8]: 0,
                       CommanArray.wildAnimalImageArray[3]: 0,
                       CommanArray.wildAnimalImageArray[7]: 0
                   ],
                CommanArray.wildAnimalNameArray[15]: [
                       CommanArray.wildAnimalImageArray[0]: 0,
                       CommanArray.wildAnimalImageArray[2]: 0,
                       CommanArray.wildAnimalImageArray[15]: 1,
                       CommanArray.wildAnimalImageArray[9]: 0
                   ]
            ]
            setTestSolveVC.solveTestArray = solveTestArray
        }
        else if tapGestureRecognizer.view?.tag == 2 {
            let solveTestArray = [
            CommanArray.domesticAnimalNameArray[0]: [
                   CommanArray.domesticAnimalImageArray[2]: 0,
                   CommanArray.domesticAnimalImageArray[10]: 0,
                   CommanArray.domesticAnimalImageArray[0]: 1,
                   CommanArray.domesticAnimalImageArray[7]: 0
               ],
               CommanArray.domesticAnimalNameArray[1]: [
                      CommanArray.domesticAnimalImageArray[3]: 0,
                      CommanArray.domesticAnimalImageArray[1]: 1,
                      CommanArray.domesticAnimalImageArray[5]: 0,
                      CommanArray.domesticAnimalImageArray[4]: 0
                  ],
               CommanArray.domesticAnimalNameArray[2]: [
                      CommanArray.domesticAnimalImageArray[2]: 1,
                      CommanArray.domesticAnimalImageArray[0]: 0,
                      CommanArray.domesticAnimalImageArray[7]: 0,
                      CommanArray.domesticAnimalImageArray[10]: 0
                  ],
               CommanArray.domesticAnimalNameArray[3]: [
                      CommanArray.domesticAnimalImageArray[9]: 0,
                      CommanArray.domesticAnimalImageArray[1]: 0,
                      CommanArray.domesticAnimalImageArray[5]: 0,
                      CommanArray.domesticAnimalImageArray[3]: 1
                  ],
               CommanArray.domesticAnimalNameArray[4]: [
                      CommanArray.domesticAnimalImageArray[8]: 0,
                      CommanArray.domesticAnimalImageArray[4]: 1,
                      CommanArray.domesticAnimalImageArray[7]: 0,
                      CommanArray.domesticAnimalImageArray[0]: 0
                  ],
               CommanArray.domesticAnimalNameArray[5]: [
                      CommanArray.domesticAnimalImageArray[3]: 0,
                      CommanArray.domesticAnimalImageArray[1]: 0,
                      CommanArray.domesticAnimalImageArray[5]: 1,
                      CommanArray.domesticAnimalImageArray[6]: 0
                  ],
               CommanArray.domesticAnimalNameArray[6]: [
                      CommanArray.domesticAnimalImageArray[0]: 0,
                      CommanArray.domesticAnimalImageArray[6]: 1,
                      CommanArray.domesticAnimalImageArray[2]: 0,
                      CommanArray.domesticAnimalImageArray[10]: 0
                  ],
               CommanArray.domesticAnimalNameArray[7]: [
                      CommanArray.domesticAnimalImageArray[1]: 0,
                      CommanArray.domesticAnimalImageArray[4]: 0,
                      CommanArray.domesticAnimalImageArray[7]: 1,
                      CommanArray.domesticAnimalImageArray[9]: 0
                  ],
               CommanArray.domesticAnimalNameArray[8]: [
                      CommanArray.domesticAnimalImageArray[3]: 0,
                      CommanArray.domesticAnimalImageArray[10]: 0,
                      CommanArray.domesticAnimalImageArray[5]: 0,
                      CommanArray.domesticAnimalImageArray[8]: 1
                  ],
               CommanArray.domesticAnimalNameArray[9]: [
                      CommanArray.domesticAnimalImageArray[0]: 0,
                      CommanArray.domesticAnimalImageArray[9]: 1,
                      CommanArray.domesticAnimalImageArray[7]: 0,
                      CommanArray.domesticAnimalImageArray[3]: 0
                  ],
               CommanArray.domesticAnimalNameArray[10]: [
                      CommanArray.domesticAnimalImageArray[3]: 0,
                      CommanArray.domesticAnimalImageArray[10]: 1,
                      CommanArray.domesticAnimalImageArray[1]: 0,
                      CommanArray.domesticAnimalImageArray[6]: 0
                  ]
            ]
            setTestSolveVC.solveTestArray = solveTestArray
        }
        else if tapGestureRecognizer.view?.tag == 3 {
            let solveTestArray = [
             CommanArray.birdNameArray[0]: [
                    CommanArray.birdImageArray[2]: 0,
                    CommanArray.birdImageArray[10]: 0,
                    CommanArray.birdImageArray[0]:1,
                    CommanArray.birdImageArray[7]: 0
                ],
                CommanArray.birdNameArray[1]: [
                       CommanArray.birdImageArray[3]: 0,
                       CommanArray.birdImageArray[1]: 1,
                       CommanArray.birdImageArray[5]: 0,
                       CommanArray.birdImageArray[9]: 0
                   ],
                CommanArray.birdNameArray[2]: [
                       CommanArray.birdImageArray[2]: 1,
                       CommanArray.birdImageArray[0]: 0,
                       CommanArray.birdImageArray[7]: 0,
                       CommanArray.birdImageArray[10]: 0
                   ],
                CommanArray.birdNameArray[3]: [
                       CommanArray.birdImageArray[9]: 0,
                       CommanArray.birdImageArray[11]: 0,
                       CommanArray.birdImageArray[5]: 0,
                       CommanArray.birdImageArray[3]: 1
                   ],
                CommanArray.birdNameArray[4]: [
                       CommanArray.birdImageArray[8]: 0,
                       CommanArray.birdImageArray[4]: 1,
                       CommanArray.birdImageArray[7]: 0,
                       CommanArray.birdImageArray[2]: 0
                   ],
                CommanArray.birdNameArray[5]: [
                       CommanArray.birdImageArray[3]: 0,
                       CommanArray.birdImageArray[12]: 0,
                       CommanArray.birdImageArray[5]: 1,
                       CommanArray.birdImageArray[6]: 0
                   ],
                CommanArray.birdNameArray[6]: [
                       CommanArray.birdImageArray[0]: 0,
                       CommanArray.birdImageArray[6]: 1,
                       CommanArray.birdImageArray[1]: 0,
                       CommanArray.birdImageArray[10]: 0
                   ],
                CommanArray.birdNameArray[7]: [
                       CommanArray.birdImageArray[11]: 0,
                       CommanArray.birdImageArray[4]: 0,
                       CommanArray.birdImageArray[7]: 1,
                       CommanArray.birdImageArray[9]: 0
                   ],
                CommanArray.birdNameArray[8]: [
                       CommanArray.birdImageArray[3]: 0,
                       CommanArray.birdImageArray[1]: 0,
                       CommanArray.birdImageArray[5]: 0,
                       CommanArray.birdImageArray[8]: 1
                   ],
                CommanArray.birdNameArray[9]: [
                       CommanArray.birdImageArray[0]: 0,
                       CommanArray.birdImageArray[9]: 1,
                       CommanArray.birdImageArray[7]: 0,
                       CommanArray.birdImageArray[12]: 0
                   ],
                CommanArray.birdNameArray[10]: [
                       CommanArray.birdImageArray[3]: 0,
                       CommanArray.birdImageArray[10]: 1,
                       CommanArray.birdImageArray[11]: 0,
                       CommanArray.birdImageArray[6]: 0
                   ],
                CommanArray.birdNameArray[11]: [
                       CommanArray.birdImageArray[11]: 1,
                       CommanArray.birdImageArray[4]: 0,
                       CommanArray.birdImageArray[0]: 0,
                       CommanArray.birdImageArray[10]: 0
                   ],
                CommanArray.birdNameArray[12]: [
                       CommanArray.birdImageArray[1]: 0,
                       CommanArray.birdImageArray[8]: 0,
                       CommanArray.birdImageArray[12]: 1,
                       CommanArray.birdImageArray[7]: 0
                   ]
            ]
            setTestSolveVC.solveTestArray = solveTestArray
        }
        else if tapGestureRecognizer.view?.tag == 4 {
//            let solveTestArray = [
//             CommanArray.flowerNameArray[0]: [
//                    CommanArray.flowerImageArray[2]: 0,
//                    CommanArray.flowerImageArray[10]: 0,
//                    CommanArray.flowerImageArray[0]:1,
//                    CommanArray.flowerImageArray[7]: 0
//                ],
//                CommanArray.flowerNameArray[1]: [
//                       CommanArray.flowerImageArray[3]: 0,
//                       CommanArray.flowerImageArray[1]: 1,
//                       CommanArray.flowerImageArray[5]: 0,
//                       CommanArray.flowerImageArray[9]: 0
//                   ],
//                CommanArray.flowerNameArray[2]: [
//                       CommanArray.flowerImageArray[2]: 1,
//                       CommanArray.flowerImageArray[0]: 0,
//                       CommanArray.flowerImageArray[7]: 0,
//                       CommanArray.flowerImageArray[10]: 0
//                   ],
//                CommanArray.flowerNameArray[3]: [
//                       CommanArray.flowerImageArray[9]: 0,
//                       CommanArray.flowerImageArray[1]: 0,
//                       CommanArray.flowerImageArray[5]: 0,
//                       CommanArray.flowerImageArray[3]: 1
//                   ],
//                CommanArray.flowerNameArray[4]: [
//                       CommanArray.flowerImageArray[8]: 0,
//                       CommanArray.flowerImageArray[4]: 1,
//                       CommanArray.flowerImageArray[7]: 0,
//                       CommanArray.flowerImageArray[2]: 0
//                   ],
//                CommanArray.flowerNameArray[5]: [
//                       CommanArray.flowerImageArray[3]: 0,
//                       CommanArray.flowerImageArray[1]: 0,
//                       CommanArray.flowerImageArray[5]: 1,
//                       CommanArray.flowerImageArray[6]: 0
//                   ],
//                CommanArray.flowerNameArray[6]: [
//                       CommanArray.flowerImageArray[0]: 0,
//                       CommanArray.flowerImageArray[6]: 1,
//                       CommanArray.flowerImageArray[12]: 0,
//                       CommanArray.flowerImageArray[10]: 0
//                   ],
//                CommanArray.flowerNameArray[7]: [
//                       CommanArray.flowerImageArray[11]: 0,
//                       CommanArray.flowerImageArray[4]: 0,
//                       CommanArray.flowerImageArray[7]: 1,
//                       CommanArray.flowerImageArray[9]: 0
//                   ],
//                CommanArray.flowerNameArray[8]: [
//                       CommanArray.flowerImageArray[3]: 0,
//                       CommanArray.flowerImageArray[1]: 0,
//                       CommanArray.flowerImageArray[5]: 0,
//                       CommanArray.flowerImageArray[8]: 1
//                   ],
//                CommanArray.flowerNameArray[9]: [
//                       CommanArray.flowerImageArray[0]: 0,
//                       CommanArray.flowerImageArray[9]: 1,
//                       CommanArray.flowerImageArray[7]: 0,
//                       CommanArray.flowerImageArray[2]: 0
//                   ],
//                CommanArray.flowerNameArray[10]: [
//                       CommanArray.flowerImageArray[3]: 0,
//                       CommanArray.flowerImageArray[10]: 1,
//                       CommanArray.flowerImageArray[11]: 0,
//                       CommanArray.flowerImageArray[6]: 0
//                   ],
//                CommanArray.flowerNameArray[11]: [
//                       CommanArray.flowerImageArray[11]: 1,
//                       CommanArray.flowerImageArray[4]: 0,
//                       CommanArray.flowerImageArray[0]: 0,
//                       CommanArray.flowerImageArray[10]: 0
//                   ],
//                CommanArray.flowerNameArray[12]: [
//                       CommanArray.flowerImageArray[1]: 0,
//                       CommanArray.flowerImageArray[8]: 0,
//                       CommanArray.flowerImageArray[12]: 1,
//                       CommanArray.flowerImageArray[7]: 0
//                   ],
//                CommanArray.flowerNameArray[13]: [
//                       CommanArray.flowerImageArray[3]: 0,
//                       CommanArray.flowerImageArray[13]: 1,
//                       CommanArray.flowerImageArray[5]: 0,
//                       CommanArray.flowerImageArray[9]: 0
//                   ]
//            ]

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
