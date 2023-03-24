//
//  Additional.swift
//  6homework3m
//
//  Created by mavluda on 24/3/23.
//

import Foundation
import UIKit

class Additional{
    
    func createLabel(size: CGFloat, weight: UIFont.Weight, color: UIColor, text: String)-> UILabel{
        var label: UILabel = {
            let view = UILabel()
            view.font = .systemFont(ofSize: size, weight: weight)
            view.textColor = color
            view.text = text
            return view
        }()
        
        return label
    }
    
    func createField(text: String,secureEntry: Bool)-> UITextField{
        var label: UITextField = {
            let view = UITextField()
            view.placeholder = text
            view.backgroundColor = .white
            view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            view.leftViewMode = .always
            view.layer.cornerRadius = 5
            view.isSecureTextEntry = secureEntry
            return view
        }()
        
        return label
    }
}
