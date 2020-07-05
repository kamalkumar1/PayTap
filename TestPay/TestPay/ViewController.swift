//
//  ViewController.swift
//  PayTapsSwift
//
//  Created by kamal kumar on 04/07/20.
//  Copyright © 2020 kamal kumar. All rights reserved.
//

import UIKit
import PassKit

class ViewController: UIViewController {

    @IBOutlet weak var vbut: UIView!
    var initialSetupViewController: PTFWInitialSetupViewController!
    @IBOutlet weak var lblTotal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       vbut.layer.shadowColor = UIColor.black.cgColor
        vbut.layer.shadowOpacity = 1
        vbut.layer.shadowOffset = .zero
        vbut.layer.shadowRadius = 10
        
        
        
        lblTotal.text = "5 $";
        
    }
    @IBAction func clickToPay(_ sender: Any) {
        
       let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        self.initialSetupViewController = PTFWInitialSetupViewController.init(
            bundle: bundle,
            andWithViewFrame: self.view.frame,
            andWithAmount: 5.0,
            andWithCustomerTitle: "PayTabs Sample App",
            andWithCurrencyCode: "USD",
            andWithTaxAmount: 0.0,
            andWithSDKLanguage: "en",
            andWithShippingAddress: "Manama",
            andWithShippingCity: "Manama",
            andWithShippingCountry: "BHR",
            andWithShippingState: "Manama",
            andWithShippingZIPCode: "123456",
            andWithBillingAddress: "Manama",
            andWithBillingCity: "Manama",
            andWithBillingCountry: "BHR",
            andWithBillingState: "Manama",
            andWithBillingZIPCode: "12345",
            andWithOrderID: "12345",
            andWithPhoneNumber: "0097333109781",
            andWithCustomerEmail: "abc@gmail.com",
            andIsTokenization: false,
            andIsPreAuth: false,
            andWithMerchantEmail: StringConstant.instance.MerchantEmail,
            andWithMerchantSecretKey: StringConstant.instance.SECKERTKEY,
            andWithAssigneeCode: "SDK",
            andWithThemeColor:UIColor.purple,
            andIsThemeColorLight: true)


        self.initialSetupViewController.didReceiveBackButtonCallback = {

        }

        self.initialSetupViewController.didStartPreparePaymentPage = {
          // Start Prepare Payment Page
          // Show loading indicator
            
            StringConstant.instance.ShowIndicator(containerview: self.view, text: "Loading...")
        }
        self.initialSetupViewController.didFinishPreparePaymentPage = {
          // Finish Prepare Payment Page
          // Stop loading indicator
            StringConstant.instance.Hidendicator(containerview: self.view);
        }

        self.initialSetupViewController.didReceiveFinishTransactionCallback = {(responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
          print("Response Code: \(responseCode)")
          print("Response Result: \(result)")
          
          // In Case you are using tokenization
          print("Tokenization Cutomer Email: \(tokenizedCustomerEmail)");
          print("Tokenization Customer Password: \(tokenizedCustomerPassword)");
          print("TOkenization Token: \(token)");
        }
        
        self.view.addSubview(initialSetupViewController.view)
               self.addChild(initialSetupViewController)
               
               initialSetupViewController.didMove(toParent: self)

}
}

