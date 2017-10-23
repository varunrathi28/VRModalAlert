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
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(image:UIImage)
    {
        self.ivStatus.image = image
    }
    
    public func set(heading text:String)
    {
        self.lblHead.text = text
    }
    
    func set(subHeading text:String)
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
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
