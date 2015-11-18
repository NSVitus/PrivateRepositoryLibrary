//
//  ViewController.swift
//  GifLoginSwift
//
//  Created by 陈志中 on 15/11/18.
//  Copyright © 2015年 陈志中. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var filePath:String? = nil
    
    var jpg:NSData? = nil
    
    
    required init?(coder aDecoder: NSCoder) {
        filePath = NSBundle.mainBundle().pathForResource("login", ofType: "jpg")
        jpg = NSData(contentsOfFile: filePath!)

        super.init(coder: aDecoder)
    }
    
    


    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
//        
//        let filePath = NSBundle.mainBundle().pathForResource("login", ofType: "jpg")
//        let jpg = NSData(contentsOfFile: filePath!)
        
        let webViewBG = UIWebView(frame: self.view.frame)
        webViewBG.loadData(jpg!, MIMEType: "image/jpg", textEncodingName: String(), baseURL: NSURL())
        webViewBG.userInteractionEnabled = false;
        self.view.addSubview(webViewBG)
        
        let filter = UIView()
        filter.frame = self.view.frame
        filter.backgroundColor = UIColor.blackColor()
        filter.alpha = 0.05
        self.view.addSubview(filter)
        
        let welcomeLabel = UILabel(frame: CGRectMake(0, 100, self.view.bounds.size.width, 100))
        welcomeLabel.text = "WELCOME"
        welcomeLabel.textColor = UIColor.whiteColor()
        welcomeLabel.font = UIFont.systemFontOfSize(50)
        welcomeLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(welcomeLabel)
        
        let loginBtn = UIButton(frame: CGRectMake(40, 360, 240, 40))
        loginBtn.layer.borderColor = UIColor.whiteColor().CGColor
        loginBtn.layer.borderWidth = 2
        loginBtn.titleLabel!.font = UIFont.systemFontOfSize(24)
        loginBtn.tintColor = UIColor.whiteColor()
        loginBtn.setTitle("Login", forState: UIControlState.Normal)
        self.view.addSubview(loginBtn)
        
        let signUpBtn = UIButton(frame: CGRectMake(40, 420, 240, 40))
        signUpBtn.layer.borderColor = UIColor.whiteColor().CGColor
        signUpBtn.layer.borderWidth = 2
        signUpBtn.titleLabel!.font = UIFont.systemFontOfSize(24)
        signUpBtn.tintColor = UIColor.whiteColor()
        signUpBtn.setTitle("Sign Up", forState: UIControlState.Normal)
        self.view.addSubview(signUpBtn)
        
    }
    
    
    
}

