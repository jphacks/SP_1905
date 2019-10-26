//
//  TinderViewController.swift
//  office-hunting
//
//  Created by x on 2019/10/26.
//

import UIKit
import Koloda

class TinderViewController: UIViewController {
    var index = 0
    
    @IBOutlet weak var kolodaView: KolodaView!
    //var imageNameArray = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.kolodaView.layer.cornerRadius = 15
        self.kolodaView.backgroundColor = UIColor.black
        kolodaView.dataSource = self
        kolodaView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func leftButton(_ sender: Any) {
        kolodaView.swipe(.left)
    }
    
    @IBAction func rightButton(_ sender: Any) {
        kolodaView.swipe(.right)
    }
    
}

extension TinderViewController: KolodaViewDelegate, KolodaViewDataSource {
    //枚数
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 10
    }
    
    //ドラッグのスピード
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    //表示内容
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        //        let view = UIView(frame: koloda.bounds)
        //        view.backgroundColor = randomColor()
        //        return view
        /*for subview in koloda.subviews{
         subview.removeFromSuperview()
         }*/
        /*
         let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
         let redView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
         redView.backgroundColor = UIColor.red
         redView.alpha = 0
         let blueView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
         blueView.backgroundColor = UIColor.red
         blueView.alpha = 0
         
         backgroundView.backgroundColor = UIColor.black
         
         backgroundView.addSubview(redView)
         backgroundView.addSubview(blueView)
         */
        let balloonView = SpeechBalloonView(frame: kolodaView.frame)
        return balloonView
    }
    
    //カードの色を指定、今回はランダム
    func randomColor() -> UIColor {
        return UIColor(red: randomFloat(), green: randomFloat(), blue: randomFloat(), alpha: 1)
    }
    
    //ランダムに色を生成
    func randomFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
    
    //delegate------------------
    
    // カードを全て消費したときの処理を定義する
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        print("Finish cards.")
        //シャッフル
        //imageNameArray = imageNameArray.shuffled()
        //リスタート
        koloda.resetCurrentCardIndex()
    }
    
    //カードをタップした時に呼ばれる
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        //urlに飛べる
        //UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
        
    }
    
    //dragやめたら呼ばれる
    func kolodaDidResetCard(_ koloda: KolodaView) {
        print("reset")
        //koloda.viewForCard(at: self.index)?.backgroundColor = UIColor.black
    }
    
    //darag中に呼ばれる
    func koloda(_ koloda: KolodaView, shouldDragCardAt index: Int) -> Bool {
        print(index, "drag")
        self.index = index
        return true
    }
    
    //ドラッグ度合い
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
        //print(direction, finishPercentage)
        /*
         if (direction == SwipeResultDirection.right) {
         koloda.viewForCard(at: self.index)?.backgroundColor = UIColor(displayP3Red: finishPercentage / CGFloat(100), green: 0, blue: 0, alpha: finishPercentage / CGFloat(50) )
         } else {
         koloda.viewForCard(at: self.index)?.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: finishPercentage / CGFloat(100), alpha: finishPercentage / CGFloat(50))
         }
         */
        
    }
    
    //dtagの方向など
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        //print(index, direction)
        if (direction == SwipeResultDirection.left) {
            
        } else {
            
        }
    }
    
}
