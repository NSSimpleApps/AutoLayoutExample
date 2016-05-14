//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by NSSimpleApps on 14.05.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var cornerRadiusFactor: CGFloat = 0
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace,
                                            target: nil,
                                            action: nil)
        
        let barButtonItem = UIBarButtonItem(title: "Item",
                                            style: .Plain,
                                            target: nil,
                                            action: nil)
        
        self.setToolbarItems([flexibleSpace, barButtonItem, flexibleSpace],
                             animated: false)
        
        self.button1.layer.cornerRadius = 12.5
        
        self.button2.layer.cornerRadius = 12.5
        self.button2.addTarget(self, action: #selector(self.showToolBarAction(_:)), forControlEvents: .TouchUpInside)
        
        self.cornerRadiusFactor = self.button1.layer.cornerRadius / self.button1.frame.height
    }
    
    @IBAction func button1Action(sender: UIButton) {
        
        print(sender.frame.height)
        print(sender.superview!.frame.height)
        print(self.topLayoutGuide.length, self.bottomLayoutGuide.length)
    }
    
    func showToolBarAction(sender: UIButton) {
        
        sender.setTitle("Hide Tool Bar", forState: .Normal)
        sender.removeTarget(self, action: #function, forControlEvents: .TouchUpInside)
        sender.addTarget(self, action: #selector(self.hideToolBarAction(_:)), forControlEvents: .TouchUpInside)
        
        self.navigationController?.toolbarHidden = false
    }
    
    func hideToolBarAction(sender: UIButton) {
        
        sender.setTitle("Show Tool Bar", forState: .Normal)
        sender.removeTarget(self, action: #function, forControlEvents: .TouchUpInside)
        sender.addTarget(self, action: #selector(self.showToolBarAction(_:)), forControlEvents: .TouchUpInside)
        
        self.navigationController?.toolbarHidden = true
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        let factor = self.view.frame.width / size.width
        
        self.button1.layer.cornerRadius *= factor
        self.button2.layer.cornerRadius *= factor
    }
}

