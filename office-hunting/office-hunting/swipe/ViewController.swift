//
//  ViewController.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/24.
//  Copyright © 2019 Fuuya Yamada. All rights reserved.
//

import UIKit
import Koloda

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let view = SpeechBalloonView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: self.view.frame.height / 2))
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func toSwipe(_ sender: Any) {
        let sb = UIStoryboard(name: "TinderStoryboard", bundle: nil)
        let tinderViewController = sb.instantiateInitialViewController() as! TinderViewController
        
        self.present(tinderViewController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

