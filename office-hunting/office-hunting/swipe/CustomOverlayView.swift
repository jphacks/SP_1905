//
//  CustomOverlayView.swift
//  Koloda
//
//  Created by Eugene Andreyev on 7/27/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "yes.png"
private let overlayLeftImageName = "bad.png"

class CustomOverlayView: OverlayView {
    
    @IBOutlet lazy var overlayImageView: UIImageView! = {
    [unowned self] in
    
    var imageView = UIImageView(frame: self.bounds)
    self.addSubview(imageView)
    
    return imageView
    }()
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 15
    }
    
    override var overlayState: SwipeResultDirection?  {
        didSet {
            switch overlayState {
            case .left? :
                overlayImageView.image = UIImage(named: overlayLeftImageName)
            case .right? :
                overlayImageView.image = UIImage(named: overlayRightImageName)
            default:
                overlayImageView.image = nil
            }
            
        }
    }

}
