//
//  ViewController.swift
//  SnapKit02
//
//  Created by Catia Miranda de Souza on 27/01/20.
//  Copyright © 2020 Catia Miranda de Souza. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    let tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 100
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupView()
    }

    func setup(){
        view.backgroundColor = .white
        title = "Example 02"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func setupView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.custmCell)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.custmCell, for: indexPath)as! CustomCell
        return cell
    }
    

}
class CustomCell: UITableViewCell {
    
    static var custmCell = "cell"
    
    let customImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "imagem")
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        return iv
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //self.backgroundColor = .blue
        setupViews()
    }
    func setupViews(){
        self.addSubview(customImageView)
        customImageView.snp.makeConstraints { (make) in
            make.top.left.equalTo(20)
            make.right.bottom.equalTo(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
   
}
