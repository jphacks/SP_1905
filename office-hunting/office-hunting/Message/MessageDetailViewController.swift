//
//  MessageDetailViewController.swift
//  office-hunting
//
//  Created by x on 2019/10/27.
//

import UIKit

class MessageDetailViewController: UIViewController {
    var titleText = ""
    var company = ""
    var companySub = ""
    var companyImage: UIImage? = nil
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companySubLabel: UILabel!
    @IBOutlet weak var companyIcon: UIImageView!
    
    @IBOutlet weak var titleBarItem: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyNameLabel.text = company
        companySubLabel.text = companySub
        companyIcon.image = companyImage
        
        titleBarItem.title = titleText
        self.contentView.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
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
