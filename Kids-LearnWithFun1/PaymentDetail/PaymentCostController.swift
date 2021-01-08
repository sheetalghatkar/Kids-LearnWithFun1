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

        
        lblBuyOneTime.text = "$15"
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
