//
//  StringConstant.swift
//  TestPayT
//
//  Created by kamal kumar on 05/07/20.
//  Copyright © 2020 kamal kumar. All rights reserved.
//

import Foundation
class StringConstant {
    static let instance = StringConstant()
    //Alert constant
    let SECKERTKEY = "JBcWI3cqgoUF4ucJRZtq4QdLoJan0naJZnGIrS8Hg3nlyA5pAyQEp4pNNzaNXlwXJdFa5OSmSfHqPMQplG4KKtxx3Hk13RYM5EXa"
    let MERCHANTID = "10064291"
    let CCURRENCY = "USD";
    let SDKLanguage = "en"
    let ShippingCountry = "BHR"
    let MerchantEmail = "kamalelango15@gmail.com"
   
    //
    func ShowIndicator(containerview: UIView,text:String)  -> Void {
        
        let Indicator = MBProgressHUD.showAdded(to: containerview, animated: true)
        Indicator.label.text = "Loading..."
        Indicator.isUserInteractionEnabled = false
       // Indicator.detailsLabel.text = "process details"
        Indicator.show(animated: true)
        
    }
    func Hidendicator(containerview: UIView) -> Void {
        
        MBProgressHUD.hide(for: containerview, animated: true)
        
    }
}
