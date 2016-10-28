//
//  DealCell.swift
//  Yelp
//
//  Created by Andy Jiang on 10/28/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol DealCellDelegate {
    @objc optional func dealCell(dealCell: DealCell, didChangeValue value: Bool)
}

class DealCell: UITableViewCell {

    @IBOutlet weak var dealSwitch: UISwitch!
    
    weak var delegate: DealCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dealSwitch.addTarget(self, action: #selector(DealCell.switchValueChanged), for: UIControlEvents.valueChanged)
    }

    func switchValueChanged() {
        delegate?.dealCell!(dealCell: self, didChangeValue: dealSwitch.isOn)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
