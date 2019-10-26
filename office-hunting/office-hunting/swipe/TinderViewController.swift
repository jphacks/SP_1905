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
    var imageNameArray = ["Group36.png", "Group37.png", "Group38.png", "Group39.png", "Group40.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.kolodaView.layer.cornerRadius = 15
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.navigationItem.titleView = makeMidButton()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.rightBarButtonItem = makeRightButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeMidButton() -> UIButton{
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.setBackgroundImage(UIImage(named: "door"), for: .normal)
        
        return button
    }
    
    func makeRightButton() -> UIBarButtonItem {
        let buttonItem = UIBarButtonItem(image: UIImage(named: "message")?.withRenderingMode(.alwaysOriginal),
        style: .plain,
        target: self,
        action: nil)
        
        return buttonItem
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
        return imageNameArray.count
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
        let imageView = UIImageView(frame: koloda.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageNameArray[index])
        koloda.addSubview(imageView)
        imageView.backgroundColor = .clear
        return imageView
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
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        
        return Bundle.main.loadNibNamed("CustomOverlayView", owner: self, options: nil)![0] as? OverlayView
    }
    
    //ドラッグ度合い
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
        //print(direction, finishPercentage)
         /*if (direction == SwipeResultDirection.right) {
            //let image = UIImageView(image: UIImage(named: "good.png"))
            //koloda.viewForCard(at: self.index)?.addSubview(image)
            //= UIColor(displayP3Red: finishPercentage / CGFloat(100), green: 0, blue: 0, alpha: finishPercentage / CGFloat(50) )
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
