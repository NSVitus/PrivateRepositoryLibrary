//
//  ViewController.swift
//  BaiduMapAPITestDemo
// 基于 swift 集成地图sdk
//  Created by 陈志中 on 16/3/8.
//  Copyright © 2016年 陈志中. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var _mapView: BMKMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _mapView = BMKMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.view.addSubview(_mapView!)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        _mapView?.viewWillAppear()
        _mapView?.delegate = nil // 此处记得不用的时候需要置nil，否则影响内存的释放
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        _mapView?.viewWillDisappear()
        _mapView?.delegate = nil // 不用时，置nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

