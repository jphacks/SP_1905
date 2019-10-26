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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapMessageDetail(_ sender: UIButton) {
        print("tap")
    }
    
}
