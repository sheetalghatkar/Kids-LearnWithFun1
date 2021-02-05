//
//  AppConstant.swift
//  Kids-LearnWithFun1
//
//  Created by sheetal shinde on 30/06/20.
//  Copyright © 2020 sheetal shinde. All rights reserved.
//

import Foundation
import UIKit
//import SwiftyStoreKit

class CommanArray {
    static var wildAnimalImageArray: [UIImage] = [
        UIImage(named: "Tiger.png")!,
        UIImage(named: "Lion.png")!,
        UIImage(named: "Elephant.png")!,
        UIImage(named: "Cheetah.png")!,
        UIImage(named: "Rhino.png")!,
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
    static var wildAnimalNameArray: [String] = ["Tiger","Lion",
        "Elephant","Cheetah","Rhino","Bear","Deer","Zebra","Giraffe","Chimpanzee","Fox","Wolf","Panda","Hippopotamus","Kangaroo","Racoon"]
    //------------------------------------------------------------------------
    static var domesticAnimalImageArray: [UIImage] = [
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
    static var domesticAnimalNameArray: [String] = ["Horse","Cow",
        "Buffalo","Donkey","Goat","Sheep","Camel","Rabbit","Pig","Cat","Dog"]
    //------------------------------------------------------------------------
    static var birdImageArray: [UIImage] = [
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
        UIImage(named: "Goldfinch.png")!
    ]
    static var birdNameArray: [String] = ["Pigeon",
        "Owl","Kingfisher","Peacock","Sparrow","Crow","Chicken","Ostrich","Cuckoo","Hummingbird","Penguin","Nightingale","Goldfinch"]
    //------------------------------------------------------------------------
    static var flowerImageArray: [UIImage] = [
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
    static var flowerNameArray: [String] = ["Lotus","Rose","Lilly","Jasmine","Hibiscus","Crossandra","Tulip","Orchid","Sunflower","Dahlia","Daisy","Bluebell","Catharanthus","Magnolia"]
    //------------------------------------------------------------------------
    static var status_Sign_Array = [
        UIImage(named: "Wrong-Sign.png")!,
        UIImage(named: "Right-Sign.png")!
    ]
    
//    static var paymentDetailsBgColor = UIColor(red: (106/255), green: (194/255), blue: (94/255), alpha: 1.0)
    static var paymentDetailsBgColor = UIColor(red: (110/255), green: (209/255), blue: (225/255), alpha: 1.0)
    static var paymentModeBgColor = UIColor(red: (51/255), green: (206/255), blue: (225/255), alpha: 1.0)
    static var paymentBtnTextColor = UIColor(red: (37/255), green: (160/255), blue: (187/255), alpha: 1.0)
//    static var yellowColor = UIColor(red: (203/255), green: (161/255), blue: (46/255), alpha: 1.0)
    static var settingBgColor = UIColor(red: (113/255), green: (200/255), blue: (92/255), alpha: 1.0)
    static var imageRadioCheck = UIImage(named: "radio_check.png")
    static var imageRadioUncheck = UIImage(named: "radio_uncheck.png")
    static var cancelSubscriptionBgColor = UIColor(red: (143/255), green: (237/255), blue: (242/255), alpha: 1.0)
    
    static var productId_Year_Auto_Recurring = "com.mobiapps360.LearnNature.YearlyAutoRenew"
    static var productId_Year_Non_Recurring = "com.mobiapps360.LearnNature.YearlyNonRenew"
    static var productId_Month_Auto_Recurring = "com.mobiapps360.LearnNature.MonthlyAutoRenew"
    static var productId_Month_Non_Recurring = "com.mobiapps360.LearnNature.MonthlyNonRenew"
    
    
    //Related to review and rating
    static let app_AppStoreLink = URL(string: "https://apps.apple.com/app/id1548498641")

    //Related to InAppPurchase
    static var environment = AppleReceiptValidator.VerifyReceiptURLType.production
    static var secretKey = "d277e87d60d84a40b35c1e58295d7860"
    
    
    //Related to Ads
   /* static var Banner_AdUnitId = "ca-app-pub-7546454767986772/5041407646"
    static var Interstitial_AdUnitId = "ca-app-pub-7546454767986772/7256507444"
    static var Ad_App_ID = "ca-app-pub-7546454767986772~4303041040"*/
    
     static var Banner_AdUnitId = "ca-app-pub-3940256099942544/2934735716"
     static var Interstitial_AdUnitId = "ca-app-pub-3940256099942544/4411468910"
     static var Ad_App_ID = "ca-app-pub-3940256099942544~1458002511"

    
    
    
    
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
