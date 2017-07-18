//
//  CollapsibleOrderDetailTableViewHeader.swift
//  Foodle
//
//  Created by devcraft12 on 7/17/17.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import Foundation
import UIKit

protocol CollapsibleOrderDetailTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleOrderDetailTableViewHeader, section: Int)
}

class CollapsibleOrderDetailTableViewHeader: UITableViewHeaderFooterView {
    
    var delegate: CollapsibleOrderDetailTableViewHeaderDelegate?
    var section: Int = 0
    
    let titleLabel = UILabel()
    var priceLabel = UILabel()
    let arrowLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(arrowLabel)
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleOrderDetailTableViewHeader.tapHeader(_:))))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .white
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        priceLabel.textColor = ColorRes.colorDarkRed
        
        
        let views = [
            "titleLabel" : titleLabel,
            "priceLabel" : priceLabel,
            "arrowLabel" : arrowLabel,
        ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-20-[titleLabel]-[priceLabel]-20-[arrowLabel]-20-|",
            options: [],
            metrics: nil,
            views: views
        ))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[titleLabel]-|",
            options: [],
            metrics: nil,
            views: views
        ))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[priceLabel]-|",
            options: [],
            metrics: nil,
            views: views
        ))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[arrowLabel]-|",
            options: [],
            metrics: nil,
            views: views
        ))
    }
    
    func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleOrderDetailTableViewHeader else {
            return
        }
        
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        //
        // Animate the arrow rotation (see Extensions.swf)
        //
        arrowLabel.rotate(collapsed ? 0.0 : CGFloat(M_PI_2))
    }
}

extension UIView {
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
    
}
