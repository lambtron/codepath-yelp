//
//  SortCell.swift
//  Yelp
//
//  Created by Andy Jiang on 10/28/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SortCellDelegate {
    @objc optional func sortCell(sortCell: SortCell, didChangeValue value: Int)
}

class SortCell: UITableViewCell {

    @IBOutlet weak var sortSegmentControl: UISegmentedControl!
    
    weak var delegate: SortCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        sortSegmentControl.addTarget(self, action: #selector(SortCell.segmentValueChanged), for: UIControlEvents.valueChanged)
    }
    
    func segmentValueChanged() {
        delegate?.sortCell!(sortCell: self, didChangeValue: sortSegmentControl.selectedSegmentIndex)
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
