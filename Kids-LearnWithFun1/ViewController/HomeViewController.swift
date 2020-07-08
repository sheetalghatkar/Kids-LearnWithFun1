//
//  HomeViewController.swift
//  Kids-LearnWithFun
//
//  Created by sheetal shinde on 14/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class HomeViewController: UIViewController {
    @IBOutlet weak var bgScreen: UIImageView!
    @IBOutlet weak var imgVwWildAnimal: UIImageView!
    @IBOutlet weak var imgVwPetAnimal: UIImageView!
    @IBOutlet weak var imgVwBird: UIImageView!
    @IBOutlet weak var imgVwFlower: UIImageView!
    @IBOutlet weak var imgVwTest: UIImageView!


    @IBOutlet weak var imgVwBird1Bottom: UIImageView!
    @IBOutlet weak var imgVwBird2Bottom: UIImageView!
    @IBOutlet weak var imgVwWild1Bottom: UIImageView!
    @IBOutlet weak var imgVwWild2Bottom: UIImageView!
    @IBOutlet weak var imgVwWild3Bottom: UIImageView!

    var player = AVAudioPlayer()
    var bannerView: GADBannerView!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    //------------------------------------------------------------------------

    override func viewDidAppear(_ animated: Bool) {
        if appDelegate.IS_Sound_ON {
            playBackgroundMusic()
        } else {
            player.stop()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        player.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let birdGif1 = UIImage.gifImageWithName("bird1Gif")
        let birdGif2 = UIImage.gifImageWithName("bird2Gif")
        let wildGif1 = UIImage.gifImageWithName("TigerGif")
        let wildGif2 = UIImage.gifImageWithName("ElephantGif")
        let wildGif3 = UIImage.gifImageWithName("HorseGif")
    //    let testGif = UIImage.gifImageWithName("Test")

        self.imgVwBird1Bottom.image  = birdGif1
        self.imgVwBird2Bottom.image  = birdGif2
        self.imgVwWild1Bottom.image  = wildGif1
        self.imgVwWild2Bottom.image  = wildGif2
        self.imgVwWild3Bottom.image  = wildGif3
       // self.imgVwTest.image  = testGif

        let tapGestureRecognWildAnimal = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwWildAnimal.addGestureRecognizer(tapGestureRecognWildAnimal)
        imgVwWildAnimal.tag = 1

        let tapGestureRecognPetAnimal = UITapGestureRecognizer(
            target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwPetAnimal.addGestureRecognizer(tapGestureRecognPetAnimal)
        imgVwPetAnimal.tag = 2

        let tapGestureRecognBird = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwBird.addGestureRecognizer(tapGestureRecognBird)
        imgVwBird.tag = 3


        let tapGestureRecognFlower = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgVwFlower.addGestureRecognizer(tapGestureRecognFlower)
        imgVwFlower.tag = 4
        
        
        let tapGestureRecognTest = UITapGestureRecognizer(target: self, action: #selector(testImageTapped(tapGestureRecognizer:)))
        imgVwTest.addGestureRecognizer(tapGestureRecognTest)

        
        bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
       // bannerView.load(GADRequest())
//        Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
        
        
      //  if ScreenSize.SCREEN_MAX_LENGTH < 812.0 {
            self.imgVwWild3Bottom.isHidden = true
        //}
    }
    @objc func alarmAlertActivate(){
        UIView.animate(withDuration: 0.7) {
            self.imgVwTest.alpha = self.imgVwTest.alpha == 1.0 ? 0.0 : 1.0
        }
    }

    func addBannerViewToView(_ bannerView: GADBannerView) {
      bannerView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(bannerView)
      view.addConstraints(
        [NSLayoutConstraint(item: bannerView,
                            attribute: .bottom,
                            relatedBy: .equal,
                            toItem: bottomLayoutGuide,
                            attribute: .top,
                            multiplier: 1,
                            constant: 0),
         NSLayoutConstraint(item: bannerView,
                            attribute: .centerX,
                            relatedBy: .equal,
                            toItem: view,
                            attribute: .centerX,
                            multiplier: 1,
                            constant: 0)
        ])
     }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let setPictureVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImagesCollectionViewController") as! ImagesCollectionViewController
        if tapGestureRecognizer.view?.tag == 1 {
            setPictureVC.imageArray = CommanArray.wildAnimalImageArray
            setPictureVC.imageNameArray = CommanArray.wildAnimalNameArray
        }
        else if tapGestureRecognizer.view?.tag == 2 {
            setPictureVC.imageArray = CommanArray.domesticAnimalImageArray
            setPictureVC.imageNameArray = CommanArray.domesticAnimalNameArray
        }
        else if tapGestureRecognizer.view?.tag == 3 {
            setPictureVC.imageArray = CommanArray.birdImageArray
            setPictureVC.imageNameArray = CommanArray.birdNameArray
        }
        else if tapGestureRecognizer.view?.tag == 4 {
            setPictureVC.imageArray = CommanArray.flowerImageArray
            setPictureVC.imageNameArray = CommanArray.flowerNameArray
        }
        self.navigationController?.pushViewController(setPictureVC, animated: true)
    }
    
    @objc func testImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let setPictureVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
        self.navigationController?.pushViewController(setPictureVC, animated: true)
    }
    
    func playBackgroundMusic() {
        let path = Bundle.main.path(forResource: "mixaund-happy-day", ofType : "mp3")!
        let url = URL(fileURLWithPath : path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print ("There is an issue with this code!")
        }
    }
}

extension HomeViewController: GADBannerViewDelegate {
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
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
