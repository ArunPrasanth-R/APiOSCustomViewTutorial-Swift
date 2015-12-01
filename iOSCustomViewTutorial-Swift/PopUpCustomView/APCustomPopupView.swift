//
//  APCustomPopupView.swift
//  iOSCustomViewTutorial-Swift
//
//  Created by ArunPrasanth R on 30/11/15.
//  Copyright © 2015 ArunPrasanth R. All rights reserved.
//

import UIKit

protocol APCustomPopUpViewDelegate {
    func didSelectCell(stringName:String)
}

class APCustomPopupView: UIView,UITableViewDataSource,UITableViewDelegate {

    var tableArray:NSArray!
    var delegate:APCustomPopUpViewDelegate!
    @IBOutlet weak var tableVw: UITableView!
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.loadViewFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib ()
    }
    
    func loadViewFromNib() {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "APCustomPopupView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(view);
        
        tableVw.registerNib(UINib(nibName: "PopUpVwTableCell", bundle: nil),
            forCellReuseIdentifier: "popUpVwTableCell")
        
    }
    
    func reload() {
        tableVw.reloadData()
    }
    
    //MARK: - UITableview Datasource
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 51
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableArray.count > 0 {
            return tableArray.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell {
        
        let cell = tableVw.dequeueReusableCellWithIdentifier("popUpVwTableCell") as! PopUpVwTableCell
        cell.titleLabel?.text = tableArray[indexPath.row] as? String
        cell.selectionStyle = .None
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate.didSelectCell(tableArray[indexPath.row] as! String)
    }


}
