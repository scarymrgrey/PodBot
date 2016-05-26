//
//  ViewController.swift
//  PodBot
//
//  Created by Victor Gelmutdinov on 20/04/16.
//  Copyright © 2016 Victor Gelmutdinov. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController ,UITableViewDataSource {
    
    enum Direction{
        case Previous
        case Next
    }
    // MARK: - Outlets
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var conditionTypesList: UITableView!
    @IBOutlet weak var stepInicator: UISegmentedControl!
    @IBOutlet weak var weightControl: UIView!
    @IBOutlet weak var ageControl: UIView!
    @IBOutlet weak var genderControl: UIView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    // MARK: - Local Variables
    var infoControls:[UIView!] = []
    var conditionTypes = ["type 1",
                          "type 2",
                          "type 3",
                          "type 4",
                          "type 5"]
    // MARK: - Helpers
    func setStepper (currentControl : UIView){
        switch currentControl {
        case ageControl:
            stepInicator.selectedSegmentIndex = 0
            mainLabel.text = "Tell me about yourself"
            break
        case genderControl ,weightControl:
            stepInicator.selectedSegmentIndex = 1
            mainLabel.text = "Tell me about yourself"
            break
        case conditionTypesList:
            stepInicator.selectedSegmentIndex = 2
            mainLabel.text = "Select your condition types"
            break
        default: break
            
        }
        stepInicator.selectedSegmentIndex = 2
    }
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
                        setStepper(infoControls[index+1])
                    }
                case .Previous:
                    if(index > 0){
                        control.hidden = true
                        infoControls[index-1].hidden = false
                        if(index==1){
                            previousButton.hidden = true
                            nextButton.hidden = false
                        }
                        setStepper(infoControls[index-1])
                    }
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
        let menu = UIButton(frame: CGRect(x: 0, y: 030, width: 30, height: 30))
        menu.setImage(nil, forState: .Normal)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menu)
        
        infoControls = [ageControl,genderControl,weightControl , conditionTypesList]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Condition Type Table
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conditionTypes.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = conditionTypesList.dequeueReusableCellWithIdentifier("conditionTypeCell")
        cell?.textLabel?.text = conditionTypes[indexPath.row]
        return cell!
    }
}

