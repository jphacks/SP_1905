//
//  dataModel.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/27.
//

import Foundation

struct dataModel {
    var adCompanyTitle: String?
    var adTextForm: String?
    var adUrl: String?
    
    init(adCompanyTitle: String, adTextForm: String) {
        self.adCompanyTitle = adCompanyTitle
        self.adTextForm = adTextForm
    }
}
