//
//  CalloutView.swift
//  office-hunting
//
//  Created by x on 2019/10/26.
//

import UIKit

class SpeechBalloonView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = UIColor.clear;
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let line = UIBezierPath()
        line.move(to: CGPoint(x: rect.midX, y: rect.maxY * 6 / 10))
        line.addLine(to: CGPoint(x: rect.midX * 5 / 6, y: rect.maxY * 7 / 10))
        line.addLine(to: CGPoint(x: rect.midX * 7 / 6, y: rect.maxY * 7 / 10))
        
        line.addLine(to: CGPoint(x: rect.midX , y: rect.maxY * 6 / 10) )
        
        line.close()
        
        UIColor.orange.setFill()
        
        line.fill()
        
        UIColor.orange.setStroke()
        
        line.stroke()
        
        let view = UIView(frame: CGRect(x: rect.minX, y: rect.maxY * 7 / 10, width: rect.width, height: rect.height * 4 / 10) )
        
        view.backgroundColor = UIColor.orange
        
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.addSubview(view)
    }
}
