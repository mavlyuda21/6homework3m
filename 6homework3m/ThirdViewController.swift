//
//  ThirdViewController.swift
//  6homework3m
//
//  Created by mavluda on 24/3/23.
//

import UIKit
import SnapKit

class ThirdViewController: UIViewController {

    var email = ""
    
    var forgotLabel = Additional().createLabel(size: 28, weight: .regular, color: .white, text: "Forgot password")
    var emailLabel = Additional().createLabel(size: 20, weight: .regular, color: .white, text: "Enter your email")
    var chooseLabel = Additional().createLabel(size: 18, weight: .regular, color: .white, text: "Choose Another Method")
    var needLabel = Additional().createLabel(size: 18, weight: .regular, color: .white, text: "Need help?")
    
    var emailField = Additional().createField(text: "", secureEntry: false)
    
    var sendOTPButton: UIButton = {
        let view = UIButton()
        view.setTitle("Send OTP", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(red: 41/255, green: 182/255, blue: 246/255, alpha: 1)
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        emailField.text = email
        layoutViews()
    }

    private func layoutViews(){
        let topImage: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "Rectangle 98")
            return view
        }()
        
        view.addSubview(topImage)
        topImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        view.addSubview(forgotLabel)
        forgotLabel.snp.makeConstraints { make in
            make.top.equalTo(topImage.snp.bottom).offset(51)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(forgotLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        
        view.addSubview(chooseLabel)
        chooseLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(30)
            make.top.equalTo(emailField.snp.bottom).offset(7)
        }
        view.addSubview(needLabel)
        needLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(emailField.snp.bottom).offset(7)
        }
        
        view.addSubview(sendOTPButton)
        sendOTPButton.snp.makeConstraints { make in
            make.top.equalTo(needLabel.snp.bottom).offset(22)
            make.height.equalTo(48)
            make.left.right.equalToSuperview().inset(47)
        }
    }
}
