//
//  CustomViewController.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/26.
//

import UIKit

class CustomViewController: UINavigationController,UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //デリゲート先に自分を設定する。
        self.delegate = self
        
    }
    
    
    //画面遷移後の呼び出しメソッド
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        //ナビゲーションアイテムのタイトルに画像を設定する。
        self.navigationBar.topItem!.titleView = UIImageView(image:UIImage(named: "message"))
        
        self.navigationBar.frame = CGRect(x: 0,y: 0, width: UIScreen.main.bounds.size.width, height: 80)
    }
    
    
}
