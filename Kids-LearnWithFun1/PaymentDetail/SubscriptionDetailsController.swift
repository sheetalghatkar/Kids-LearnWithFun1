//
//  SubscriptionDetailsController.swift
//  Learn Nature
//
//  Created by Sheetal Ghatkar on 19/01/21.
//  Copyright © 2021 sheetal shinde. All rights reserved.
//

import UIKit

class SubscriptionDetailsController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    //----------------------------------------
    //New
    @IBOutlet weak var viewSubscriptionBg: UIView!
    @IBOutlet weak var viewSubscription: UIView!

    @IBOutlet weak var lblSubscriptionTitle: UILabel!
    @IBOutlet weak var lblSubscriptionSubtitle: UILabel!
    @IBOutlet weak var lblSubscriptionPrice: UILabel!
    @IBOutlet weak var btnCancelSubscription: UIButton!
    @IBOutlet weak var heightPaymentDetail: NSLayoutConstraint!
    
    var isNonRecurringSubscription = false

    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = "Subscription Details"
        
        //Views
        viewSubscriptionBg.backgroundColor = CommanArray.paymentModeBgColor

        //Buttons
        btnCancelSubscription.setTitle("Cancel Subscription", for: .normal)
        btnCancelSubscription.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        
        //Label
        lblSubscriptionTitle.text = "Yearly Subscription"
        lblSubscriptionSubtitle.text = "Recurring Payment"
        lblSubscriptionPrice.text = "$8"
                
        self.viewSubscriptionBg.layer.shadowColor = UIColor.white.cgColor
        self.viewSubscriptionBg.layer.borderWidth = 2.5
        
        if isNonRecurringSubscription {
            self.heightPaymentDetail.constant = 115
            self.btnCancelSubscription.isHidden = true
        }
    }
    
    @IBAction func funcCancelSubscriptionClick(_ sender: Any) {
    }
    
    @IBAction func funcHomeBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
