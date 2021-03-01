//
//  TestViewController.swift
//  Kids-LearnWithFun1
//
//  Created by sheetal shinde on 24/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AudioToolbox

class TestViewController: UIViewController,PayementForParentProtocol {
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var imgVwTest1: UIImageView!
    @IBOutlet weak var imgVwTest2: UIImageView!
    @IBOutlet weak var imgVwTest3: UIImageView!
    @IBOutlet weak var imgVwTest4: UIImageView!
    @IBOutlet weak var btnNoAds: UIButton!
    @IBOutlet weak var imgViewLock2: UIImageView!
    @IBOutlet weak var imgViewLock3: UIImageView!
    @IBOutlet weak var imgViewLock4: UIImageView!
    
    
    @IBOutlet weak var  heightHome: NSLayoutConstraint!
    @IBOutlet weak var  heightQuestionMarkImg: NSLayoutConstraint!


    @IBOutlet weak var lblWildAnimal: UILabel!
    @IBOutlet weak var lblPetAnimal: UILabel!
    @IBOutlet weak var lblBirdAnimal: UILabel!
    @IBOutlet weak var lblFlowerAnimal: UILabel!
    @IBOutlet weak var widthWildAnimal: NSLayoutConstraint!

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var paymentDetailVC : PaymentDetailViewController?
    var bannerView: GADBannerView!
    let defaults = UserDefaults.standard
    var fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 24)
    var timer: Timer?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgVwTest1.isExclusiveTouch = true
        self.imgVwTest2.isExclusiveTouch = true
        self.imgVwTest3.isExclusiveTouch = true
        self.imgVwTest4.isExclusiveTouch = true

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
        
        self.view.isMultipleTouchEnabled = false
        
        
        if !(defaults.bool(forKey:"IsPrimeUser")) {
            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            addBannerViewToView(bannerView)
            bannerView.adUnitID = CommanArray.Banner_AdUnitId
            bannerView.rootViewController = self
            bannerView.delegate = self
            if Reachability.isConnectedToNetwork() {
                bannerView.load(GADRequest())
            } else {
                let alert = UIAlertController(title: "", message: "No Internet Connection.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
                    if self.timer == nil {
                        self.timer = Timer.scheduledTimer(timeInterval: CommanArray.timerForAds, target: self, selector: #selector(self.alarmToLoadBannerAds), userInfo: nil, repeats: true)
                    }
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
        if !(UIDevice.current.hasNotch) {
            heightHome.constant = 38
            widthWildAnimal.constant = 100
            heightQuestionMarkImg.constant = 220
            lblWildAnimal.font = fontImageTitleLbl
            lblPetAnimal.font = fontImageTitleLbl
            lblBirdAnimal.font = fontImageTitleLbl
            lblFlowerAnimal.font = fontImageTitleLbl
          /*  imgViewLock2.layer.cornerRadius = ((heightHome.constant)+10)/2
            imgViewLock3.layer.cornerRadius = ((heightHome.constant)+10)/2
            imgViewLock4.layer.cornerRadius = ((heightHome.constant)+10)/2*/
        }
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 28)
            heightHome.constant = 58
            widthWildAnimal.constant = 150
            heightQuestionMarkImg.constant = 250

            if UIScreen.main.bounds.height > 1100 {
                fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 42)
                heightHome.constant = 65
                widthWildAnimal.constant = 200
                heightQuestionMarkImg.constant = 300
            }
            
            lblWildAnimal.font = fontImageTitleLbl
            lblPetAnimal.font = fontImageTitleLbl
            lblBirdAnimal.font = fontImageTitleLbl
            lblFlowerAnimal.font = fontImageTitleLbl
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if defaults.bool(forKey:"IsPrimeUser") {
            if let _ = btnNoAds{
                self.btnNoAds.isHidden = true
                if bannerView != nil {
                    bannerView.removeFromSuperview()
                }
            }
        } else {
            if let _ = btnNoAds {
                self.btnNoAds.isHidden = false
            }
        }
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
            self.navigationController?.pushViewController(setTestSolveVC, animated: true)
        }
        else if tapGestureRecognizer.view?.tag == 2 {
            let solveTestArray = [
              [
                 CommanArray.domesticAnimalNameArray[2]+"-"+"0",
                 CommanArray.domesticAnimalNameArray[9]+"-"+"0",
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
                  CommanArray.domesticAnimalNameArray[8]+"-"+"0",
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
                  CommanArray.domesticAnimalNameArray[2]+"-"+"0",
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
            self.navigationController?.pushViewController(setTestSolveVC, animated: true)
        }
        else if tapGestureRecognizer.view?.tag == 3 {
            let solveTestArray = [
                [
                   CommanArray.birdNameArray[2]+"-"+"0",
                   CommanArray.birdNameArray[10]+"-"+"0",
                   CommanArray.birdNameArray[0]+"-"+"1",
                   CommanArray.birdNameArray[11]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[8]+"-"+"0",
                   CommanArray.birdNameArray[1]+"-"+"1",
                   CommanArray.birdNameArray[5]+"-"+"0",
                   CommanArray.birdNameArray[9]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[2]+"-"+"1",
                   CommanArray.birdNameArray[12]+"-"+"0",
                   CommanArray.birdNameArray[7]+"-"+"0",
                   CommanArray.birdNameArray[10]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[9]+"-"+"0",
                   CommanArray.birdNameArray[6]+"-"+"0",
                   CommanArray.birdNameArray[5]+"-"+"0",
                   CommanArray.birdNameArray[3]+"-"+"1"
                ],
                [
                   CommanArray.birdNameArray[8]+"-"+"0",
                   CommanArray.birdNameArray[4]+"-"+"1",
                   CommanArray.birdNameArray[7]+"-"+"0",
                   CommanArray.birdNameArray[11]+"-"+"0"
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
                   CommanArray.birdNameArray[2]+"-"+"0"
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
                   CommanArray.birdNameArray[4]+"-"+"0",
                   CommanArray.birdNameArray[12]+"-"+"0"
                ],
                [
                   CommanArray.birdNameArray[3]+"-"+"0",
                   CommanArray.birdNameArray[10]+"-"+"1",
                   CommanArray.birdNameArray[2]+"-"+"0",
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
            self.navigationController?.pushViewController(setTestSolveVC, animated: true)
        }
        else if tapGestureRecognizer.view?.tag == 4 {
            let solveTestArray = [
                  [
                       CommanArray.flowerNameArray[2]+"-"+"0",
                       CommanArray.flowerNameArray[10]+"-"+"0",
                       CommanArray.flowerNameArray[0]+"-"+"1",
                       CommanArray.flowerNameArray[13]+"-"+"0"
                 ],
                 [
                       CommanArray.flowerNameArray[11]+"-"+"0",
                       CommanArray.flowerNameArray[1]+"-"+"1",
                       CommanArray.flowerNameArray[12]+"-"+"0",
                       CommanArray.flowerNameArray[9]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[2]+"-"+"1",
                       CommanArray.flowerNameArray[0]+"-"+"0",
                       CommanArray.flowerNameArray[7]+"-"+"0",
                       CommanArray.flowerNameArray[10]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[13]+"-"+"0",
                       CommanArray.flowerNameArray[6]+"-"+"0",
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
                       CommanArray.flowerNameArray[11]+"-"+"0"
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
                       CommanArray.flowerNameArray[6]+"-"+"0",
                       CommanArray.flowerNameArray[5]+"-"+"0",
                       CommanArray.flowerNameArray[8]+"-"+"1"
                   ],
                 [
                       CommanArray.flowerNameArray[12]+"-"+"0",
                       CommanArray.flowerNameArray[9]+"-"+"1",
                       CommanArray.flowerNameArray[13]+"-"+"0",
                       CommanArray.flowerNameArray[2]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[6]+"-"+"0",
                       CommanArray.flowerNameArray[10]+"-"+"1",
                       CommanArray.flowerNameArray[4]+"-"+"0",
                       CommanArray.flowerNameArray[1]+"-"+"0"
                   ],
                 [
                       CommanArray.flowerNameArray[11]+"-"+"1",
                       CommanArray.flowerNameArray[5]+"-"+"0",
                       CommanArray.flowerNameArray[0]+"-"+"0",
                       CommanArray.flowerNameArray[8]+"-"+"0"
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
                       CommanArray.flowerNameArray[4]+"-"+"0",
                       CommanArray.flowerNameArray[9]+"-"+"0"
                   ]
            ]
            setTestSolveVC.showOptionsArray = solveTestArray
            setTestSolveVC.getImageNameArray = CommanArray.flowerNameArray
            self.navigationController?.pushViewController(setTestSolveVC, animated: true)
        }
    }
   // MARK: - User defined Functions
    
    @objc func alarmToLoadBannerAds(){
        print("Inside alarmToLoadBannerAds")
        if Reachability.isConnectedToNetwork() {
            if bannerView != nil {
                print("Inside Load bannerView")
                bannerView.load(GADRequest())
            }
        }
    }

    //Start Payment flow
    @IBAction func funcNoAds(_ sender: Any) {
        showPaymentScreen()
    }
    func stopTimer() {
        print("Inside stopTimer")
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }

    //Delegate method implementation
    func showPaymentCostScreen() {
        paymentDetailVC?.view.removeFromSuperview()
        let PaymentCostVC = PaymentCostController(nibName: "PaymentCostController", bundle: nil)
        self.navigationController?.pushViewController(PaymentCostVC, animated: true)
    }
    func showSubscriptionDetailScreen() {
    }

    func showPaymentScreen(){
        paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
        paymentDetailVC?.view.frame = self.view.bounds
        paymentDetailVC?.delegatePayementForParent = self
        self.view.addSubview(paymentDetailVC?.view ?? UIView())
    }
    
    func appstoreRateAndReview() {
    }
    
    func shareApp() {
        
    }

    @IBAction func funcGoToTestHome(_ sender: Any) {
        stopTimer()
        navigationController?.popViewController(animated: true)
    }
}

extension TestViewController: GADBannerViewDelegate {
    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
        if #available(iOS 11.0, *) {
          // In iOS 11, we need to constrain the view to the safe area.
          positionBannerViewFullWidthAtBottomOfSafeArea(bannerView)
        }
        else {
          // In lower iOS versions, safe area is not available so we use
          // bottom layout guide and view edges.
          positionBannerViewFullWidthAtBottomOfView(bannerView)
        }
     }

    func positionBannerViewFullWidthAtBottomOfSafeArea(_ bannerView: UIView) {
      // Position the banner. Stick it to the bottom of the Safe Area.
      // Make it constrained to the edges of the safe area.
      let guide = view.safeAreaLayoutGuide
      NSLayoutConstraint.activate([
        guide.leftAnchor.constraint(equalTo: bannerView.leftAnchor),
        guide.rightAnchor.constraint(equalTo: bannerView.rightAnchor),
        guide.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
      ])
    }

    func positionBannerViewFullWidthAtBottomOfView(_ bannerView: UIView) {
      view.addConstraint(NSLayoutConstraint(item: bannerView,
                                            attribute: .leading,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .leading,
                                            multiplier: 1,
                                            constant: 0))
      view.addConstraint(NSLayoutConstraint(item: bannerView,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: view,
                                            attribute: .trailing,
                                            multiplier: 1,
                                            constant: 0))
      view.addConstraint(NSLayoutConstraint(item: bannerView,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: bottomLayoutGuide,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: 0))
    }

    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
          if let visibleViewCtrl = UIApplication.shared.keyWindow?.visibleViewController {
              if(visibleViewCtrl.isKind(of: TestViewController.self)){
                  print("adViewDidReceiveAd Success")
                  if timer == nil {
                      timer = Timer.scheduledTimer(timeInterval: CommanArray.timerForAds, target: self, selector: #selector(self.alarmToLoadBannerAds), userInfo: nil, repeats: true)
                  }
              }
          }
      }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
        didFailToReceiveAdWithError error: GADRequestError) {
      print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
    }
}
