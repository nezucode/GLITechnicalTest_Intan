//
//  ListsofStudentViewController.swift
//  GLITechnicalTest_Intan
//
//  Created by Intan on 18/01/24.
//

import UIKit

class ListsofStudentViewController: UIViewController {
    private let cells = [
        Student(image: "geto", name: "Suguru Geto", address: "Pine Street, Seattle"),
        Student(image: "gojo", name: "Satoru Gojo", address: "Bellevue Square, Bellevue"),
        Student(image: "nanami", name: "Nanami Kento", address: "W. Main Avenue, Spokane"),
        Student(image: "toji", name: "Fushiguro Toji", address: "Mall Parkway, Lynnwood"),
        Student(image: "sukuna", name: "Ryomen Sukuna", address: "Cross Creek Road, Malibu"),
        Student(image: "yuuji", name: "Yuji Itadori", address: "Kuhio Avenu, Honolulu"),
        Student(image: "yuta", name: "Yuta Okkotsu", address: "E. 1st Avenue, Denver"),
        Student(image: "shoko", name: "Shoko Ieri", address: "S. State Street, Murray"),
        Student(image: "megumi", name: "Fushiguro Megumi", address: "Morrison Street, Portland"),
        Student(image: "toge", name: "Inumaki Toge", address: "Evergreen Parkway, Beaverton")
    ]
    
    //MARK: - UI Components
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        return tv
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "jjklogo")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let titleSchoolName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Tokyo Metropolitan Curse Technical College"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private let titleName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "List of Students"
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        setupUI()
    }
    
    
    //MARK: - UI Setup
    private func setupUI(){
        self.view.addSubview(imageView)
        self.view.addSubview(titleName)
        self.view.addSubview(titleSchoolName)
        self.view.addSubview(tableView)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.titleName.translatesAutoresizingMaskIntoConstraints = false
        self.titleSchoolName.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            self.imageView.heightAnchor.constraint(equalToConstant: 48),
            self.imageView.widthAnchor.constraint(equalToConstant: 48),
            
            self.titleSchoolName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            self.titleSchoolName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            self.titleSchoolName.widthAnchor.constraint(equalToConstant: 240),
            
            self.titleName.topAnchor.constraint(equalTo: titleSchoolName.bottomAnchor, constant: 32),
            self.titleName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            
            self.tableView.topAnchor.constraint(equalTo: self.titleName.bottomAnchor, constant: 16),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension ListsofStudentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("Unable error.")
        }
        let itemCell = cells[indexPath.item]
        cell.student = itemCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
