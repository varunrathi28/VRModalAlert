//
//  VRModalStatusView.swift
//  VRModalStatus
//
//  Created by Varun Rathi on 23/10/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

import UIKit

public class VRModalStatusView: UIView {
    
    
    @IBOutlet private weak var ivStatus:UIImageView!
    @IBOutlet private weak var lblHead:UILabel!
    @IBOutlet private weak var lblSubHead:UILabel!

    let nibName = "VRModalStatusView"
    var contentView:UIView!
    var timer:Timer!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         setUpView()
        
    }
    
    public func set(image:UIImage)
    {
        self.ivStatus.image = image
    }
    
    public func set(heading text:String)
    {
        self.lblHead.text = text
    }
    
    public func set(subHeading text:String)
    {
        self.lblSubHead.text = text
    }
    
    func setUpView()
    {
        let bundle  = Bundle(for: type(of: self))
        let nib  = UINib(nibName: nibName, bundle: bundle)
        self.contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        
        contentView.center = self.center
        contentView.autoresizingMask = []
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        lblHead.text = ""
        lblSubHead.text = ""
        
    }
    
    public override func didMoveToSuperview() {
        
        self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform.identity
        })
        { _ in
            
            self.timer = Timer.scheduledTimer(
                timeInterval: TimeInterval(3.0),
                target: self,
                selector: #selector(self.removeSelf),
                userInfo: nil,
                repeats: false)
        }
        
    }
    
    @objc private func removeSelf()
    {
        UIView.animate(withDuration: 0.15, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.contentView.alpha = 0.0
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    public override func layoutSubviews() {
        self.layoutIfNeeded()
        self.contentView.layer.masksToBounds = true
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 10
        
    }

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
