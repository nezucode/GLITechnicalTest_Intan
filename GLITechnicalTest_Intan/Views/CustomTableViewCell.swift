//
//  CustomTableViewCell.swift
//  GLITechnicalTest_Intan
//
//  Created by Intan on 18/01/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "StudentCustomTableViewCell"
    
    var student: Student? {
        didSet {
            guard let unwrappedStudent = student else { return }
            studentImageView.image = UIImage(named: unwrappedStudent.image)
            studentName.text = unwrappedStudent.name
            studentAddress.text = unwrappedStudent.address
        }
    }
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.systemGray4.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 5.0
        view.layer.shouldRasterize = true
        return view
    }()
    
    private let studentImageView: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 16, y: 16, width: 64, height: 64))
        img.layer.cornerRadius = img.frame.size.width / 2
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
//        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let studentName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let studentAddress: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.addSubview(cellView)
        cellView.addSubview(studentImageView)
        cellView.addSubview(studentName)
        cellView.addSubview(studentAddress)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = cellView.frame.size.height
        let viewWidth = self.frame.size.width
        let heightWidth = self.frame.size.height
        cellView.frame = CGRect(x: viewWidth - cellView.frame.size.width - 10,
                                y: heightWidth - imageWidth - 9,
                                width: self.frame.width - 20,
                                height: 98)
        
        studentImageView.frame = CGRect(x: 16,
                                        y: cellView.frame.size.height - 81,
                                        width: 64,
                                        height: 64)
        
        studentName.frame = CGRect(x: imageWidth,
                                   y: 12,
                               width: cellView.frame.size.width-imageWidth,
                               height: cellView.frame.size.height/2)

        studentAddress.frame = CGRect(x: imageWidth,
                                y: 38,
                                width: 240,
                                height: cellView.frame.size.height/2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
