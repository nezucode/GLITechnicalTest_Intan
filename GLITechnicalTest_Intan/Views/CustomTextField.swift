//
//  CustomTextField.swift
//  GLITechnicalTest_Intan
//
//  Created by Intan on 18/01/24.
//

import UIKit

class CustomTextField: UITextField {
    enum CustomTextFieldType {
        case username
        case password
    }
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType){
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .username:
            self.placeholder = "Username"
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
