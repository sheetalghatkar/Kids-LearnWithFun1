//
//  PaymentCostController.swift
//  Kids-LearnWithFun1
//
//  Created by Sheetal Ghatkar on 07/01/21.
//  Copyright © 2021 sheetal shinde. All rights reserved.
//

import UIKit
import StoreKit

class PaymentCostController: UIViewController ,SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    @IBOutlet weak var lblCostTitle: UILabel!
    @IBOutlet weak var btnRestore: UIButton!
    @IBOutlet weak var lblAlredyPurchased: UILabel!
    
    //----------------------------------------
    //New
    @IBOutlet weak var viewBgYearly: UIView!
    
    @IBOutlet weak var viewYearly: UIView!
    @IBOutlet weak var viewMonthly: UIView!

    
    @IBOutlet weak var lblYearlyTitle: UILabel!
    @IBOutlet weak var lblYearlyRecurring: UILabel!
    @IBOutlet weak var lblYearlyPriceRecurring: UILabel!
    @IBOutlet weak var lblYearlyNonRecurring: UILabel!
    @IBOutlet weak var lblYearlyNonPriceRecurring: UILabel!
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
    
    @IBOutlet weak var viewTrasperentDisabled: UIView!

   // var product_id = "com.mobiapps360.LearnNature.YearlyAutoRenew"
    var selectedProductId = CommanArray.productId_Year_Auto_Recurring
    let defaults = UserDefaults.standard

    var product_ids = [CommanArray.productId_Year_Auto_Recurring,CommanArray.productId_Year_Non_Recurring,CommanArray.productId_Month_Auto_Recurring,CommanArray.productId_Month_Non_Recurring]

    override func viewDidLoad() {
        super.viewDidLoad()
        SKPaymentQueue.default().add(self)
        lblAlredyPurchased.text = "Already Purchased?"
        lblCostTitle.text = "Unlock Premium Features"
        btnRestore.setTitle("Restore", for: .normal)

        /*var textBuyOneTime = NSMutableAttributedString(string:"One-time Payment" + "    " + "$15")
        textBuyOneTime.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 20, weight: .bold),range: NSRange(location: 16, length: (textBuyOneTime.length - 16)))
        btnBuyOneTime.setAttributedTitle(textBuyOneTime, for: .normal)*/
                
        btnRestore.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        
        //Views
        viewBgYearly.backgroundColor = CommanArray.paymentModeBgColor
        
        //Buttons
        btnMonthlyPayment.setTitle("Buy", for: .normal)
        
        btnMonthlyPayment.setTitleColor(CommanArray.paymentBtnTextColor, for: .normal)
        
        //Label
        lblYearlyTitle.text = "Yearly Subscription"
        lblYearlyRecurring.text = "Recurring Payment"
        lblYearlyPriceRecurring.text = "$3.99"
        lblYearlyNonRecurring.text = "Non-Recurring Payment"
        lblYearlyNonPriceRecurring.text = "$5.99"
        
        lblMonthlyTitle.text = "Monthly Subscription"
        lblMonthlyRecurring.text = "Recurring Payment "
        lblMonthlyPriceRecurring.text = "$0.49"
        lblMonthlyNonRecurring.text = "Non-Recurring Payment"
        lblMonthlyPriceNonRecurring.text = "$0.99"
        
//        self.viewBgYearly.layer.shadowColor = UIColor.white.cgColor
//        self.viewBgYearly.layer.borderWidth = 2.5
        
//        self.viewBgMonthly.layer.shadowColor = UIColor.black.cgColor
//        self.viewBgMonthly.layer.borderWidth = 1.5
    }
    @IBAction func funcRadioRecurringYearlyClick(_ sender: Any) {
        if btnRadioRecurringYearly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioRecurringYearly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioNonRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnRadioRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnRadioNonRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            selectedProductId = CommanArray.productId_Year_Auto_Recurring
        }
    }
    @IBAction func funcRadioNonRecurringYearlyClick(_ sender: Any) {
        if btnRadioNonRecurringYearly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioNonRecurringYearly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnRadioRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnRadioNonRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            selectedProductId = CommanArray.productId_Year_Non_Recurring
        }
    }
    
    @IBAction func funcRadioRecurringMonthlyClick(_ sender: Any) {
        if btnRadioRecurringMonthly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioRecurringMonthly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioNonRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnRadioRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnRadioNonRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            selectedProductId = CommanArray.productId_Month_Auto_Recurring
        }
    }
    @IBAction func funcRadioNonRecurringMonthlyClick(_ sender: Any) {
        if btnRadioNonRecurringMonthly.currentImage!.pngData() == (CommanArray.imageRadioUncheck!).pngData() {
            btnRadioNonRecurringMonthly.setImage(CommanArray.imageRadioCheck, for: .normal)
            btnRadioRecurringMonthly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnRadioRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            btnRadioNonRecurringYearly.setImage(CommanArray.imageRadioUncheck, for: .normal)
            selectedProductId = CommanArray.productId_Month_Non_Recurring
        }
    }
    @IBAction func funcPaymentBtnClick(_ sender: Any) {
        self.viewTrasperentDisabled.isHidden = false
        buyConsumable()
    }
    @IBAction func funcHomeBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func funcRestoreBtnClick(_ sender: Any) {
        restore()
    }
}

extension PaymentCostController {
    func buyConsumable(){
        print("About to fetch the products");
        // We check that we are allow to make the purchase.
        if (SKPaymentQueue.canMakePayments())
        {
            let productsRequest = SKProductsRequest(productIdentifiers: Set(self.product_ids))
            productsRequest.delegate = self
            productsRequest.start()
            print("Fething Products")
        }else{
            print("can't make purchases");
        }
    }
    
    // Helper Methods
    
    func buyProduct(product: SKProduct){
        print("Sending the Payment Request to Apple")
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
        
    }
    

    // Delegate Methods for IAP
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("got the request from Apple")
        var isProductFound = false
        let count : Int = response.products.count
        if (count>0) {
            print("Success@@@@@@@")
            for getProductId in response.products {
                let validProduct: SKProduct = getProductId as SKProduct
                if (validProduct.productIdentifier == selectedProductId) {
                    isProductFound = true
                    print(validProduct.localizedTitle)
                    print(validProduct.localizedDescription)
                    print(validProduct.price)
                    buyProduct(product: validProduct)
                }
            }
            if !isProductFound {
                print("Product not found.")
            }
        } else {
            print("Nothing")
        }
    }
    
    
    func request(request: SKRequest!, didFailWithError error: NSError!) {
        print("La vaina fallo");
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("Received Payment Transaction Response from Apple");
        
        for transaction:AnyObject in transactions {
            if let trans:SKPaymentTransaction = transaction as? SKPaymentTransaction{
                switch trans.transactionState {
                case .purchased:
                    print("Product Purchased");
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    defaults.set(true, forKey: "IsPrimeUser")
                    self.viewTrasperentDisabled.isHidden = true
                    self.navigationController?.popViewController(animated: true)
                    let alert = UIAlertController(title: "", message: "Payment transaction Successful..", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
                        self.viewTrasperentDisabled.isHidden = true

                    }))

                    break;
                case .failed:
//                    defaults.set(true, forKey: "IsPrimeUser")
                    print("Purchased Failed");
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
//                    self.navigationController?.popViewController(animated: true)
                    let alert = UIAlertController(title: "", message: "Payment transaction failed. Please Try again.", preferredStyle: UIAlertController.Style.alert)
                    self.viewTrasperentDisabled.isHidden = true
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
                    }))
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    break;
                case .restored:
                    print("Already Purchased")
                    defaults.set(true, forKey: "IsPrimeUser")
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    self.viewTrasperentDisabled.isHidden = true
                    let alert = UIAlertController(title: "", message: "Product Restored Successfully.", preferredStyle: UIAlertController.Style.alert)
                    self.viewTrasperentDisabled.isHidden = true
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {_ in
                        self.navigationController?.popViewController(animated: true)
                    }))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                default:
                    break;
                }
            }
        }
        //If an error occurs, the code will go to this function
        func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
            print("transactions restored error")

            //Handle Error
        }
    }
    func paymentQueueRestoreCompletedTransactionsFinished(queue: SKPaymentQueue) {
        print("transactions restored")
            for transaction in queue.transactions {
                let t: SKPaymentTransaction = transaction
                let prodID = t.payment.productIdentifier as String
//                if prodID == "product ID" {
//                    print("action for restored")
//                    queue.finishTransaction(t)
//                    //code here what to restore
//            }
        }
    }
    //Step 1 Call from button Restore Purchase
    func restore() {
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().restoreCompletedTransactions()
    }

    //Step 2 Get transactions

    //If an error occurs, the code will go to this function
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        //Handle Error
        print("transactions restored queue error")
    }
}
