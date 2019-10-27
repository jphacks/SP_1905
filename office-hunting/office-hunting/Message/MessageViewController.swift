//
//  MessageViewController.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/26.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class MessageViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var msgData:[String] = ["ff"]
    let db = Firestore.firestore()
    @IBOutlet weak var msgTable: UITableView!
        
    @IBOutlet weak var door: UIBarButtonItem!
    @IBAction func doorButtonAction(_ sender: Any) {
        let sb = UIStoryboard(name: "TinderStoryboard", bundle: nil)
               let tinderViewController = sb.instantiateInitialViewController()
               tinderViewController?.modalPresentationStyle = .fullScreen
               
               self.present(tinderViewController!, animated: true, completion: nil)
    }
    
    var dmodel = [dataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = makeMidButton()
        
        self.msgTable.delegate = self
        self.msgTable.dataSource = self
        self.msgTable.separatorStyle = .none
        self.msgTable.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "emptyCell")
        self.msgTable.register(UINib(nibName: "MessageTableViewCell", bundle: nil), forCellReuseIdentifier: "msgCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    
    func makeMidButton() -> UIButton{
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.setBackgroundImage(UIImage(named: "message"), for: .normal)
        
        return button
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dmodel.count == 0 {
            return 1
        }else{
            return self.dmodel.count
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
       
                
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.allowsSelection = false
        if dmodel.count == 0 {
            tableView.isScrollEnabled = false
            let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath) as! EmptyTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "msgCell", for: indexPath as IndexPath) as! MessageTableViewCell
            cell.companyName.text = "工藤株式会社"
            cell.companyName.font = UIFont(name: "Roboto-Bold", size: 14)
            if dmodel.count > 0 {
                cell.companySub.text = (dmodel[indexPath.row].adCompanyTitle ?? "") + "が届きました"
                cell.adText = dmodel[indexPath.row].adTextForm ?? ""
            }
            cell.postDate.text = "2019/10/26"
            cell.companyIcon.image = UIImage(named: "FUN_logo.png")
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.dmodel.count == 0 {
            return 760
        }else{
            return 190
        }
        
        // return 44
    }
    
    func getData(){
        db.collection("msg").getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.get("adCompanyTitle")
                    let inText = document.get("adTextForm")
                    self.dmodel.append(dataModel(adCompanyTitle: data as! String, adTextForm: inText as! String))
                }
                self.msgTable.reloadData()
            }
        }
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
