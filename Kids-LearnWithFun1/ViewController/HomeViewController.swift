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

class HomeViewController: UIViewController, PayementForParentProtocol {
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

    @IBOutlet weak var btnSound: UIButton!
    @IBOutlet weak var btnNoAds: UIButton!
    @IBOutlet weak var btnSetting: UIButton!

    
    @IBOutlet weak var btnRateUs: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnContactUs: UIButton!

    @IBOutlet weak var viewParentSetting: UIView!
    @IBOutlet weak var viewtransperent: UIView!


    var player = AVAudioPlayer()
    var bannerView: GADBannerView!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let defaults = UserDefaults.standard
    var paymentDetailVC : PaymentDetailViewController?
    var circleViewwidth = ScreenSize.SCREEN_WIDTH * 0.95
    var showSetting =  false
    @IBOutlet weak var viewCircle: UIView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var xConstraint: NSLayoutConstraint!
    @IBOutlet weak var yConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var xTranViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var yTranViewConstraint: NSLayoutConstraint!

    //------------------------------------------------------------------------

    override func viewDidAppear(_ animated: Bool) {
        playBackgroundMusic()
    }
    override func viewWillDisappear(_ animated: Bool) {
        player.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        widthConstraint.constant = circleViewwidth
        xConstraint.constant = -(circleViewwidth/2)
        yConstraint.constant = -(circleViewwidth/2)
        viewCircle.layer.cornerRadius = circleViewwidth/2
        self.viewCircle.isHidden = true
        self.viewCircle.backgroundColor = UIColor.clear


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
        self.view.isMultipleTouchEnabled = false
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
        
        if defaults.bool(forKey:"PauseHomeSound") {
            btnSound.setBackgroundImage(UIImage(named: "Sound-Off_home.png"), for: .normal)
        } else {
            btnSound.setBackgroundImage(UIImage(named: "Sound-On_home.png"), for: .normal)
        }
        viewParentSetting.backgroundColor = UIColor.white
        viewParentSetting.layer.cornerRadius = (circleViewwidth/2)
        self.viewParentSetting.alpha = 0.7
        self.viewtransperent.isHidden = true

        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.clickTransperentView (_:)))
        self.viewtransperent.addGestureRecognizer(gesture)
        
        
        xTranViewConstraint.constant = -(circleViewwidth)
        yTranViewConstraint.constant = -(circleViewwidth)
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
            if defaults.bool(forKey:"PauseHomeSound") {
                btnSound.setBackgroundImage(UIImage(named: "Sound-Off_home.png"), for: .normal)
                player.stop()
            } else {
                btnSound.setBackgroundImage(UIImage(named: "Sound-On_home.png"), for: .normal)
                player.play()
            }

        } catch {
            print ("There is an issue with this code!")
        }
    }
    @IBAction func funcSound_ON_OFF(_ sender: Any) {
        if defaults.bool(forKey:"PauseHomeSound") {
            defaults.set(false, forKey: "PauseHomeSound")
            btnSound.setBackgroundImage(UIImage(named: "Sound-On_home.png"), for: .normal)
            player.play()
        } else {
            defaults.set(true, forKey: "PauseHomeSound")
            btnSound.setBackgroundImage(UIImage(named: "Sound-Off_home.png"), for: .normal)
            player.stop()
        }
    }
    
    @IBAction func funcSetting(_ sender: Any) {
        if !showSetting {
            self.showSetting = true
            self.viewtransperent.isHidden = false
            UIView.animate(withDuration: 0.50, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
                //Set x position what ever you want
                self.viewParentSetting.frame = CGRect(x: -((self.circleViewwidth)/2), y: -((self.circleViewwidth)/2), width: self.viewParentSetting.frame.size.width, height: self.viewParentSetting.frame.size.height)

            }, completion: nil)
            self.viewtransperent.isHidden = false
            UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseOut, animations: {
                self.rotateAnimation(imageView: self.viewCircle, getToValue: (CGFloat.pi * 2))
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.viewCircle.isHidden = false
                }
            }, completion: nil)
        } else {
            funcCloseSetting()
        }
    }
    func funcCloseSetting() {
        self.showSetting = false
        UIView.animate(withDuration: 0.2, delay: 0.2, options: .curveEaseIn, animations: {
            self.rotateAnimation(imageView: self.viewCircle, getToValue: -(CGFloat.pi * 2))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
                self.viewCircle.isHidden = true
                self.viewtransperent.isHidden = true
            }
        }, completion: nil)
        
        UIView.animate(withDuration: 0.50, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            //Set x position what ever you want
            self.viewParentSetting.frame = CGRect(x: -(self.circleViewwidth), y: -(self.circleViewwidth), width: self.viewParentSetting.frame.size.width, height: self.viewParentSetting.frame.size.height)
        }, completion: nil)
    }
    @IBAction func funcRateUs(_ sender: Any) {
    }
    @IBAction func funcShare(_ sender: Any) {
    }
    @IBAction func funcContactUs(_ sender: Any) {
    }
    @objc func clickTransperentView(_ sender:UITapGestureRecognizer){
        funcCloseSetting()
    }

    func rotateAnimation(imageView:UIView,duration: CFTimeInterval = 1.5, getToValue : CGFloat) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = getToValue
        rotateAnimation.duration = duration
        imageView.layer.add(rotateAnimation, forKey: nil)
    }

    //Start Payment flow
    
    @IBAction func funcNoAds(_ sender: Any) {
        showPaymentScreen()

//        print("@@@@@@",ScreenSize.SCREEN_WIDTH)
//        rotateAnimation(imageView: viewCircle)

//        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut, animations: {
//            self.imgViewRing.alpha = 1.0
//        }, completion: nil)

       // showPaymentScreen()
        /*let imgShareApp = UIImage(named: "map_green_color")
        let imgRatingApp = UIImage(named: "map_hashtag_gray")
        let imgContactUs = UIImage(name
         d: "map_hashtag_blue")

        
        imgViewRing.backgroundColor = UIColor.red
        imgViewRing.frame = CGRect(x: 0, y: 0, width: 150.0, height: 150.0)
        imgViewRing.layer.cornerRadius = 75.0
        imgViewRing.center = CGPoint(x: self.view.frame.size.width/2.0, y: self.view.frame.size.height/2.0)
        rotateAnimation(imageView: imgViewRing)
        self.view.addSubview(imgViewRing)
        
        let imgViewShareApp = UIImageView(frame: CGRect(x: 80, y: 60, width: 25.0, height: 25.0))
        imgViewShareApp.image = imgShareApp
        imgViewRing.addSubview(imgViewShareApp)
        
        
        let imgViewimgRatingApp = UIImageView(frame: CGRect(x: 85, y: 75, width: 25.0, height: 25.0))
        imgViewimgRatingApp.image = imgRatingApp
        imgViewRing.addSubview(imgViewimgRatingApp)

        
        let imgViewContactUs = UIImageView(frame: CGRect(x: 80, y: 100, width: 25.0, height: 25.0))
        imgViewContactUs.image = imgContactUs
        imgViewRing.addSubview(imgViewContactUs)*/

//        rotateAnimation(imageView: imgViewRing)

    }

    //Delegate method implementation
    func showPaymentCostScreen() {
        paymentDetailVC?.view.removeFromSuperview()
        let PaymentCostVC = PaymentCostController(nibName: "PaymentCostController", bundle: nil)
        self.navigationController?.pushViewController(PaymentCostVC, animated: true)
    }

    func showPaymentScreen(){
        paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
        paymentDetailVC?.view.frame = self.view.bounds
        paymentDetailVC?.delegatePayementForParent = self
        self.view.addSubview(paymentDetailVC?.view ?? UIView())
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
extension HomeViewController : FloatingActionButtonProtocol {
    
    func floatingActionButtonProcessDidStart() {
    }
    func floatingActionButtonProcessDidCompleteSuccessfully(refreshMapScreen: Bool,message: String, statusCode: Int?){
    }
    func floatingActionButtonDidFail(errorMessage: String, statusCode: Int?) {
    }
}
