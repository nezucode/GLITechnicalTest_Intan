//
//  ViewController.swift
//  GLITechnicalTest_Intan
//
//  Created by Intan on 18/01/24.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - UI Components
    private let usernameField = CustomTextField(fieldType: .username)
    private let passwordField = CustomTextField(fieldType: .password)
    private let loginButton = CustomButton(title: "Login")
    
    private let imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        iv.image = UIImage(named: "jjklogo")
        iv.layer.cornerRadius = iv.frame.size.width / 2
        iv.clipsToBounds = true
        return iv
    }()
    
    private let imageViewJJK: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "jjk")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        setupUI()
        self.loginButton.addTarget(self, action: #selector(checkLogin), for: .touchUpInside)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var shouldAutorotate: Bool {
        return false
    }
    
    //MARK: - UI Setup
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(imageViewJJK)
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewJJK.translatesAutoresizingMaskIntoConstraints = false
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 88),
            self.imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 100),
            self.imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            self.imageViewJJK.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            self.imageViewJJK.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.imageViewJJK.widthAnchor.constraint(equalToConstant: 240),
            self.imageViewJJK.heightAnchor.constraint(equalTo: imageView.heightAnchor),
            
            self.usernameField.topAnchor.constraint(equalTo: imageViewJJK.bottomAnchor, constant: 28),
            self.usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 48),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),

            self.passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 16),
            self.passwordField.centerXAnchor.constraint(equalTo: usernameField.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 48),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 24),
            self.loginButton.centerXAnchor.constraint(equalTo: passwordField.centerXAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 48),
            self.loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    //MARK: - Selectors
    @objc func checkLogin(){
        if usernameField.text == "" || passwordField.text == "" {
            let showInfo = UIAlertController(title: "Error", message: "Username atau password tidak boleh kosong!", preferredStyle: .alert)
            showInfo.addAction(UIAlertAction(title: "OK", style: .default))
            present(showInfo, animated: true)
        } else if usernameField.text == "alfagift-admin" && passwordField.text == "asdf" {
            let ls = ListsofStudentViewController()
            let navVC = UINavigationController(rootViewController: ls)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        } else {
            let showInfo = UIAlertController(title: "Gagal Login", message: "Username atau password yang anda masukkan salah. Coba lagi.", preferredStyle: .alert)
            showInfo.addAction(UIAlertAction(title: "OK", style: .default))
            present(showInfo, animated: true)
        }
    }
    
}

