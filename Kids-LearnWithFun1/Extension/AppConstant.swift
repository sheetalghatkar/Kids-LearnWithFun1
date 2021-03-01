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
import SystemConfiguration

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
    
    static var productId_Year_Auto_Recurring = "com.mobiapps360.LearnNature.Yearly_Auto_Recurring"
    static var productId_Year_Non_Recurring = "com.mobiapps360.LearnNature.Yearly_Non_Recurring"
    static var productId_Month_Auto_Recurring = "com.mobiapps360.LearnNature.Monthly_Auto_Recurring"
    static var productId_Month_Non_Recurring = "com.mobiapps360.LearnNature.Monthly_Non_Recurring"
    
    static var imgCancelSubscription = UIImage(named: "PaymentDetail.png")!
    static var imgCancelSubscription1 = UIImage(named: "PaymentDetail-1.png")!

    static var homeImgSoundOff = UIImage(named: "Sound-Off_home.png")
    static var homeImgSoundOn = UIImage(named: "Sound-On_home.png")

    static var timerForAds = 12.0

    //Related to review and rating
    static let app_AppStoreLink = URL(string: "https://apps.apple.com/app/id1553868347")

    //Related to InAppPurchase
    static var environment = AppleReceiptValidator.VerifyReceiptURLType.production
    static var secretKey = "f22ce8f6a4b74465af34c670cf87e7cb"
    
    
    //Related to Ads Production
    static var Banner_AdUnitId = "ca-app-pub-7546454767986772/4399662828"
    static var Interstitial_AdUnitId = "ca-app-pub-7546454767986772/8147336147"
    static var Ad_App_ID = "ca-app-pub-7546454767986772~4303041040"
    
    //Related to Ads Sandbox/Test
    /* static var Banner_AdUnitId = "ca-app-pub-3940256099942544/2934735716"
     static var Interstitial_AdUnitId = "ca-app-pub-3940256099942544/4411468910"
     static var Ad_App_ID = "ca-app-pub-3940256099942544~1458002511"*/
}

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
/**
 * Check if internet connection is available
 */
class Reachability {
    
    class func isConnectedToNetwork() -> Bool {

        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }

        /* Only Working for WIFI
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired

        return isReachable && !needsConnection
        */

        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)

        return ret

    }
}


extension UIWindow {
    /// Returns the currently visible view controller if any reachable within the window.
    public var visibleViewController: UIViewController? {
        return UIWindow.visibleViewController(from: rootViewController)
    }

    /// Recursively follows navigation controllers, tab bar controllers and modal presented view controllers starting
    /// from the given view controller to find the currently visible view controller.
    ///
    /// - Parameters:
    ///   - viewController: The view controller to start the recursive search from.
    /// - Returns: The view controller that is most probably visible on screen right now.
    public static func visibleViewController(from viewController: UIViewController?) -> UIViewController? {
        switch viewController {
        case let navigationController as UINavigationController:
            return UIWindow.visibleViewController(from: navigationController.visibleViewController ?? navigationController.topViewController)

        case let tabBarController as UITabBarController:
            return UIWindow.visibleViewController(from: tabBarController.selectedViewController)

        case let presentingViewController where viewController?.presentedViewController != nil:
            return UIWindow.visibleViewController(from: presentingViewController?.presentedViewController)

        default:
            return viewController
        }
    }
}
