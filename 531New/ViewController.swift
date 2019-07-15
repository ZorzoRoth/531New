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
    
    
    @IBOutlet weak var setOneSwitch: UISwitch!
    @IBOutlet weak var setTwoSwitch: UISwitch!
    @IBOutlet weak var setThreeSwitch: UISwitch!
    @IBOutlet weak var setFourSwitch: UISwitch!
    @IBOutlet weak var setFiveSwitch: UISwitch!
    
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
        
        let savedDeadliftOneRepMax = UserDefaults.standard.object(forKey: "DeadliftOneRepMaxSaved")
        if let deadliftOneRepMaxDisplayed = savedDeadliftOneRepMax as? String {
            deadliftOneRepMax.text = deadliftOneRepMaxDisplayed
        }
        
        let savedBenchpressOneRepMax = UserDefaults.standard.object(forKey: "BenchpressOneRepMaxSaved")
        if let benchpressOneRepMaxDisplayed = savedBenchpressOneRepMax as? String {
            benchpressOneRepMax.text = benchpressOneRepMaxDisplayed
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
        updateSetLabel()
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
        
        
        let squatWeight = Squat(squatMax: squatOneRepMaxInput!)
        let overheadpressWeight = Overheadpress(overheadpressMax: overheadpressOneRepMaxInput!)
        let deadliftWeight = Deadlift(deadliftMax: deadliftOneRepMaxInput!)
        let benchpressWeight = Benchpress(benchpressMax: benchpressOneRepMaxInput!)

        
        let exercise = pickerData[0][myPicker.selectedRow(inComponent: 0)]
        let week = pickerData[1][myPicker.selectedRow(inComponent: 1)]
        trainingLabel.text = exercise
        weekLabel.text =  week
        
        
        // Squat
        
        
        
        if exercise == "Squat" && week == "Week 1" {
            
            setOneWeight.text = "5 x " + String(ceil(squatWeight.weekOne()))
            setTwoWeight.text = "5 x " + String(ceil(squatWeight.weekOne()))
            setThreeWeight.text = "5 x " + String(ceil(squatWeight.weekOne()))
            setFourWeight.text = "5 x " + String(ceil(squatWeight.weekOne()))
            setFiveWeight.text = "5 x " + String(ceil(squatWeight.weekOne()))
            
            /*
            setOneSwitch.isOn = false
            setTwoSwitch.isOn = false
            setThreeSwitch.isOn = false
            setFourSwitch.isOn = false
            setFiveSwitch.isOn = false
            */
            
        }
            
        else if exercise == "Squat" && week == "Week 2" {
            setOneWeight.text = "3 x " + String(ceil(squatWeight.weekTwo()))
            setTwoWeight.text = "3 x " + String(ceil(squatWeight.weekTwo()))
            setThreeWeight.text = "3 x " + String(ceil(squatWeight.weekTwo()))
            setFourWeight.text = "3 x " + String(ceil(squatWeight.weekTwo()))
            setFiveWeight.text = "3 x " + String(ceil(squatWeight.weekTwo()))
        }
        
        else if exercise == "Squat" && week == "Week 3" {
            setOneWeight.text = "2 x " + String(ceil(squatWeight.weekThree()))
            setTwoWeight.text = "2 x " + String(ceil(squatWeight.weekThree()))
            setThreeWeight.text = "2 x " + String(ceil(squatWeight.weekThree()))
            setFourWeight.text = "2 x " + String(ceil(squatWeight.weekThree()))
            setFiveWeight.text = "2 x " + String(ceil(squatWeight.weekThree()))
        }
        
        else if exercise == "Squat" && week == "Week 4" {
            setOneWeight.text = "1 x " + String(ceil(squatWeight.weekFour()))
            setTwoWeight.text = "1 x " + String(ceil(squatWeight.weekFour()))
            setThreeWeight.text = "1 x " + String(ceil(squatWeight.weekFour()))
            setFourWeight.text = "1 x " + String(ceil(squatWeight.weekFour()))
            setFiveWeight.text = "1 x " + String(ceil(squatWeight.weekFour()))
        }
        
        
        // Overheadpress
            
        else if exercise == "Overhead Press" && week == "Week 1" {
            setOneWeight.text = "5 x " + String(ceil(overheadpressWeight.weekOne()))
            setTwoWeight.text = "5 x " + String(ceil(overheadpressWeight.weekOne()))
            setThreeWeight.text = "5 x " + String(ceil(overheadpressWeight.weekOne()))
            setFourWeight.text = "5 x " + String(ceil(overheadpressWeight.weekOne()))
            setFiveWeight.text = "5 x " + String(ceil(overheadpressWeight.weekOne()))
            
        }
            
        else if exercise == "Overhead Press" && week == "Week 2" {
            setOneWeight.text = "3 x " + String(ceil(overheadpressWeight.weekTwo()))
            setTwoWeight.text = "3 x " + String(ceil(overheadpressWeight.weekTwo()))
            setThreeWeight.text = "3 x " + String(ceil(overheadpressWeight.weekTwo()))
            setFourWeight.text = "3 x " + String(ceil(overheadpressWeight.weekTwo()))
            setFiveWeight.text = "3 x " + String(ceil(overheadpressWeight.weekTwo()))
        }
            
        else if exercise == "Overhead Press" && week == "Week 3" {
            setOneWeight.text = "2 x " + String(ceil(overheadpressWeight.weekThree()))
            setTwoWeight.text = "2 x " + String(ceil(overheadpressWeight.weekThree()))
            setThreeWeight.text = "2 x " + String(ceil(overheadpressWeight.weekThree()))
            setFourWeight.text = "2 x " + String(ceil(overheadpressWeight.weekThree()))
            setFiveWeight.text = "2 x " + String(ceil(overheadpressWeight.weekThree()))
        }
            
        else if exercise == "Overhead Press" && week == "Week 4" {
            setOneWeight.text = "1 x " + String(ceil(overheadpressWeight.weekFour()))
            setTwoWeight.text = "1 x " + String(ceil(overheadpressWeight.weekFour()))
            setThreeWeight.text = "1 x " + String(ceil(overheadpressWeight.weekFour()))
            setFourWeight.text = "1 x " + String(ceil(overheadpressWeight.weekFour()))
            setFiveWeight.text = "1 x " + String(ceil(overheadpressWeight.weekFour()))
        }
            
        // Deadlift
        
        else if exercise == "Deadlift" && week == "Week 1" {
            setOneWeight.text = "5 x " + String(ceil(deadliftWeight.weekOne()))
            setTwoWeight.text = "5 x " + String(ceil(deadliftWeight.weekOne()))
            setThreeWeight.text = "5 x " + String(ceil(deadliftWeight.weekOne()))
            setFourWeight.text = "5 x " + String(ceil(deadliftWeight.weekOne()))
            setFiveWeight.text = "5 x " + String(ceil(deadliftWeight.weekOne()))
            
        }
            
        else if exercise == "Deadlift" && week == "Week 2" {
            setOneWeight.text = "3 x " + String(ceil(deadliftWeight.weekTwo()))
            setTwoWeight.text = "3 x " + String(ceil(deadliftWeight.weekTwo()))
            setThreeWeight.text = "3 x " + String(ceil(deadliftWeight.weekTwo()))
            setFourWeight.text = "3 x " + String(ceil(deadliftWeight.weekTwo()))
            setFiveWeight.text = "3 x " + String(ceil(deadliftWeight.weekTwo()))
        }
            
        else if exercise == "Deadlift" && week == "Week 3" {
            setOneWeight.text = "2 x " + String(ceil(deadliftWeight.weekThree()))
            setTwoWeight.text = "2 x " + String(ceil(deadliftWeight.weekThree()))
            setThreeWeight.text = "2 x " + String(ceil(deadliftWeight.weekThree()))
            setFourWeight.text = "2 x " + String(ceil(deadliftWeight.weekThree()))
            setFiveWeight.text = "2 x " + String(ceil(deadliftWeight.weekThree()))
        }
            
        else if exercise == "Deadlift" && week == "Week 4" {
            setOneWeight.text = "1 x " + String(ceil(deadliftWeight.weekFour()))
            setTwoWeight.text = "1 x " + String(ceil(deadliftWeight.weekFour()))
            setThreeWeight.text = "1 x " + String(ceil(deadliftWeight.weekFour()))
            setFourWeight.text = "1 x " + String(ceil(deadliftWeight.weekFour()))
            setFiveWeight.text = "1 x " + String(ceil(deadliftWeight.weekFour()))
        }
        
        // Bench Press
        
        else if exercise == "Bench Press" && week == "Week 1" {
            setOneWeight.text = "5 x " + String(ceil(benchpressWeight.weekOne()))
            setTwoWeight.text = "5 x " + String(ceil(benchpressWeight.weekOne()))
            setThreeWeight.text = "5 x " + String(ceil(benchpressWeight.weekOne()))
            setFourWeight.text = "5 x " + String(ceil(benchpressWeight.weekOne()))
            setFiveWeight.text = "5 x " + String(ceil(benchpressWeight.weekOne()))
            
        }
            
        else if exercise == "Bench Press" && week == "Week 2" {
            setOneWeight.text = "3 x " + String(ceil(benchpressWeight.weekTwo()))
            setTwoWeight.text = "3 x " + String(ceil(benchpressWeight.weekTwo()))
            setThreeWeight.text = "3 x " + String(ceil(benchpressWeight.weekTwo()))
            setFourWeight.text = "3 x " + String(ceil(benchpressWeight.weekTwo()))
            setFiveWeight.text = "3 x " + String(ceil(benchpressWeight.weekTwo()))
        }
            
        else if exercise == "Bench Press" && week == "Week 3" {
            setOneWeight.text = "2 x " + String(ceil(benchpressWeight.weekThree()))
            setTwoWeight.text = "2 x " + String(ceil(benchpressWeight.weekThree()))
            setThreeWeight.text = "2 x " + String(ceil(benchpressWeight.weekThree()))
            setFourWeight.text = "2 x " + String(ceil(benchpressWeight.weekThree()))
            setFiveWeight.text = "2 x " + String(ceil(benchpressWeight.weekThree()))
        }
            
        else if exercise == "Bench Press" && week == "Week 4" {
            setOneWeight.text = "1 x " + String(ceil(benchpressWeight.weekFour()))
            setTwoWeight.text = "1 x " + String(ceil(benchpressWeight.weekFour()))
            setThreeWeight.text = "1 x " + String(ceil(benchpressWeight.weekFour()))
            setFourWeight.text = "1 x " + String(ceil(benchpressWeight.weekFour()))
            setFiveWeight.text = "1 x " + String(ceil(benchpressWeight.weekFour()))
        }
        
        
    }
    
    
}







