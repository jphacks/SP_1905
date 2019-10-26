//
//  AdminPostformViewController.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/27.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class AdminPostformViewController: UIViewController {
    
    
    @IBOutlet weak var adAtmosphereImg: UITextField!
    @IBOutlet weak var adCompanyName: UITextField!
    @IBOutlet weak var adTextForm: UITextField!
    @IBOutlet weak var adUrl: UITextField!
    
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    @IBAction func postAdminMsg(_ sender: UIButton) {
        let origdata: [String: Any] = [
            "CompanyName": adCompanyName ?? "nil",
            "adTextForm": adTextForm ?? "nil",
            "URL": adUrl ?? "nil"
        ]
        if adCompanyName != nil && adTextForm != nil || adUrl != nil {
            db.collection("msg").addDocument(data: origdata) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
}

extension AdminPostformViewController: UITextFieldDelegate {
    func setDelegate(){
        adAtmosphereImg.delegate = self
        adCompanyName.delegate = self
        adTextForm.delegate = self
        adUrl.delegate = self
    }
}
