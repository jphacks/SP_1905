//
//  LoginViewController.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
//    @IBAction func tapLogin(_ sender: UIButton) {
//        let vc = TinderViewController()
//        //let nav = UINavigationController(rootViewController: vc)
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
