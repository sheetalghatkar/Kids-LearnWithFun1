//
//  HomeViewController.swift
//  Kids-LearnWithFun
//
//  Created by sheetal shinde on 14/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//    /*pod 'Google-Mobile-Ads-SDK'*/
/*pod 'SwiftyStoreKit'*/



import UIKit
import AVFoundation
import GoogleMobileAds
import AudioToolbox
import MessageUI

class HomeViewController: UIViewController, PayementForParentProtocol,MFMailComposeViewControllerDelegate {
    @IBOutlet weak var bgScreen: UIImageView!
    @IBOutlet weak var imgVwWildAnimal: UIImageView!
    @IBOutlet weak var imgVwPetAnimal: UIImageView!
    @IBOutlet weak var imgVwBird: UIImageView!
    @IBOutlet weak var imgVwFlower: UIImageView!
    @IBOutlet weak var imgVwTest: UIImageView!
    
    
    @IBOutlet weak var lblWildAnimal: UILabel!
    @IBOutlet weak var lblPetAnimal: UILabel!
    @IBOutlet weak var lblBirdAnimal: UILabel!
    @IBOutlet weak var lblFlowerAnimal: UILabel!
    @IBOutlet weak var lblTestAnimal: UILabel!


    @IBOutlet weak var imgVwBird1Bottom: UIImageView!
    @IBOutlet weak var imgVwBird2Bottom: UIImageView!
    @IBOutlet weak var imgVwWild1Bottom: UIImageView!
    @IBOutlet weak var imgVwWild2Bottom: UIImageView!
    @IBOutlet weak var imgVwWild3Bottom: UIImageView!

    @IBOutlet weak var btnSound: UIButton!
    @IBOutlet weak var btnNoAds: UIButton!
    @IBOutlet weak var btnSetting: UIButton!
    @IBOutlet weak var btnCancelSubscription: UIButton!
    @IBOutlet weak var widthWildAnimal: NSLayoutConstraint!
    @IBOutlet weak var  WidthSound: NSLayoutConstraint!

    
    var fontImageTitleLbl = UIFont(name: "ChalkboardSE-Bold", size: 24)


    @IBOutlet weak var floaty : Floaty!
        {
        didSet {
            floaty.buttonImage = UIImage(named: "map_hashtag_gray")
        }
    }
    @IBOutlet weak var viewParentSetting: UIView!
    @IBOutlet weak var viewtransperent: UIView!


    var player = AVAudioPlayer()
    var bannerView: GADBannerView!
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let defaults = UserDefaults.standard
    var paymentDetailVC : PaymentDetailViewController?
    var circleViewwidth = ScreenSize.SCREEN_WIDTH * 1.08
    var showSetting =  false
    
    let rateUsImg = UIImage(named: "RateUs.png")
    let shareAppImg = UIImage(named: "ShareApp.png")
//    let contactUsImg = UIImage(named: "ContactUs.png")

    //------------------------------------------------------------------------

    override func viewWillAppear(_ animated: Bool) {
        playBackgroundMusic()
        showHideAdsButton()
    }
    override func viewWillDisappear(_ animated: Bool) {
        player.stop()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgVwWildAnimal.isExclusiveTouch = true
        self.imgVwBird.isExclusiveTouch = true
        self.imgVwFlower.isExclusiveTouch = true
        self.imgVwPetAnimal.isExclusiveTouch = true
        self.imgVwTest.isExclusiveTouch = true

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
        bannerView.adUnitID = CommanArray.Banner_AdUnitId
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
        viewParentSetting.backgroundColor = UIColor.black
        viewParentSetting.alpha = 0.4

        self.viewtransperent.isHidden = true
        self.viewParentSetting.isHidden = true

        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.clickTransperentView (_:)))
        self.viewParentSetting.addGestureRecognizer(gesture)
        self.floaty.floatingActionButtonDelegate = self
        self.floaty.addItem(icon: rateUsImg, handler: {_ in
            self.floaty.close()
            // 1.
            var components = URLComponents(url: CommanArray.app_AppStoreLink!, resolvingAgainstBaseURL: false)

            // 2.
            components?.queryItems = [
              URLQueryItem(name: "action", value: "write-review")
            ]

            // 3.
            guard let writeReviewURL = components?.url else {
              return
            }

            // 4.
            UIApplication.shared.open(writeReviewURL)
        })
        self.floaty.addItem(icon: shareAppImg, handler: {_ in
            let activityViewController = UIActivityViewController(
                activityItems: [CommanArray.app_AppStoreLink!],
              applicationActivities: nil)

            // 2.
            self.present(activityViewController, animated: true, completion: nil)
            self.floaty.close()
        })
//        self.floaty.addItem(icon: contactUsImg, handler: { [self]_ in
//            let mailComposeViewController = configureMailComposer()
//              if MFMailComposeViewController.canSendMail(){
//                  self.present(mailComposeViewController, animated: true, completion: nil)
//              }else{
//                  print("Can't send email")
//                let alert = UIAlertController(title: "", message: "Please setup mail account.", preferredStyle: UIAlertController.Style.alert)
//
//                // add an action (button)
//                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//
//                // show the alert
//                self.present(alert, animated: true, completion: nil)
//
//              }
//            self.floaty.close()
//        })
        floaty.items[0].title = "Rate & Review"
        floaty.items[1].title = "Share App"
//        floaty.items[2].title = "Contact Us"
        
        addWaveBackground(to :viewtransperent)
        //-----------------------------------
        if self.defaults.bool(forKey: "IsPrimeUser") {
            handlingdForPrimeIser()
        }
        
        if !(UIDevice.current.hasNotch) {
            self.WidthSound.constant = 36
            lblWildAnimal.font = fontImageTitleLbl
            lblPetAnimal.font = fontImageTitleLbl
            lblBirdAnimal.font = fontImageTitleLbl
            lblFlowerAnimal.font = fontImageTitleLbl
            lblTestAnimal.font = fontImageTitleLbl
            widthWildAnimal.constant = 100
            imgVwWildAnimal.layer.cornerRadius = (widthWildAnimal.constant)/2
            imgVwPetAnimal.layer.cornerRadius = (widthWildAnimal.constant)/2
            imgVwBird.layer.cornerRadius = (widthWildAnimal.constant)/2
            imgVwFlower.layer.cornerRadius = (widthWildAnimal.constant)/2
            imgVwTest.layer.cornerRadius = (widthWildAnimal.constant)/2
        }
    }
    
    func showHideAdsButton() {
        if defaults.bool(forKey:"IsPrimeUser") {
            if let _ = btnCancelSubscription, let _ = btnCancelSubscription {
                self.btnCancelSubscription.isHidden = false
                self.btnNoAds.isHidden = true
            }
        } else {
            if let _ = btnCancelSubscription, let _ = btnCancelSubscription {
                self.btnCancelSubscription.isHidden = true
                self.btnNoAds.isHidden = false
            }
        }
    }
    
    func handlingdForPrimeIser() {
      let getPurchaseDetails = self.defaults.value(forKey: "PurchaseDetails") as? [String:String]
      if getPurchaseDetails != nil {
        if ((getPurchaseDetails!.count != 0) && ((getPurchaseDetails!["CancellationDate"])!.count) != 0) {
            defaults.set(false, forKey: "IsPrimeUser")
            showHideAdsButton()
        } else if ((getPurchaseDetails!.count != 0) && (getPurchaseDetails!["ProductId"] == CommanArray.productId_Year_Non_Recurring) && ((getPurchaseDetails!["ExpirationDate"])!.count) != 0) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let getExpireDate = formatter.date(from: (getPurchaseDetails?["ExpirationDate"]!)! as String)!
            let getRemainingDays = daysRemainingOnSubscription(getExpireDate: getExpireDate)
            if getRemainingDays >= 0 {
                if getRemainingDays == 0 {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        let alert = UIAlertController(title: "", message: "Your yearly subscription is expiring today.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else if getRemainingDays < 6 {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        let alert = UIAlertController(title: "", message: "Your yearly subscription will expire in \(getRemainingDays) day(s).", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } else {
                defaults.set(false, forKey: "IsPrimeUser")
            }
            showHideAdsButton()
        } else if ((getPurchaseDetails!.count != 0) && (getPurchaseDetails!["ProductId"] == CommanArray.productId_Month_Non_Recurring) && ((getPurchaseDetails!["ExpirationDate"])!.count) != 0) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let getExpireDate = formatter.date(from: getPurchaseDetails!["ExpirationDate"]! as String)!
            let getRemainingDays = daysRemainingOnSubscription(getExpireDate: getExpireDate)
            if getRemainingDays >= 0 {
                if getRemainingDays == 0 {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        let alert = UIAlertController(title: "", message: "Your monthly subscription is expiring today.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                } else if getRemainingDays < 6 {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        let alert = UIAlertController(title: "", message: "Your monthly subscription will expire in \(getRemainingDays) day(s).", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } else {
                defaults.set(false, forKey: "IsPrimeUser")
            }
            showHideAdsButton()
        } else if((getPurchaseDetails!.count != 0) && ((getPurchaseDetails!["ProductId"] == CommanArray.productId_Year_Auto_Recurring)||(getPurchaseDetails!["ProductId"] == CommanArray.productId_Month_Auto_Recurring)) && ((getPurchaseDetails!["SubscriptionExpirationDate"])!.count) != 0) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let getExpireDate = formatter.date(from: getPurchaseDetails!["SubscriptionExpirationDate"]! as String)!
            let getRemainingDays = daysRemainingOnSubscription(getExpireDate: getExpireDate)
            if getRemainingDays >= 0 {
                if ((getRemainingDays == 1)||(getRemainingDays == 2)) {
                    if isRefreshRequired() {
                        defaults.setValue(Date(), forKey: "RefreshedDate")
                        if (getPurchaseDetails!["ProductId"] == CommanArray.productId_Year_Auto_Recurring) {
                            let alert = UIAlertController(title: "", message: "Your yearly subscription will renew in \(getRemainingDays) day(s).", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        } else if (getPurchaseDetails!["ProductId"] == CommanArray.productId_Month_Auto_Recurring) {
                            let alert = UIAlertController(title: "", message: "Your monthly subscription will renew in \(getRemainingDays) day(s).", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                }
                showHideAdsButton()
            } else {
                var productIdAutoRenew = ""
                var productPriceAutoRenew = ""
                if (getPurchaseDetails!["ProductId"] == CommanArray.productId_Month_Auto_Recurring) {
                    productIdAutoRenew = CommanArray.productId_Month_Auto_Recurring
                    productPriceAutoRenew = "$0.49"
                } else {
                    productIdAutoRenew = CommanArray.productId_Year_Auto_Recurring
                    productPriceAutoRenew = "$3.99"
                }
                let appleValidator = AppleReceiptValidator(service: CommanArray.environment, sharedSecret: CommanArray.secretKey)
                SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
                    switch result {
                    case .success(let receipt):
                        let purchaseResult = SwiftyStoreKit.verifySubscription(
                            ofType: .autoRenewable,
                            productId: productIdAutoRenew,
                            inReceipt: receipt)
                            
                        switch purchaseResult {
                        case .purchased(let expiryDate, let items):
                            let getReceiptItem = items[0] as ReceiptItem
                            let formatter = DateFormatter()
                            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                            let pucrhaseDateString = formatter.string(from: getReceiptItem.purchaseDate as Date)
                            let originalPurchasedDateString = formatter.string(from: getReceiptItem.originalPurchaseDate as Date)
                            var subscriptionExpirationDateString = ""
                            if getReceiptItem.subscriptionExpirationDate != nil {
                                subscriptionExpirationDateString = formatter.string(from: getReceiptItem.subscriptionExpirationDate! as Date)
                            }
                            var expirationDateString = ""
                            expirationDateString = formatter.string(from: expiryDate as Date)

                            var cancelDateString = ""
                            if getReceiptItem.cancellationDate != nil {
                                cancelDateString = formatter.string(from: getReceiptItem.cancellationDate! as Date)
                            }
                            let dictPurchaseDetail = [
                                "ProductId": productIdAutoRenew,
                                "OriginalPurchasedDate": originalPurchasedDateString,
                                "PurchasedDate": pucrhaseDateString,
                                "ExpirationDate": expirationDateString,
                                "CancellationDate": cancelDateString,
                                "SubscriptionExpirationDate": subscriptionExpirationDateString,
                                "SubscriptionPrice":productPriceAutoRenew
                            ] as [String:Any]
                            self.defaults.set(dictPurchaseDetail, forKey: "PurchaseDetails")
                            self.defaults.set(true, forKey: "IsPrimeUser")
                        case .expired( _,  _):
                            self.defaults.set(false, forKey: "IsPrimeUser")
                        case .notPurchased:
                            self.defaults.set(false, forKey: "IsPrimeUser")
                        }
                        self.showHideAdsButton()
                    case .error(let error):
                        print("Receipt verification failed: \(error)")
                    }
                }
            }
        }
      }
    }
    func isRefreshRequired() -> Bool {

        guard let lastRefreshDate = defaults.object(forKey: "RefreshedDate") as? Date else {
            return true
        }

        if let diff = Calendar.current.dateComponents([.hour], from: lastRefreshDate, to: Date()).hour, diff > 24 {
            return true
        } else {
            return false
        }
    }

    
    func daysRemainingOnSubscription(getExpireDate: Date) -> Int {

        return Calendar.current.dateComponents([.day], from: Date(), to: getExpireDate).day!
    }
//
//    public static func getExpiryDateString() -> String {
//      let remaining = daysRemainingOnSubscription()
//      if remaining > 0, let expiryDate = UserSettings.shared.expirationDate {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        return "Subscribed! \nExpires: \(dateFormatter.string(from: expiryDate)) (\(remaining) Days)"
//      }
//      return "Not Subscribed"
//    }

    func addWaveBackground(to view: UIView){
          let multipler = CGFloat(0.07)  //0.13
        
          let leftDrop:CGFloat = 0.4 + multipler
          let leftInflexionX: CGFloat = 0.4 + multipler
          let leftInflexionY: CGFloat = 0.47 + multipler

          let rightDrop: CGFloat = 0.3 +  multipler
          let rightInflexionX: CGFloat = 0.6  +  multipler
          let rightInflexionY: CGFloat = 0.22 + multipler

          let backView = UIView(frame: view.frame)
          backView.backgroundColor = .clear
          view.addSubview(backView)
          let backLayer = CAShapeLayer()
          let path = UIBezierPath()
          path.move(to: CGPoint(x: 0, y: 0))
          path.addLine(to: CGPoint(x:0, y: view.frame.height * leftDrop))
          path.addCurve(to: CGPoint(x:225, y: view.frame.height * rightDrop),
                        controlPoint1: CGPoint(x: view.frame.width * leftInflexionX, y: view.frame.height * leftInflexionY),
                        controlPoint2: CGPoint(x: view.frame.width * rightInflexionX, y: view.frame.height * rightInflexionY+30))
          path.addLine(to: CGPoint(x:225, y: 0))
          path.close()
          backLayer.fillColor = CommanArray.settingBgColor.cgColor //UIColor.blue.cgColor
          backLayer.path = path.cgPath
          backView.layer.addSublayer(backLayer)
       }

    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["sheetal22july@gmail.com"])
        mailComposeVC.setSubject("sdasd asasd")
        mailComposeVC.setMessageBody("sadsaDASd asDasdsa", isHTML: false)
        return mailComposeVC
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["support@yoursite.com"])
            mail.setMessageBody("Feedback - Learn Nature App", isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
        }
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
    
    @objc func clickTransperentView(_ sender:UITapGestureRecognizer){
        self.viewtransperent.isHidden = true
        self.viewParentSetting.isHidden = true
    }

    func rotateAnimation(imageView:UIView,duration: CFTimeInterval = 1.5, getToValue : CGFloat) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = getToValue
        rotateAnimation.duration = duration
        imageView.layer.add(rotateAnimation, forKey: nil)
    }

    //Start Payment flow
    
    @IBAction func funcCancelSubscription(_ sender: Any) {
        paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
        paymentDetailVC?.showSubscriptionScreen = true
        showPaymentScreen()
    }

    
    @IBAction func funcNoAds(_ sender: Any) {
        paymentDetailVC = PaymentDetailViewController(nibName: "PaymentDetailViewController", bundle: nil)
        paymentDetailVC?.showSubscriptionScreen = false
        showPaymentScreen()
    }

    //Delegate method implementation
    func showPaymentCostScreen() {
        paymentDetailVC?.view.removeFromSuperview()
        let paymentCostVC = PaymentCostController(nibName: "PaymentCostController", bundle: nil)
        self.navigationController?.pushViewController(paymentCostVC, animated: true)
    }
    
    func showSubscriptionDetailScreen() {
        paymentDetailVC?.view.removeFromSuperview()
        let paymenSubscriptionVC = SubscriptionDetailsController(nibName: "SubscriptionDetailsController", bundle: nil)
        self.navigationController?.pushViewController(paymenSubscriptionVC, animated: true)
    }

    func showPaymentScreen(){
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
    
    func floatingActionOpen() {
        UIView.animate(withDuration: 0.5, animations: {
            self.btnSetting.transform = CGAffineTransform(rotationAngle: .pi * 0.999)
        })
        viewtransperent.isHidden = false
        viewParentSetting.isHidden = false
    }
    func floatingActionClose() {
        UIView.animate(withDuration: 0.5, animations: {
            self.btnSetting.transform = CGAffineTransform.identity
        })
        viewtransperent.isHidden = true
        viewParentSetting.isHidden = true
    }
}


extension HomeViewController {
    func verifyReciptOfPayment(getProductId : String, getProductPrice : String) {
            let appleValidator = AppleReceiptValidator(service: CommanArray.environment, sharedSecret: CommanArray.secretKey)
            SwiftyStoreKit.verifyReceipt(using: appleValidator) { result in
                switch result {
                case .success(let receipt):
                    let purchaseResult = SwiftyStoreKit.verifySubscription(
                        ofType: .autoRenewable,
                        productId: getProductId,
                        inReceipt: receipt)
                        
                    switch purchaseResult {
                    case .purchased(let expiryDate, let items):
                        let getReceiptItem = items[0] as ReceiptItem
                        let formatter = DateFormatter()
                        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                        let pucrhaseDateString = formatter.string(from: getReceiptItem.purchaseDate as Date)
                        let originalPurchasedDateString = formatter.string(from: getReceiptItem.originalPurchaseDate as Date)
                        var subscriptionExpirationDateString = ""
                        if getReceiptItem.subscriptionExpirationDate != nil {
                            subscriptionExpirationDateString = formatter.string(from: getReceiptItem.subscriptionExpirationDate! as Date)
                        }
                        var expirationDateString = ""
                        expirationDateString = formatter.string(from: expiryDate as Date)

                        var cancelDateString = ""
                        if getReceiptItem.cancellationDate != nil {
                            cancelDateString = formatter.string(from: getReceiptItem.cancellationDate! as Date)
                        }
                        let dictPurchaseDetail = [
                            "ProductId": getProductId,
                            "OriginalPurchasedDate": originalPurchasedDateString,
                            "PurchasedDate": pucrhaseDateString,
                            "ExpirationDate": expirationDateString,
                            "CancellationDate": cancelDateString,
                            "SubscriptionExpirationDate": subscriptionExpirationDateString,
                            "SubscriptionPrice":getProductPrice
                        ] as [String:Any]
                        self.defaults.set(dictPurchaseDetail, forKey: "PurchaseDetails")
                        self.defaults.set(true, forKey: "IsPrimeUser")
                    case .expired(let expiryDate, let items):
                        print("\(getProductId) is expired since \(expiryDate)\n\(items)\n")
                        self.defaults.set(false, forKey: "IsPrimeUser")
                    case .notPurchased:
                        print("The user has never purchased \(getProductId)")
                        self.defaults.set(false, forKey: "IsPrimeUser")
                        
                    }
                case .error(let error):
                    print("Receipt verification failed: \(error)")
                }
            }
        }
}
