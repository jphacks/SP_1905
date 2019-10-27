//
//  TopToBottomSegue.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/26.
//

import UIKit

class TopToBottomSegue: UIStoryboardSegue {
    override func perform() {
        let firstVCView = self.source.view as UIView?
        let secondVCView = self.destination.view as UIView?
        
        // 画面の大きさを取得
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        // 次出てくるviewを最初に今のviewの後ろ側に表示
        secondVCView?.frame = CGRect(x: 0,y: 0,width: screenWidth, height: screenHeight)
        let window = UIApplication.shared.keyWindow
        window?.insertSubview(secondVCView!, at: 0)
        
        // 邪魔になっている今のviewを画面外まで下げれば終了
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            firstVCView?.center.y += screenHeight
        }) { (Finished) -> Void in
            self.source.present(self.destination ,
                                animated: false,
                                completion: nil)
        }
        
    }
}
