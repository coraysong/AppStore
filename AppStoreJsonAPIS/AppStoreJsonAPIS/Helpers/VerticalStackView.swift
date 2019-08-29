//
//  VerticalStackView.swift
//  AppStoreJsonAPIS
//
//  Created by 宋超 on 2019/7/8.
//  Copyright © 2019 宋超. All rights reserved.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews:[UIView], spacing:CGFloat = 0) {
        super.init(frame: .zero)
        self.spacing = spacing
        self.axis = .vertical
        arrangedSubviews.forEach({addArrangedSubview($0)})
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
