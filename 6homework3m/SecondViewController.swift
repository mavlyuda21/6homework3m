//
//  SecondViewController.swift
//  6homework3m
//
//  Created by mavluda on 24/3/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    var registerLabel = Additional().createLabel(size: 28, weight: .regular, color: .white, text: "Register")
    
    var createNewLabel = Additional().createLabel(size: 20, weight: .regular, color: .white, text: "Create new account")
    
    var usernameField = Additional().createField(text: "Username", secureEntry: false)
    
    var usernameLabel = Additional().createLabel(size: 18, weight: .regular, color: .white, text: "Username")
    
    var emailField = Additional().createField(text: "Email", secureEntry: false)
    
    var emailLabel = Additional().createLabel(size: 18, weight: .regular, color: .white, text: "Email")
    
    var mobileNumberField = Additional().createField(text: "Mobile Number", secureEntry: false)
    
    var mobileNumberLabel = Additional().createLabel(size: 18, weight: .regular, color: .white, text: "Mobile Number")
    
    var passwordField = Additional().createField(text: "Password", secureEntry: true)
    
    var passwordLabel = Additional().createLabel(size: 18, weight: .regular, color: .white, text: "Password")
    
    var eyeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "eye"), for: .normal)
        view.addTarget(nil, action: #selector(eyeButtonTapped(view:)), for: .touchUpInside)
        view.tintColor = .gray
        return view
    }()
    
    var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(red: 41/255, green: 182/255, blue: 246/255, alpha: 1)
        view.isUserInteractionEnabled = true
        view.layer.cornerRadius = 20
        view.addTarget(nil, action: #selector(loginButtonTapped(view:)), for: .touchUpInside)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
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
        
        view.addSubview(registerLabel)
        registerLabel.snp.makeConstraints { make in
            make.top.equalTo(topImage.snp.bottom).offset(51)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(createNewLabel)
        createNewLabel.snp.makeConstraints { make in
            make.top.equalTo(registerLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(createNewLabel.snp.bottom).offset(25)
        }
        
        view.addSubview(usernameField)
        usernameField.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(usernameField.snp.bottom).offset(6)
        }
        
        view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        
        view.addSubview(mobileNumberLabel)
        mobileNumberLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(emailField.snp.bottom).offset(6)
        }
        
        view.addSubview(mobileNumberField)
        mobileNumberField.snp.makeConstraints { make in
            make.top.equalTo(mobileNumberLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        
        view.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(mobileNumberField.snp.bottom).offset(6)
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        
        passwordField.addSubview(eyeButton)
        eyeButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.width.equalTo(36)
            make.height.equalTo(32)
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordField.snp.bottom).offset(26)
            make.height.equalTo(48)
            make.left.right.equalToSuperview().inset(30)
        }
        
    }
    
    private func checkTextField(_ field: UITextField){
        if field.text?.isEmpty ?? true{
            field.layer.borderColor = UIColor.red.cgColor
            field.layer.borderWidth = 1
            field.placeholder = "Заполните поле"
        }
    }
    
    var eyePressed = true
    
    @objc func eyeButtonTapped(view: UIButton) {
        var image = ""
        if eyePressed{
            image = "eye.slash"
            eyeButton.setImage(UIImage(systemName: image), for: .normal)
            eyeButton.tintColor = .systemGray2
            eyePressed = false
            passwordField.isSecureTextEntry = true
        }else{
            image = "eye"
            eyeButton.setImage(UIImage(systemName: image), for: .normal)
            eyePressed = true
            passwordField.isSecureTextEntry = false
        }
    }

    @objc func loginButtonTapped(view: UIButton) {
        if usernameField.text?.isEmpty ?? true || emailField.text?.isEmpty ?? true || mobileNumberField.text?.isEmpty ?? true || passwordField.text?.isEmpty ?? true{
            checkTextField(usernameField)
            checkTextField(mobileNumberField)
            checkTextField(emailField)
            checkTextField(passwordField)
        }else{
            let vc = ThirdViewController()
            vc.email = emailField.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

}
