//
//  TestSolveViewController.swift
//  Kids-LearnWithFun1
//
//  Created by sheetal shinde on 28/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class TestSolveViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,TestSolveCollectionCellProtocol,PayementForParentProtocol {
    @IBOutlet weak var btnSound: UIButton!
    @IBOutlet weak var collectionViewCard: UICollectionView!
    @IBOutlet weak var btnForward: UIButton!
    @IBOutlet weak var btnBackward: UIButton!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var imgViewLoader: UIImageView!
    @IBOutlet weak var viewTransperent: UIView!
    @IBOutlet weak var btnNoAds: UIButton!
    @IBOutlet weak var btnPlayAgain: UIButton!

    var interstitial: GADInterstitial?

    var soundStatus:Bool = false
    var solveTestArray : [String : [UIImage:Int]] = [:]
    var showOptionsArray : [[String]] = [[]]
    var getImageNameArray : [String] = []
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var player = AVAudioPlayer()
    var paymentDetailVC : PaymentDetailViewController?
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBackward.isHidden = true
        if appDelegate.IS_Sound_ON {
            btnSound.setBackgroundImage(UIImage(named: "Sound-On.png"), for: .normal)
        } else {
            btnSound.setBackgroundImage(UIImage(named: "Sound-Off.png"), for: .normal)
        }
        collectionViewCard.register(UINib(nibName: "TestSolveCollectionCell", bundle: nil), forCellWithReuseIdentifier: "TestSolveCollectionCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //depending upon direction of collection view
        self.collectionViewCard?.setCollectionViewLayout(layout, animated: true)
        
        let _: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionViewCard!.collectionViewLayout = layout
        self.lblQuestion.text = getImageNameArray[0]
        playSound(getSound : getImageNameArray[0]+"_Question")
        let loaderGif = UIImage.gifImageWithName("Loading")
        imgViewLoader.image = loaderGif
        imgViewLoader.backgroundColor = UIColor.white
        imgViewLoader.layer.borderWidth = 1
        imgViewLoader.layer.borderColor = UIColor.red.cgColor
    }
    // MARK: - User defined Functions
    
    func playSound(getSound : String, isShowNextCell : Bool = false) {
        let path = Bundle.main.path(forResource: getSound, ofType : "mp3")!
        let url = URL(fileURLWithPath : path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            if !btnSound.currentBackgroundImage!.isEqual(UIImage(named: "Sound-Off.png")) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.player.play()
                }
            }
        } catch {
            print ("There is an issue with this code!")
        }
    }
    
    func playSoundForImageStatus(getSound : String ) {
        let path = Bundle.main.path(forResource: getSound, ofType : "mp3")!
        let url = URL(fileURLWithPath : path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            if !btnSound.currentBackgroundImage!.isEqual(UIImage(named: "Sound-Off.png")) {
                self.player.play()
            }
        } catch {
            print ("There is an issue with this code!")
        }
    }
    
    func createAndLoadInterstitial() -> GADInterstitial? {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8501671653071605/2568258533")

        guard let interstitial = interstitial else {
            return nil
        }

        let request = GADRequest()
        // Remove the following line before you upload the app
        request.testDevices = ["E16216BC-AA11-4924-A93F-5011846DFFA4"]
        interstitial.load(request)
        interstitial.delegate = self

        return interstitial
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

    @IBAction func funcGoToTestHome(_ sender: Any) {
        player.stop()
        self.viewTransperent.isHidden = false
        self.imgViewLoader.isHidden = false
        interstitial = createAndLoadInterstitial()
//        navigationController?.popViewController(animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            if !self.viewTransperent.isHidden {
                self.viewTransperent.isHidden = true
                self.imgViewLoader.isHidden = true
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func funcSound_ON_OFF(_ sender: Any) {
        if appDelegate.IS_Sound_ON {
            btnSound.setBackgroundImage(UIImage(named: "Sound-Off.png"), for: .normal)
            player.stop()
        } else {
            btnSound.setBackgroundImage(UIImage(named: "Sound-On.png"), for: .normal)
            playSound(getSound: getImageNameArray[currentIndex]+"_Question")
        }
        appDelegate.IS_Sound_ON = !appDelegate.IS_Sound_ON
    }
    @IBAction func funcPlayAgainClick(_ sender: Any) {
        player.stop()
        playSound(getSound: getImageNameArray[currentIndex]+"_Question")
    }
    
    @IBAction func funcForwardBtnClick(_ sender: Any)
    {
        if !btnForward.isHidden {
            let visibleItems: NSArray = self.collectionViewCard.indexPathsForVisibleItems as NSArray
            let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
            let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
            if nextItem.row < showOptionsArray.count {
                self.collectionViewCard.scrollToItem(at: nextItem, at: .left, animated: true)
                self.lblQuestion.text = getImageNameArray[nextItem.row]
                currentIndex = nextItem.row
                playSound(getSound : getImageNameArray[nextItem.row]+"_Question")
            }
            if nextItem.row == self.showOptionsArray.count - 1 {
                self.btnForward.isHidden = true
            } else if nextItem.row == 0 {
                self.btnBackward.isHidden = true
            }else {
                self.btnForward.isHidden = false
                self.btnBackward.isHidden = false
            }
            let indexPath = IndexPath(item: nextItem.row - 1 , section: 0)
            if let cell = collectionViewCard .cellForItem(at: indexPath) as? TestSolveCollectionCell {
                cell.hideSignOnImageView()
            }
        }
    }

    @IBAction func funcBackwardBtnClick(_ sender: Any)
    {
        let visibleItems: NSArray = self.collectionViewCard.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        if nextItem.row < showOptionsArray.count && nextItem.row >= 0{
            self.collectionViewCard.scrollToItem(at: nextItem, at: .right, animated: true)
            self.lblQuestion.text = getImageNameArray[nextItem.row]
            currentIndex = nextItem.row
            playSound(getSound : getImageNameArray[nextItem.row]+"_Question")
        }
        if nextItem.row == 0 {
            self.btnBackward.isHidden = true
        } else if nextItem.row == self.showOptionsArray.count - 1 {
            self.btnForward.isHidden = true
        } else {
            self.btnBackward.isHidden = false
            self.btnForward.isHidden = false
        }
        let indexPath = IndexPath(item: nextItem.row + 1, section: 0);
        if let cell = collectionViewCard .cellForItem(at: indexPath) as? TestSolveCollectionCell {
                cell.hideSignOnImageView()
        }
    }

    func scrollToNearestVisibleCollectionViewCell() {
        self.collectionViewCard.decelerationRate = UIScrollView.DecelerationRate.fast
        let visibleCenterPositionOfScrollView = Float(self.collectionViewCard.contentOffset.x + (self.collectionViewCard.bounds.size.width / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude
        for i in 0..<self.collectionViewCard.visibleCells.count {
            let cell = self.collectionViewCard.visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + cellWidth / 2)

            // Now calculate closest cell
            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if distance < closestDistance {
                closestDistance = distance
                closestCellIndex = self.collectionViewCard.indexPath(for: cell)!.row
            }
        }
        if closestCellIndex != -1 {
            self.collectionViewCard.scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .centeredHorizontally, animated: true)
          self.lblQuestion.text = getImageNameArray[closestCellIndex]
            if closestCellIndex == self.showOptionsArray.count - 1 {
                self.btnForward.isHidden = true
            }
            else if closestCellIndex == 0 {
                self.btnBackward.isHidden = true
            } else {
                self.btnForward.isHidden = false
                self.btnBackward.isHidden = false
            }
            let indexPath = IndexPath(item: closestCellIndex, section: 0);
            if let cell = self.collectionViewCard .cellForItem(at: indexPath) as? TestSolveCollectionCell {
                    cell.hideSignOnImageView()
            }
            currentIndex = closestCellIndex
            playSound(getSound : getImageNameArray[closestCellIndex]+"_Question")
        }
    }

    // MARK: - CollectionView Functions

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showOptionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestSolveCollectionCell", for: indexPath) as? TestSolveCollectionCell else {
            // we failed to get a PersonCell – bail out!
            fatalError("Unable to dequeue PersonCell.")
        }
//        for (key, value) in solveTestArray {
//            print("\(key) -> \(value)")
//        }
//        cell.backgroundColor = UIColor.red
       // cell.imgViewCard2.contentMode = .scale
        // if we're still here it means we got a PersonCell, so we can return it
        
        
        
        let arrayTestSolve = Array(showOptionsArray)[indexPath.row]
        cell.tag = indexPath.row
        cell.testSolveDelegate = self
        cell.imageSquareArray  = arrayTestSolve
        cell.setImageToSquare()
//       cell.imgViewCard1.image = Array(dictArrayTestSolve)[0].key
//       cell.imgViewCard2.image = Array(dictArrayTestSolve)[1].key
//       cell.imgViewCard3.image = Array(dictArrayTestSolve)[2].key
//       cell.imgViewCard4.image = Array(dictArrayTestSolve)[3].key
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionViewCard.frame.width, height: self.collectionViewCard.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollToNearestVisibleCollectionViewCell()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.scrollToNearestVisibleCollectionViewCell()
        }
    }
    
    //Start Payment flow
    
    @IBAction func funcNoAds(_ sender: Any) {
        player.stop()
        showPaymentScreen()
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
extension TestSolveViewController: GADBannerViewDelegate {
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
extension TestSolveViewController: GADInterstitialDelegate {
    func funcHideLoader() {
        self.viewTransperent.isHidden = true
        self.imgViewLoader.isHidden = true
    }
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("Interstitial loaded successfully")
        funcHideLoader()
        ad.present(fromRootViewController: self)
        navigationController?.popViewController(animated: true)
    }

    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        funcHideLoader()
        print("Fail to receive interstitial")
        navigationController?.popViewController(animated: true)
    }
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        funcHideLoader()
        navigationController?.popViewController(animated: true)
        print("dismiss interstitial")
    }
}
