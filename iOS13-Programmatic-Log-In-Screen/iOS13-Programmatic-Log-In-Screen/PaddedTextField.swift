//
//  PaddedTextField.swift
//  iOS13-Programmatic-Log-In-Screen
//
//  Created by Paul Solt on 3/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class PaddedTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 1
        layer.cornerRadius = 4
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
}
