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
        nextVC.companySub = """
        こんにちは！株式会社Cookpadです。この度はオフィカツでのいいね！ありがとうございました。

        Cookpadの企業理念は「毎日の料理を楽しみにする」です！！

        個人と社会と地球がかかえるさまざまな課題を、
        料理をとおして見つけ、考え、解決する。そして、これからの時代にふさわしい豊かさをつくっていく。それが私たちクックパッドの使命です。

        今後、インターンや採用情報なども随時お知らせいたします！詳しい情報はぜひ、弊社HPをご覧ください。

        よろしくお願いいたします！！
        """
        nextVC.companyImage = self.companyIcon.image
        vc!.present(nextVC, animated: true, completion: nil)
        
    }
    
}
