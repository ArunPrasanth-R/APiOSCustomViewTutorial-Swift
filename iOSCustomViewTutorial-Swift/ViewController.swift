//
//  ViewController.swift
//  iOSCustomViewTutorial-Swift
//
//  Created by ArunPrasanth R on 30/11/15.
//  Copyright © 2015 ArunPrasanth R. All rights reserved.
//

import UIKit

class ViewController: UIViewController,APCustomPopUpViewDelegate {


    @IBOutlet weak var popUpView: APCustomPopupView!
    @IBOutlet weak var overLayView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        overLayView.hidden = true
//        popUpView.hidden = true
        popUpView.tableArray = ["Save","Share","Delete"]
        popUpView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "onClickOverlayView")
        overLayView.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickMenuBtn(sender: AnyObject) {
        popUpView.reload()
        if popUpView.hidden {
            overLayView.hidden = false
            popUpView.hidden = false
            
        } else {
            onClickOverlayView()
        }
    }

    func onClickOverlayView() {
        popUpView.hidden = true
        overLayView.hidden = true
    }
    
    func didSelectCell(stringName:String) {
        onClickOverlayView()
        print("Clicked on : \(stringName)")
    }
    
}

