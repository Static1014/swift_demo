//
//  ViewController.swift
//  swift_demo
//
//  Created by 熊健 on 15/4/9.
//  Copyright (c) 2015年 static. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfLeft_: UITextField!
    @IBOutlet weak var tfRight_: UITextField!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lblResult_: UILabel!
    
    @IBAction func clickBtn(sender: UIButton) {
        self.editEnd(sender)
        
        let l = tfLeft_.text.toInt()
        let r = tfRight_.text.toInt()
        if l != nil && r != nil {
            lblResult_.text = "\(l!+r!)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func editEnd(sender: AnyObject) {
        tfLeft_.resignFirstResponder()
        tfRight_.resignFirstResponder()
    }
    @IBAction func clickScreen(sender: AnyObject) {
        tfLeft_.resignFirstResponder()
        tfRight_.resignFirstResponder()
    }

}

