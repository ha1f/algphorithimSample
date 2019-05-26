//
//  SortViewController.swift
//  algphorithimSample
//
//  Created by はるふ on 2019/05/26.
//  Copyright © 2019 はるふ. All rights reserved.
//

import UIKit

final class SortViewController: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    func handleChange(_ text: String) {
        label.text = text
    }
}

extension SortViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        handleChange(newText)
        return true
    }
}


final class AViewController: UIViewController {
}
    
extension AViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        return (textField.text?.count ?? 0) <= 3
    }
}
