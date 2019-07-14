//
//  ViewController.swift
//  531New
//
//  Created by Zoltan Puchovsky on 13/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    @IBOutlet weak var squatOneRepMax: UITextField!
    @IBOutlet weak var overheadpressOneRepMax: UITextField!
    @IBOutlet weak var deadliftOneRepMax: UITextField!
    @IBOutlet weak var benchpressOneRepMax: UITextField!
    
    @IBOutlet weak var trainingLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var myPicker: UIPickerView!
    
    @IBOutlet weak var setOneWeight: UITextField!
    @IBOutlet weak var setTwoWeight: UITextField!
    @IBOutlet weak var setThreeWeight: UITextField!
    @IBOutlet weak var setFourWeight: UITextField!
    @IBOutlet weak var setFiveWeight: UITextField!
    
    let pickerData = [["Squat","Overhead Press","Deadlift","Bench Press"],["Week 1","Week 2","Week 3" ,"Week 4"]]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        myPicker.delegate = self
        myPicker.dataSource = self
        
        
        let savedSquatOneRepMax = UserDefaults.standard.object(forKey: "SquatOneRepMaxSaved")
        if let squatOneRepMaxDisplayed = savedSquatOneRepMax as? String {
            squatOneRepMax.text = squatOneRepMaxDisplayed
        }
        
        let savedOverheadpressOneRepMax = UserDefaults.standard.object(forKey: "OverheadpressOneRepMaxSaved")
        if let overheadpressOneRepMaxDisplayed = savedOverheadpressOneRepMax as? String {
            overheadpressOneRepMax.text = overheadpressOneRepMaxDisplayed
        }
        
        let savedBenchpressOneRepMax = UserDefaults.standard.object(forKey: "BenchpressOneRepMaxSaved")
        if let benchpressOneRepMaxDisplayed = savedBenchpressOneRepMax as? String {
            benchpressOneRepMax.text = benchpressOneRepMaxDisplayed
        }
        
        let savedDeadliftOneRepMax = UserDefaults.standard.object(forKey: "DeadliftOneRepMaxSaved")
        if let deadliftOneRepMaxDisplayed = savedDeadliftOneRepMax as? String {
            deadliftOneRepMax.text = deadliftOneRepMaxDisplayed
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
        updateSetLabel()
    }
    
    func updateLabel() {
        let exercise = pickerData[0][myPicker.selectedRow(inComponent: 0)]
        let week = pickerData[1][myPicker.selectedRow(inComponent: 1)]
        trainingLabel.text = exercise
        weekLabel.text =  week
        
        
    }
    
    func updateSetLabel() {
        let squatOneRepMaxInput = Double(squatOneRepMax.text!)
        let overheadpressOneRepMaxInput = Double(overheadpressOneRepMax.text!)
        let deadliftOneRepMaxInput = Double(deadliftOneRepMax.text!)
        let benchpressOneRepMaxInput = Double(benchpressOneRepMax.text!)
        
        UserDefaults.standard.set(squatOneRepMax.text, forKey: "SquatOneRepMaxSaved")
        UserDefaults.standard.set(overheadpressOneRepMax.text, forKey: "OverheadpressOneRepMaxSaved")
        UserDefaults.standard.set(deadliftOneRepMax.text, forKey: "DeadliftOneRepMaxSaved")
        UserDefaults.standard.set(benchpressOneRepMax.text, forKey: "BenchpressOneRepMaxSaved")
        
        
    }
    
    
    
    
}

