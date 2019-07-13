//
//  ViewController.swift
//  531New
//
//  Created by Zoltan Puchovsky on 13/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = [String] ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Connect data:
        self.picker.delegate = self
        self.picker.dataSource = self
        
        // Input the data into the array
        pickerData = ["Squat", "Overhead Press", "Deadlift", "Bench Press"]
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    



}

