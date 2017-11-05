//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by NSSimpleApps on 14.05.16.
//  Copyright © 2016 NSSimpleApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var cornerRadiusFactor: CGFloat = 0
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        let barButtonItem = UIBarButtonItem(title: "Item",
                                            style: .plain,
                                            target: nil,
                                            action: nil)
        
        self.setToolbarItems([flexibleSpace, barButtonItem, flexibleSpace],
                             animated: false)
        
        self.button1.layer.cornerRadius = 12.5
        
        self.button2.layer.cornerRadius = 12.5
        self.button2.addTarget(self, action: #selector(self.showToolBarAction(_:)), for: .touchUpInside)
        
        self.cornerRadiusFactor = self.button1.layer.cornerRadius / self.button1.frame.height
    }
    
    @IBAction func button1Action(_ sender: UIButton) {
        
        print(sender.frame.height)
        print(sender.superview!.frame.height)
        print(self.topLayoutGuide.length, self.bottomLayoutGuide.length)
    }
    
    @objc func showToolBarAction(_ sender: UIButton) {
        
        sender.setTitle("Hide Tool Bar", for: UIControlState())
        sender.removeTarget(self, action: #function, for: .touchUpInside)
        sender.addTarget(self, action: #selector(self.hideToolBarAction(_:)), for: .touchUpInside)
        
        self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    @objc func hideToolBarAction(_ sender: UIButton) {
        
        sender.setTitle("Show Tool Bar", for: UIControlState())
        sender.removeTarget(self, action: #function, for: .touchUpInside)
        sender.addTarget(self, action: #selector(self.showToolBarAction(_:)), for: .touchUpInside)
        
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        let factor = self.view.frame.width / size.width
        
        self.button1.layer.cornerRadius *= factor
        self.button2.layer.cornerRadius *= factor
    }
}

