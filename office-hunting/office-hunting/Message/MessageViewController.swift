//
//  MessageViewController.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/26.
//

import UIKit

class MessageViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var messageImage: UIImage!
    var centerImage: UIImageView!
    var msgData:[String] = []
    @IBOutlet weak var msgTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setNavImage()
        
        self.messageImage = UIImage(named: "message.png")
        self.centerImage = UIImageView(image: messageImage)
        self.navigationItem.titleView = centerImage
        
        self.msgTable.delegate = self
        self.msgTable.dataSource = self
        
        self.msgTable.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "emptyCell")
        self.msgTable.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "msgCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.msgData.count == 0 {
          return 1
        }else{
          return self.msgData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //test
        if self.msgData.count == 0 {
          tableView.isScrollEnabled = false
          tableView.allowsSelection = false
          let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath) as! EmptyTableViewCell
          return cell
        }else{
          let cell = tableView.dequeueReusableCell(withIdentifier: "msgCell", for: indexPath as IndexPath) as! MessageTableViewCell
          return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       if self.msgData.count == 0 {
         return 760
       }
        
        return 44
    }
    
    
    
//    func setNavImage(){
//        self.messageImage = UIImage(named: "message.png")
//        self.centerImage = UIImageView(image: messageImage)
//        self.navigationItem.titleView = centerImage
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
