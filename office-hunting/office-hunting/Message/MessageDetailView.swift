//
//  MessageDetailView.swift
//  office-hunting
//
//  Created by x on 2019/10/27.
//

import UIKit

class MessageDetailView: UIView {

    @IBOutlet weak var adCompanyTitle: UILabel!
    @IBOutlet weak var adTextForm: UILabel!

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init (frame: CGRect, adCompanyTitle: String, adTextForm: String ){
        super.init(frame: frame)
        
        self.adCompanyTitle.text = adCompanyTitle
        self.adTextForm.text = adTextForm
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
}
