//
//  LocalAccessbility - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
        
    private func addBottomLabel() {
        
        let bottomLabel = UILabel()
        bottomLabel.frame = CGRect(x: 20, y: view.bounds.size.height - 150, width: view.bounds.size.width - 40, height: 50)
        
        bottomLabel.text = "Touch the button below!"
        bottomLabel.text = String(format: NSLocalizedString("Touch the button below!", comment: "인사"))
        
        bottomLabel.font = UIFont.systemFont(ofSize: 20)
        
        bottomLabel.textColor = .red
        
        bottomLabel.textAlignment = .center
        
        view.addSubview(bottomLabel)
    }
    
    private func addButton() {
        // Do any additional setup after loading the view.
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 20, y: view.bounds.size.height - 80, width: view.bounds.size.width - 40, height: 50)
        
        button.setTitle("Touch Me!", for: .normal)
        button.setTitle(String(format: NSLocalizedString("Touch Me!", comment: "ds")), for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)

        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomLabel()
        addButton()
        
        
        dateTimeLabel.text = Date().description
    }
    
    @objc func tapButton() {
        currency()
        date()
    }
    
    func currency() {
        let locale = Locale.current
        let price = 3000.33 as NSNumber
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.currencyCode = locale.currencyCode
        formatter.locale = locale
        
        currencyLabel.text = formatter.string(from: price)
    }
    
    func date() {
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        
        dateTimeLabel.text = date
    }
}
