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
    var msgData:[String] = ["ff"]
    @IBOutlet weak var msgTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavImage()
        
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
          return 4//self.msgData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.allowsSelection = false
        if self.msgData.count == 0 {
          tableView.isScrollEnabled = false
          let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath) as! EmptyTableViewCell
          return cell
        }else{
          let cell = tableView.dequeueReusableCell(withIdentifier: "msgCell", for: indexPath as IndexPath) as! MessageTableViewCell
            cell.companyName.text = "工藤株式会社"
            cell.companyName.font = UIFont(name: "Roboto-Bold", size: 14)
            cell.companySub.text = "ようこそ"
            cell.postDate.text = "2019/10/26"
            cell.companyIcon.image = UIImage(named: "dummyicon.png")
          return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       if self.msgData.count == 0 {
         return 760
       }else{
        return 190
        }
        
       // return 44
    }
    
    

    func setNavImage(){
        self.navigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
