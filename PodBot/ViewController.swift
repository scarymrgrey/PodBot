//
//  ViewController.swift
//  PodBot
//
//  Created by Victor Gelmutdinov on 20/04/16.
//  Copyright © 2016 Victor Gelmutdinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Direction{
        case Previous
        case Next
    }
    @IBOutlet weak var ageControl: UIView!
    @IBOutlet weak var genderControl: UIView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var infoControls:[UIView!] = []
    
    func controlPage(show direction:Direction){
        for (index,control) in infoControls.enumerate(){//168-229
            if(!control.hidden){
                switch direction {
                case .Next:
                    if(index < infoControls.count){
                        control.hidden = true
                        infoControls[index+1].hidden = false
                        if(index + 2 == infoControls.count){
                            nextButton.hidden = true
                            previousButton.hidden = false
                        }
                    }
                case .Previous:
                    if(index > 0){
                        control.hidden = true
                        infoControls[index-1].hidden = false
                        if(index==1){
                            previousButton.hidden = true
                            nextButton.hidden = false
                        }
                    }
                default:
                    continue
                }
                 return
            }
        }
    }
    
    @IBAction func previousButtonTapped(sender: UIButton) {
        controlPage(show: .Previous)
    }
    @IBAction func nextButtonTapped(sender: UIButton) {
        controlPage(show: .Next)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var menu = UIButton(frame: CGRect(x: 0, y: 030, width: 30, height: 30))
        menu.setImage(nil, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menu)
        
        infoControls = [ageControl,genderControl]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

