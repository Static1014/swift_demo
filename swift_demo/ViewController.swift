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
    @IBOutlet weak var tvContent: UITextView!
    @IBOutlet weak var ivImg: UIImageView!
    @IBOutlet weak var pvCycle: UIProgressView!
    
    @IBOutlet weak var csContentWidth: NSLayoutConstraint!
    
    var imgArr:[UIImage] = [UIImage]()
    //    var _index = 0
    //    var index:Int {
    //        get {
    //            return _index
    //        } set {
    //            _index = newValue
    //            if _index < 0 {
    //                _index += 3
    //            } else if _index > 2 {
    //                _index -= 3
    //            }
    //        }
    //    }
    
    @IBAction func clickBtn(sender: UIButton) {
        self.editEnd(sender)
        
        var l = (tfLeft_.text as NSString).floatValue;
        var r = (tfRight_.text as NSString).floatValue;
        lblResult_.text = String(format: "%.2f", l+r)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        初始化TextView的选中菜单和菜单点击事件()
        初始化ImageView的自动轮播()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        switch fromInterfaceOrientation {
        case UIInterfaceOrientation.Portrait, UIInterfaceOrientation.PortraitUpsideDown, UIInterfaceOrientation.Unknown:
            println("111111111")
            设置ScrollView的Content宽度(true)
        case UIInterfaceOrientation.LandscapeLeft, UIInterfaceOrientation.LandscapeRight:
            println("22222222")
            设置ScrollView的Content宽度(false)
        default:
            println("33333")
            设置ScrollView的Content宽度(false)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        设置ScrollView的Content宽度(false)
    }
    
    func 设置ScrollView的Content宽度(是横屏: Bool) {
        csContentWidth.constant = (是横屏 ? screen.height : screen.width) - 30
        //        UIView.animateWithDuration(1, animations: { () -> Void in
        self.view.layoutIfNeeded()
        //        })
    }
    
    func 初始化ImageView的自动轮播() {
        for i in 1...4 {
            let image = UIImage(named: "img\(i).png")
            imgArr.append(image!)
        }
        ivImg.animationImages = imgArr
        ivImg.animationDuration = NSTimeInterval(1 * imgArr.count) // 一次循环需要的时间
        ivImg.animationRepeatCount = 0
        ivImg.startAnimating()
        
        pvCycle.progress = 0.25
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "onTimer", userInfo: nil, repeats: true)
    }
    
    func onTimer() {
        let step:Float = 0.25/20
        if pvCycle.progress >= 1 {
            pvCycle.progress = 0.0
        } else {
            pvCycle.progress += step
        }
    }
    
    func 初始化TextView的选中菜单和菜单点击事件() {
        var mailMenu = UIMenuItem(title: "Email", action: "onMail")
        var wxMenu = UIMenuItem(title: "WeChat", action: "onWeChat")
        var wbMenu = UIMenuItem(title: "Sina", action: "onSina")
        var menu = UIMenuController()
        menu.menuItems = NSArray(array: [mailMenu, wxMenu, wbMenu])
    }
    
    func onMail() {
        var str = (tvContent.text as NSString).substringWithRange(tvContent.selectedRange)
        println("onMail --- \(str)")
    }
    func onWeChat() {
        var str = (tvContent.text as NSString).substringWithRange(tvContent.selectedRange)
        println("onWeChat --- \(str)")
    }
    func onSina() {
        var str = (tvContent.text as NSString).substringWithRange(tvContent.selectedRange)
        println("onSina --- \(str)")
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

