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
    @IBOutlet weak var adCompanyTitle: UITextField!
    @IBOutlet weak var adTextForm: UITextField!
    @IBOutlet weak var adUrl: UITextField!
    
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    @IBAction func postAdminMsg(_ sender: UIButton) {
        postData()
        resetForm()
    }
    
    func postData(){
        guard let adCompanyTitle = adCompanyTitle.text else {
            return
        }
        
        guard let adTextForm = adTextForm.text else {
            return
        }
        
        guard let adUrl = adUrl.text else {
            return
        }
        
        
        let origdata: [String: Any] = [
            "adCompanyTitle": adCompanyTitle,
            "adTextForm": adTextForm,
            "adUrl": adUrl
        ]
        
        db.collection("msg").addDocument(data: origdata) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func resetForm(){
        adCompanyTitle.text = ""
        adTextForm.text = ""
        adUrl.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension AdminPostformViewController: UITextFieldDelegate {
    func setDelegate(){
        adAtmosphereImg.delegate = self
        adCompanyTitle.delegate = self
        adTextForm.delegate = self
        adUrl.delegate = self
    }
}
