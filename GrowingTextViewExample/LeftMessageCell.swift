//
//  LeftMessageCell.swift
//  GrowingTextViewExample
//
//  Created by 洪鑫 on 16/2/17.
//  Copyright © 2016年 Teambition. All rights reserved.
//

import UIKit

let kLeftMessageCellID = "LeftMessageCell"
private let leftPadding: CGFloat = 20
private let rightPadding: CGFloat = UIScreen.main.bounds.width / 4

class LeftMessageCell: UITableViewCell {
    @IBOutlet weak var contentLabel: MessageLabel!
    @IBOutlet weak var contentLabelTrainingSpace: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        contentLabel.layer.masksToBounds = true
        contentLabel.layer.cornerRadius = 6
    }

    class func rowHeight(for message: String) -> CGFloat {
        return contentLabelFrame(for: message).height + 15
    }

    class func trainingSpace(for message: String) -> CGFloat {
        return UIScreen.main.bounds.width - leftPadding - contentLabelFrame(for: message).width
    }

    fileprivate class func contentLabelFrame(for message: String) -> CGRect {
        guard message.characters.count > 0 else {
            return CGRect.zero
        }
        let messageString = message as NSString
        let size = CGSize(width: UIScreen.main.bounds.width - leftPadding - rightPadding, height: CGFloat.greatestFiniteMagnitude)
        let frame = messageString.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)], context: nil)
        return CGRect(x: ceil(frame.origin.x), y: ceil(frame.origin.y), width: ceil(frame.width) + kMessageLabelPadding * 2.0, height: ceil(frame.height))
    }
}
