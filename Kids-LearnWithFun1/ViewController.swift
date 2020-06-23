//
//  ViewController.swift
//  Kids-LearnWithFun
//
//  Created by sheetal shinde on 14/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class ViewController: UIViewController {
    @IBOutlet weak var bgScreen: UIImageView!
    @IBOutlet weak var imgVwWildAnimal: UIImageView!
    @IBOutlet weak var imgVwPetAnimal: UIImageView!
    @IBOutlet weak var imgVwBird: UIImageView!
    @IBOutlet weak var imgVwFlower: UIImageView!

    @IBOutlet weak var imgVwBird1Bottom: UIImageView!
    @IBOutlet weak var imgVwBird2Bottom: UIImageView!
    @IBOutlet weak var imgVwWild1Bottom: UIImageView!
    @IBOutlet weak var imgVwWild2Bottom: UIImageView!
    @IBOutlet weak var imgVwWild3Bottom: UIImageView!

    var player = AVAudioPlayer()
    var bannerView: GADBannerView!

    //------------------------------------------------------------------------
    var wildAnimalImageArray: [UIImage] = [
        UIImage(named: "Tiger.png")!,
        UIImage(named: "Lion.png")!,
        UIImage(named: "Elephant.png")!,
        UIImage(named: "Cheetah.png")!,
        UIImage(named: "Rhinocero.png")!,
        UIImage(named: "Bear.png")!,
        UIImage(named: "Deer.png")!,
        UIImage(named: "Zebra.png")!,
        UIImage(named: "Giraffe.png")!,
        UIImage(named: "Chimpanzee.png")!,
        UIImage(named: "Fox.png")!,
        UIImage(named: "Wolf.png")!,
        UIImage(named: "Panda.png")!,
        UIImage(named: "Hippopotamus.png")!,
        UIImage(named: "Kangaroo.png")!,
        UIImage(named: "Racoon.png")!
    ]
    var wildAnimalNameArray: [String] = ["Tiger","Lion",
        "Elephant","Cheetah","Rhino","Bear","Deer","Zebra","Giraffe","Chimpanzee","Fox","Wolf","Panda","Hippopotamus","Kangaroo","Racoon"]
    //------------------------------------------------------------------------
    var domesticAnimalImageArray: [UIImage] = [
        UIImage(named: "Horse.png")!,
        UIImage(named: "Cow.png")!,
        UIImage(named: "Buffalo.png")!,
        UIImage(named: "Donkey.png")!,
        UIImage(named: "Goat.png")!,
        UIImage(named: "Sheep.png")!,
        UIImage(named: "Camel.png")!,
        UIImage(named: "Rabbit.png")!,
        UIImage(named: "Pig.png")!,
        UIImage(named: "Cat.png")!,
        UIImage(named: "Dog.png")!
    ]
    var domesticAnimalNameArray: [String] = ["Horse","Cow",
        "Buffalo","Donkey","Goat","Sheep","Camel","Rabbit","Pig","Cat","Dog"]
    //------------------------------------------------------------------------
    var birdImageArray: [UIImage] = [
        UIImage(named: "Pigeon.png")!,
        UIImage(named: "Owl.png")!,
        UIImage(named: "Kingfisher.png")!,
        UIImage(named: "Peacock.png")!,
        UIImage(named: "Sparrow.png")!,
        UIImage(named: "Crow.png")!,
        UIImage(named: "Chicken.png")!,
        UIImage(named: "Ostrich.png")!,
        UIImage(named: "Cuckoo.png")!,
        UIImage(named: "Hummingbird.png")!,
        UIImage(named: "Penguin.png")!,
        UIImage(named: "Nightingale.png")!,
        UIImage(named: "American Goldfinch.png")!
    ]
    var birdNameArray: [String] = ["Pigeon",
        "Owl","Kingfisher","Peacock","Sparrow","Crow","Chicken","Ostrich","Cuckoo","Hummingbird","Penguin","Nightingale","Goldfinch"]
    //------------------------------------------------------------------------
    var flowerImageArray: [UIImage] = [
        UIImage(named: "Lotus.png")!,
        UIImage(named: "Rose.png")!,
        UIImage(named: "Lilly.png")!,
        UIImage(named: "Jasmine.png")!,
        UIImage(named: "Hibiscus.png")!,
        UIImage(named: "Crossandra.png")!,
        UIImage(named: "Tulip.png")!,
        UIImage(named: "Orchid.png")!,
        UIImage(named: "Sunflower.png")!,
        UIImage(named: "Dahlia.png")!,
        UIImage(named: "Daisy.png")!,
        UIImage(named: "Bluebell.png")!,
        UIImage(named: "Catharanthus.png")!,
        UIImage(named: "Magnolia.png")!
    ]
    var flowerNameArray: [String] = ["Lotus","Rose","Lilly","Jasmine","Hibiscus","Crossandra","Tulip","Orchid","Sunflower","Dahlia","Daisy","Bluebell","Catharanthus","Magnolia"]
    //------------------------------------------------------------------------

    override func viewDidAppear(_ animated: Bool) {
        playBackgroundMusic()
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

        self.imgVwBird1Bottom.image  = birdGif1
        self.imgVwBird2Bottom.image  = birdGif2
        self.imgVwWild1Bottom.image  = wildGif1
        self.imgVwWild2Bottom.image  = wildGif2
        self.imgVwWild3Bottom.image  = wildGif3

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
        
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
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
            setPictureVC.imageArray = wildAnimalImageArray
            setPictureVC.imageNameArray = wildAnimalNameArray
        }
        else if tapGestureRecognizer.view?.tag == 2 {
            setPictureVC.imageArray = domesticAnimalImageArray
            setPictureVC.imageNameArray = domesticAnimalNameArray
        }
        else if tapGestureRecognizer.view?.tag == 3 {
            setPictureVC.imageArray = birdImageArray
            setPictureVC.imageNameArray = birdNameArray
        }
        else if tapGestureRecognizer.view?.tag == 4 {
            setPictureVC.imageArray = flowerImageArray
            setPictureVC.imageNameArray = flowerNameArray
        }
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

extension ViewController: GADBannerViewDelegate {
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
