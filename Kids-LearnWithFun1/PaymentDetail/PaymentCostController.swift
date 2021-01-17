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
    @IBOutlet weak var btnRestore: UIButton!
    @IBOutlet weak var lblAlredyPurchased: UILabel!
    
    //----------------------------------------
    //New
    @IBOutlet weak var viewBgYearly: UIView!
    @IBOutlet weak var viewBgMonthly: UIView!
    
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
        lblAlredyPurchased.text = "Already Purchased?"
        lblCostTitle.text = "Unlock Premium Features"
        btnRestore.setTitle("Restore", for: .normal)

        /*var textBuyOneTime = NSMutableAttributedString(string:"One-time Payment" + "    " + "$15")
        textBuyOneTime.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 20, weight: .bold),range: NSRange(location: 16, length: (textBuyOneTime.length - 16)))
        btnBuyOneTime.setAttributedTitle(textBuyOneTime, for: .normal)*/
                
        btnRestore.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        
        //Views
        viewBgYearly.backgroundColor = CommanArray.paymentModeBgColor
        viewBgMonthly.backgroundColor = CommanArray.paymentModeBgColor
        
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
        
        self.viewBgYearly.layer.shadowColor = UIColor.white.cgColor
        self.viewBgYearly.layer.borderWidth = 2.5
        
        
        let tapGestureRecognYearView = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        viewYearly.addGestureRecognizer(tapGestureRecognYearView)
        viewYearly.tag = 1000
        
        
        let tapGestureRecognMonthView = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        viewMonthly.addGestureRecognizer(tapGestureRecognMonthView)
        viewMonthly.tag = 1001

    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if tapGestureRecognizer.view?.tag == 1000 {
            funcGlowYearView()
        } else {
            funcGlowMonthView()
        }
    }
    
    @IBAction func funcRadioRecurringYearlyClick(_ sender: Any) {
        funcGlowYearView()
        if btnRadioRecurringYearly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioRecurringYearly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioNonRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcRadioNonRecurringYearlyClick(_ sender: Any) {
        funcGlowYearView()
        if btnRadioNonRecurringYearly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioNonRecurringYearly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcYearlyPaymentBtnClick(_ sender: Any) {
        funcGlowYearView()
    }
    
    @IBAction func funcRadioRecurringMonthlyClick(_ sender: Any) {
        funcGlowMonthView()
        if btnRadioRecurringMonthly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioRecurringMonthly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioNonRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcRadioNonRecurringMonthlyClick(_ sender: Any) {
        funcGlowMonthView()
        if btnRadioNonRecurringMonthly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioNonRecurringMonthly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
        }
    }
    @IBAction func funcMonthlyPaymentBtnClick(_ sender: Any) {
        funcGlowMonthView()
    }

    func funcGlowYearView() {
        self.viewBgYearly.layer.shadowColor = UIColor.white.cgColor
        self.viewBgYearly.layer.borderWidth = 2.5
        self.viewBgMonthly.layer.shadowColor = UIColor.black.cgColor
        self.viewBgMonthly.layer.borderWidth = 1.5
    }
    
    func funcGlowMonthView() {
        self.viewBgMonthly.layer.shadowColor = UIColor.white.cgColor
        self.viewBgYearly.layer.shadowColor = UIColor.black.cgColor
        self.viewBgMonthly.layer.borderWidth = 2.5
        self.viewBgYearly.layer.borderWidth = 1.5
    }

    @IBAction func funcHomeBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func funcRestoreBtnClick(_ sender: Any) {
    }
}
