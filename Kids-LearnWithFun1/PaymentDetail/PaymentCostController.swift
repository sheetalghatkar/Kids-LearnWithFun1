//
//  PaymentCostController.swift
//  Kids-LearnWithFun1
//
//  Created by Sheetal Ghatkar on 07/01/21.
//  Copyright © 2021 sheetal shinde. All rights reserved.
//

import UIKit

class PaymentCostController: UIViewController {
    @IBOutlet weak var lblCostTitle: UILabel!
    @IBOutlet weak var lblCostDetail: UILabel!
    
    @IBOutlet weak var lblBuyOneTime: UILabel!
    @IBOutlet weak var lblBuyYearly: UILabel!
    @IBOutlet weak var lblBuyMonthly: UILabel!

    @IBOutlet weak var btnBuyOneTime: UIButton!
    @IBOutlet weak var btnBuyYearly: UIButton!
    @IBOutlet weak var btnBuyMonthly: UIButton!
    
    @IBOutlet weak var btnCheckBuyOneTime: UIButton!
    @IBOutlet weak var btnCheckBuyYearly: UIButton!
    @IBOutlet weak var btnCheckBuyMonthly: UIButton!
    @IBOutlet weak var btnBuy: UIButton!
    @IBOutlet weak var btnRestore: UIButton!
    @IBOutlet weak var lblAlredyPurchased: UILabel!
    
    //----------------------------------------
    //New
    @IBOutlet weak var viewYearly: UIView!
    @IBOutlet weak var viewMonthly: UIView!
    
    @IBOutlet weak var lblYearlyTitle: UILabel!
    @IBOutlet weak var lblYearlyRecurring: UILabel!
    @IBOutlet weak var lblYearlyPriceRecurring: UILabel!
    @IBOutlet weak var lblYearlyNonRecurring: UILabel!
    @IBOutlet weak var lblYearlyNonPriceRecurring: UILabel!
    @IBOutlet weak var btnYearlyPayment: UIButton!
    @IBOutlet weak var btnRadioRecurringYearly: UIButton!
    @IBOutlet weak var btnRadioNonRecurringYearly: UIButton!

    @IBOutlet weak var lblMonthlyTitle: UILabel!
    @IBOutlet weak var lblMonthlyRecurring: UILabel!
    @IBOutlet weak var lblMonthlyPriceRecurring: UILabel!
    @IBOutlet weak var lblMonthlyNonRecurring: UILabel!
    @IBOutlet weak var lblMonthlyPriceNonRecurring: UILabel!
    @IBOutlet weak var btnMonthlyPayment: UIButton!
    @IBOutlet weak var btnRadioRecurringMonthly: UIButton!
    @IBOutlet weak var btnRadioNonRecurringMonthly: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        lblCostTitle.text = "Upgrade to Premium"
        lblAlredyPurchased.text = "Already Purchased?"
        lblCostDetail.text = "Unlock premium features\n & remove Ads"
        
        btnBuyOneTime.setTitle("One-time Payment", for: .normal)
        btnBuyYearly.setTitle("Yearly Subscription", for: .normal)
        btnBuyMonthly.setTitle("Monthly Subscription", for: .normal)
        btnBuy.setTitle("Buy", for: .normal)
        btnRestore.setTitle("Restore", for: .normal)

        lblBuyOneTime.text = "$1588"
        lblBuyYearly.text = "$8"
        lblBuyMonthly.text = "$1"

        /*var textBuyOneTime = NSMutableAttributedString(string:"One-time Payment" + "    " + "$15")
        textBuyOneTime.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 20, weight: .bold),range: NSRange(location: 16, length: (textBuyOneTime.length - 16)))
        btnBuyOneTime.setAttributedTitle(textBuyOneTime, for: .normal)*/
                
        btnBuyOneTime.backgroundColor = CommanArray.paymentModeBgColor
        btnBuyYearly.backgroundColor = CommanArray.paymentModeBgColor
        btnBuyMonthly.backgroundColor = CommanArray.paymentModeBgColor
        btnBuy.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        btnRestore.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        
        //Views
        viewYearly.backgroundColor = CommanArray.paymentModeBgColor
        viewMonthly.backgroundColor = CommanArray.paymentModeBgColor
        
        //Buttons
        btnYearlyPayment.setTitle("Buy", for: .normal)
        btnMonthlyPayment.setTitle("Buy", for: .normal)
        
        btnYearlyPayment.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        btnMonthlyPayment.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        
        //Label
        lblYearlyTitle.text = "Yearly Subscription"
        lblYearlyRecurring.text = "Recurring Payment"
        lblYearlyPriceRecurring.text = "$8"
        lblYearlyNonRecurring.text = "Non-Recurring Payment"
        lblYearlyNonPriceRecurring.text = "$10"
        
        lblMonthlyTitle.text = "Monthly Subscription"
        lblMonthlyRecurring.text = "Recurring Payment "
        lblMonthlyPriceRecurring.text = "$1"
        lblMonthlyNonRecurring.text = "Non-Recurring Payment"
        lblMonthlyPriceNonRecurring.text = "$1.25"
        
        self.viewYearly.layer.shadowColor = UIColor.white.cgColor
        self.viewYearly.layer.borderWidth = 2.5

    }
    
    @IBAction func funcRadioRecurringYearlyClick(_ sender: Any) {
        self.viewYearly.layer.shadowColor = UIColor.white.cgColor
        self.viewYearly.layer.borderWidth = 2.5

        self.viewMonthly.layer.shadowColor = UIColor.black.cgColor
        self.viewMonthly.layer.borderWidth = 1.5

        if btnRadioRecurringYearly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioRecurringYearly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioNonRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcRadioNonRecurringYearlyClick(_ sender: Any) {
        self.viewYearly.layer.shadowColor = UIColor.white.cgColor
        self.viewYearly.layer.borderWidth = 2.5

        self.viewMonthly.layer.shadowColor = UIColor.black.cgColor
        self.viewMonthly.layer.borderWidth = 1.5

        if btnRadioNonRecurringYearly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioNonRecurringYearly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcYearlyPaymentBtnClick(_ sender: Any) {
        self.viewYearly.layer.shadowColor = UIColor.white.cgColor
        self.viewMonthly.layer.shadowColor = UIColor.black.cgColor
        self.viewMonthly.layer.borderWidth = 1.5
    }
    
    @IBAction func funcRadioRecurringMonthlyClick(_ sender: Any) {
        self.viewMonthly.layer.shadowColor = UIColor.white.cgColor
        self.viewYearly.layer.shadowColor = UIColor.black.cgColor
        self.viewMonthly.layer.borderWidth = 2.5
        self.viewYearly.layer.borderWidth = 1.5

        if btnRadioRecurringMonthly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioRecurringMonthly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioNonRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcRadioNonRecurringMonthlyClick(_ sender: Any) {
        self.viewMonthly.layer.shadowColor = UIColor.white.cgColor
        self.viewYearly.layer.shadowColor = UIColor.black.cgColor
        self.viewMonthly.layer.borderWidth = 2.5
        self.viewYearly.layer.borderWidth = 1.5
        if btnRadioNonRecurringMonthly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioNonRecurringMonthly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcMonthlyPaymentBtnClick(_ sender: Any) {
        self.viewMonthly.layer.shadowColor = UIColor.white.cgColor
        self.viewYearly.layer.shadowColor = UIColor.black.cgColor
        self.viewMonthly.layer.borderWidth = 2.5
        self.viewYearly.layer.borderWidth = 1.5
    }

    
    @IBAction func funcHomeBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func funcOneTimeBtnClick(_ sender: Any) {
        if btnCheckBuyOneTime.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnCheckBuyOneTime.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnCheckBuyYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnCheckBuyMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcYearlyBtnClick(_ sender: Any) {
        if btnCheckBuyYearly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnCheckBuyOneTime.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnCheckBuyYearly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnCheckBuyMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcMonthlyBtnClick(_ sender: Any) {
        if btnCheckBuyMonthly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnCheckBuyOneTime.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnCheckBuyYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnCheckBuyMonthly.setImage(CommanArray.imageRadioCheck, for: .normal)
        }
    }
    @IBAction func funcBuyBtnClick(_ sender: Any) {
    }
    @IBAction func funcRestoreBtnClick(_ sender: Any) {
    }
}
