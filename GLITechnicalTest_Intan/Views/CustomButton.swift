//
//  CustomButton.swift
//  GLITechnicalTest_Intan
//
//  Created by Intan on 18/01/24.
//

import UIKit

class CustomButton: UIButton {
    init(title: String){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.layer.backgroundColor = .init(red: 126/255, green: 31/255, blue: 3/255, alpha: 1)
        
        let setColor: UIColor = .white
        self.setTitleColor(setColor, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
