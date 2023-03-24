//
//  ViewController.swift
//  6homework3m
//
//  Created by mavluda on 24/3/23.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {

    var welcomeLabel = Additional().createLabel(size: 28, weight: .regular, color: .white, text: "Welcome")
    
    var loginLabel = Additional().createLabel(size: 20, weight: .regular, color: .gray, text: "Login to your account")
    
    var emailLabel = Additional().createLabel(size: 18, weight: .regular, color: .white, text: "Email")
    
    var passwordLabel = Additional().createLabel(size: 18, weight: .regular, color: .white, text: "Password")
    
    var forgotPasswordLabel = Additional().createLabel(size: 18, weight: .regular, color: .red, text: "Forgot Password?")
    
    var bottomLabel = Additional().createLabel(size: 18, weight: .regular, color: .darkGray, text: "Don't have account?")
    
    var eyePressed = true
    
    var emailField = Additional().createField(text: "Email", secureEntry: false)
    
    var passwordField = Additional().createField(text: "Password", secureEntry: true)
    
    
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
    
    var createNowButton: UIButton = {
        let view = UIButton()
        view.setTitle("Create now", for: .normal)
        view.setTitleColor(.gray, for: .normal)
        view.tintColor = .black
        view.addTarget(nil, action: #selector(createNowTapped(view:)), for: .touchUpInside)
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
        
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(topImage.snp.bottom).offset(51)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(loginLabel)
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(loginLabel.snp.bottom).offset(25)
        }
        
        view.addSubview(emailField)
        emailField.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(48)
        }
        
        view.addSubview(passwordLabel)
        passwordLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.top.equalTo(emailField.snp.bottom).offset(6)
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
        
        view.addSubview(forgotPasswordLabel)
        forgotPasswordLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.top.equalTo(passwordField.snp.bottom).offset(7)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordLabel.snp.bottom).offset(28)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(48)
        }
        
        view.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(49)
        }
        
        view.addSubview(createNowButton)
        createNowButton.snp.makeConstraints { make in
            make.centerY.equalTo(bottomLabel)
            make.left.equalTo(bottomLabel.snp.right).offset(3)
        }
        
        let leftImage: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "Google")
            return view
        }()
        let centerImage: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "Facebook")
            return view
        }()
        let rightImage: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: "Instagram")
            return view
        }()
        view.addSubview(centerImage)
        centerImage.snp.makeConstraints { make in
            make.height.width.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(bottomLabel.snp.bottom).offset(50)
        }
        view.addSubview(leftImage)
        leftImage.snp.makeConstraints { make in
            make.right.equalTo(centerImage.snp.left).offset(-42)
            make.centerY.equalTo(centerImage)
        }
        view.addSubview(rightImage)
        rightImage.snp.makeConstraints { make in
            make.left.equalTo(centerImage.snp.right).offset(42)
            make.centerY.equalTo(centerImage)
        }
    }
    
    
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
        if !emailField.hasText || !passwordField.hasText{
            if !emailField.hasText{
                emailField.layer.borderColor = UIColor.red.cgColor
                emailField.layer.borderWidth = 1
                emailField.placeholder = "Fill the field"
            }
            if !passwordField.hasText{
                passwordField.layer.borderColor = UIColor.red.cgColor
                passwordField.layer.borderWidth = 1
                passwordField.placeholder = "Fill the field"
            }
            
        }
    }
    
    @objc func createNowTapped(view: UIButton) {
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
    }
}

