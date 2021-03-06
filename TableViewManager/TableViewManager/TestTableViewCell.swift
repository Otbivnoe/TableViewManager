//
//  TestTableViewCell.swift
//  TableViewManager
//
//  Created by Nikita on 07/08/16.
//  Copyright © 2016 Nikita. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    typealias ViewModelType = TestViewModel
    
    var nameLabel: UILabel = {
       
        let label = UILabel()
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.yellow
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        nameLabel.frame = self.bounds
    }
    
}

extension TestTableViewCell : NUIViewModelBindingProtocol {
    
    func configureBy(_ viewModel: TestViewModel) {
        nameLabel.text = viewModel.name
    }
}
