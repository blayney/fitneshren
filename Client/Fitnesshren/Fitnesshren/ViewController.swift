//
//  ViewController.swift
//  Fitnesshren
//
//  Created by Mulang Su on 2018/10/04.
//  Copyright © 2018年 Mulang Su. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIFont.fontNames(forFamilyName: "SF Pro Display"))
        
        print((view.subviews.first! as! UILabel).font!.fontName)
    }


}

