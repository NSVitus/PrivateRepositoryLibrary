//
//  ViewController.swift
//  XibDemo
//
//  Created by 陈志中 on 15/11/12.
//  Copyright © 2015年 陈志中. All rights reserved.
//

import UIKit

class FileOwner:NSObject{
    
    @IBOutlet weak var view: UIView!
    
    
    
    override required  init(){
        super.init()
    }
    
    
    
    
    
    
    //    +(id)viewFromNibNamed:(NSString*) nibName {
    //    FileOwner *owner = [self new];
    //    [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:nil];
    //    return owner.view;
    //    }
    
    
    class func viewFromNibNamed(nibName:String) ->UIView {
        let owner = self.init()
        NSBundle.mainBundle().loadNibNamed(nibName, owner: owner, options: nil)
        
        return owner.view
        
    }
}
extension UIView{
    class func loadFromNibNamed(nibNamed:String)->UIView {
        return FileOwner.viewFromNibNamed(nibNamed)
    }
    class func loadFromNib()->UIView{
        return self.loadFromNibNamed(NSStringFromClass(self))
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var referenceView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //直接夹在xib中的UIView
        //View1 通过创建empty的user interface  owner为0 来添加
        var view = NSBundle.mainBundle().loadNibNamed("View1", owner: 0, options: nil)[0] as! UIView
        
        var r = view.frame
        
        r.origin.y += 80
        
        view.frame = r
        
        self.view.addSubview(view)
        
        //通过owner建立变量关联
        //View2通过创建empty的user interface  在viewcontroller创建没有连接的IBOutlet通过视图连接
        //连接后步骤跟view1 一样  不过owner改成了self 不用创建view可以直接用原先创建的referenceView属性
        NSBundle.mainBundle().loadNibNamed("View2", owner: self, options: nil)[0] as! UIView
        
        
        r = referenceView.frame
        
        r.origin.y += view.frame.size.height + view.frame.origin.y
        
        referenceView.frame = r
        
        self.view.addSubview(referenceView)
        
        
        //Class Owner简历变量关联
        let owner =  FileOwner()
        
        NSBundle.mainBundle().loadNibNamed("View3", owner: owner, options: nil)
        
        r = owner.view.frame;
        r.origin.y = referenceView.frame.origin.y + referenceView.frame.size.height
        owner.view.frame = r;
        
        self.view.addSubview(owner.view)
        
        
        //引入UIView Category
        //为什么用let可以？v4.frame = r常量值不是不能变嘛
        let v4 = View5.loadFromNibNamed("View4")
        
        r = v4.frame
        
        r.origin.y  = owner.view.frame.origin.y + owner.view.frame.height
        
        v4.frame = r
        
        self.view.addSubview(v4)
        
        
        //自定义ui类
        //        View5 *v5 = [View5 loadFromNib];
        //        r = v5.frame;
        //        r.origin.y = v4.frame.origin.y + v4.frame.size.height;
        //        v5.frame = r;
        //        [self.view addSubview:v5];
        let v5 = UIView.loadFromNibNamed("View5")
        r = v5.frame
        r.origin.y = v4.frame.origin.y + v4.frame.size.height
        v5.frame = r
        self.view.addSubview(v5)
        
//        UIView *v6 = [[UIViewController alloc] initWithNibName:@"View6" bundle:nil].view;
//        r = v6.frame;
//        r.origin.y = v5.frame.origin.y + v5.frame.size.height;
//        v6.frame = r;
//        [self.view addSubview:v6];
          let v6 = UIViewController.init(nibName: "View6", bundle: nil).view
          r = v6.frame
          r.origin.y = v5.frame.origin.y + v5.frame.size.height
          v6.frame = r
          self.view.addSubview(v6)
        
    }
    
    
    
    
    
}

