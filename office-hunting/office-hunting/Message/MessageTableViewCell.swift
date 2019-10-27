//
//  MessageTableViewCell.swift
//  office-hunting
//
//  Created by 山田楓也 on 2019/10/26.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var companyIcon: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companySub: UILabel!
    @IBOutlet weak var postDate: UILabel!
    var adText = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func parentViewController() -> UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }
    
    @IBAction func tapMessageDetail(_ sender: UIButton) {
        print("tap")
        let vc = parentViewController()
        let nextVC = UIStoryboard(name: "Message", bundle: nil).instantiateViewController(identifier: "MessageDetailViewController") as MessageDetailViewController
        nextVC.company = self.companySub.text!
        //nextVC.companySub = self.companySub.text!
        nextVC.titleText = self.companyName.text!
        nextVC.companySub = adText
        nextVC.companyImage = self.companyIcon.image
        vc!.present(nextVC, animated: true, completion: nil)
        
    }
    
}
