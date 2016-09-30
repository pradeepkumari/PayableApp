//
//  HistoryTableViewCell.swift
//  payableApp
//
//  Created by apple on 28/09/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var topView: UIView!
        @IBOutlet weak var usdImageView: UIImageView!
        @IBOutlet weak var transId: UILabel!
        @IBOutlet weak var transactionTime: UILabel!
        @IBOutlet weak var emptySpaceView: UIView!
    
        @IBOutlet weak var bottomView: UIView!
        @IBOutlet weak var baseViewForBottomView: UIView!
        @IBOutlet weak var totalAmtBtm: UILabel!
        @IBOutlet weak var transIdBottomView: UILabel!
        @IBOutlet weak var threePinImage: UIImageView!
        @IBOutlet weak var creditedAmtValue: UILabel!
        @IBOutlet weak var serviceChargeValue: UILabel!
        @IBOutlet weak var transTimeBottomView: UILabel!
        @IBOutlet weak var cardTypeImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
