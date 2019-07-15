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
            setOneWeight.text = "5 x " + String(squatWeight.weekOne())
            setTwoWeight.text = "5 x " + String(squatWeight.weekOne())
            setThreeWeight.text = "5 x " + String(squatWeight.weekOne())
            setFourWeight.text = "5 x " + String(squatWeight.weekOne())
            setFiveWeight.text = "5 x " + String(squatWeight.weekOne())
            
        }
            
        else if exercise == "Squat" && week == "Week 2" {
            setOneWeight.text = "3 x " + String(squatWeight.weekTwo())
            setTwoWeight.text = "3 x " + String(squatWeight.weekTwo())
            setThreeWeight.text = "3 x " + String(squatWeight.weekTwo())
            setFourWeight.text = "3 x " + String(squatWeight.weekTwo())
            setFiveWeight.text = "3 x " + String(squatWeight.weekTwo())
        }
        
        else if exercise == "Squat" && week == "Week 3" {
            setOneWeight.text = "2 x " + String(squatWeight.weekThree())
            setTwoWeight.text = "2 x " + String(squatWeight.weekThree())
            setThreeWeight.text = "2 x " + String(squatWeight.weekThree())
            setFourWeight.text = "2 x " + String(squatWeight.weekThree())
            setFiveWeight.text = "2 x " + String(squatWeight.weekThree())
        }
        
        else if exercise == "Squat" && week == "Week 4" {
            setOneWeight.text = "1 x " + String(squatWeight.weekFour())
            setTwoWeight.text = "1 x " + String(squatWeight.weekFour())
            setThreeWeight.text = "1 x " + String(squatWeight.weekFour())
            setFourWeight.text = "1 x " + String(squatWeight.weekFour())
            setFiveWeight.text = "1 x " + String(squatWeight.weekFour())
        }
        
        
        // Overheadpress
            
        else if exercise == "Overhead Press" && week == "Week 1" {
            setOneWeight.text = "5 x " + String(overheadpressWeight.weekOne())
            setTwoWeight.text = "5 x " + String(overheadpressWeight.weekOne())
            setThreeWeight.text = "5 x " + String(overheadpressWeight.weekOne())
            setFourWeight.text = "5 x " + String(overheadpressWeight.weekOne())
            setFiveWeight.text = "5 x " + String(overheadpressWeight.weekOne())
            
        }
            
        else if exercise == "Overhead Press" && week == "Week 2" {
            setOneWeight.text = "3 x " + String(overheadpressWeight.weekTwo())
            setTwoWeight.text = "3 x " + String(overheadpressWeight.weekTwo())
            setThreeWeight.text = "3 x " + String(overheadpressWeight.weekTwo())
            setFourWeight.text = "3 x " + String(overheadpressWeight.weekTwo())
            setFiveWeight.text = "3 x " + String(overheadpressWeight.weekTwo())
        }
            
        else if exercise == "Overhead Press" && week == "Week 3" {
            setOneWeight.text = "2 x " + String(overheadpressWeight.weekThree())
            setTwoWeight.text = "2 x " + String(overheadpressWeight.weekThree())
            setThreeWeight.text = "2 x " + String(overheadpressWeight.weekThree())
            setFourWeight.text = "2 x " + String(overheadpressWeight.weekThree())
            setFiveWeight.text = "2 x " + String(overheadpressWeight.weekThree())
        }
            
        else if exercise == "Overhead Press" && week == "Week 4" {
            setOneWeight.text = "1 x " + String(overheadpressWeight.weekFour())
            setTwoWeight.text = "1 x " + String(overheadpressWeight.weekFour())
            setThreeWeight.text = "1 x " + String(overheadpressWeight.weekFour())
            setFourWeight.text = "1 x " + String(overheadpressWeight.weekFour())
            setFiveWeight.text = "1 x " + String(overheadpressWeight.weekFour())
        }
            
        // Deadlift
        
        else if exercise == "Deadlift" && week == "Week 1" {
            setOneWeight.text = "5 x " + String(deadliftWeight.weekOne())
            setTwoWeight.text = "5 x " + String(deadliftWeight.weekOne())
            setThreeWeight.text = "5 x " + String(deadliftWeight.weekOne())
            setFourWeight.text = "5 x " + String(deadliftWeight.weekOne())
            setFiveWeight.text = "5 x " + String(deadliftWeight.weekOne())
            
        }
            
        else if exercise == "Deadlift" && week == "Week 2" {
            setOneWeight.text = "3 x " + String(deadliftWeight.weekTwo())
            setTwoWeight.text = "3 x " + String(deadliftWeight.weekTwo())
            setThreeWeight.text = "3 x " + String(deadliftWeight.weekTwo())
            setFourWeight.text = "3 x " + String(deadliftWeight.weekTwo())
            setFiveWeight.text = "3 x " + String(deadliftWeight.weekTwo())
        }
            
        else if exercise == "Deadlift" && week == "Week 3" {
            setOneWeight.text = "2 x " + String(deadliftWeight.weekThree())
            setTwoWeight.text = "2 x " + String(deadliftWeight.weekThree())
            setThreeWeight.text = "2 x " + String(deadliftWeight.weekThree())
            setFourWeight.text = "2 x " + String(deadliftWeight.weekThree())
            setFiveWeight.text = "2 x " + String(deadliftWeight.weekThree())
        }
            
        else if exercise == "Deadlift" && week == "Week 4" {
            setOneWeight.text = "1 x " + String(deadliftWeight.weekFour())
            setTwoWeight.text = "1 x " + String(deadliftWeight.weekFour())
            setThreeWeight.text = "1 x " + String(deadliftWeight.weekFour())
            setFourWeight.text = "1 x " + String(deadliftWeight.weekFour())
            setFiveWeight.text = "1 x " + String(deadliftWeight.weekFour())
        }
        
        // Bench Press
        
        else if exercise == "Bench Press" && week == "Week 1" {
            setOneWeight.text = "5 x " + String(benchpressWeight.weekOne())
            setTwoWeight.text = "5 x " + String(benchpressWeight.weekOne())
            setThreeWeight.text = "5 x " + String(benchpressWeight.weekOne())
            setFourWeight.text = "5 x " + String(benchpressWeight.weekOne())
            setFiveWeight.text = "5 x " + String(benchpressWeight.weekOne())
            
        }
            
        else if exercise == "Bench Press" && week == "Week 2" {
            setOneWeight.text = "3 x " + String(benchpressWeight.weekTwo())
            setTwoWeight.text = "3 x " + String(benchpressWeight.weekTwo())
            setThreeWeight.text = "3 x " + String(benchpressWeight.weekTwo())
            setFourWeight.text = "3 x " + String(benchpressWeight.weekTwo())
            setFiveWeight.text = "3 x " + String(benchpressWeight.weekTwo())
        }
            
        else if exercise == "Bench Press" && week == "Week 3" {
            setOneWeight.text = "2 x " + String(benchpressWeight.weekThree())
            setTwoWeight.text = "2 x " + String(benchpressWeight.weekThree())
            setThreeWeight.text = "2 x " + String(benchpressWeight.weekThree())
            setFourWeight.text = "2 x " + String(benchpressWeight.weekThree())
            setFiveWeight.text = "2 x " + String(benchpressWeight.weekThree())
        }
            
        else if exercise == "Bench Press" && week == "Week 4" {
            setOneWeight.text = "1 x " + String(benchpressWeight.weekFour())
            setTwoWeight.text = "1 x " + String(benchpressWeight.weekFour())
            setThreeWeight.text = "1 x " + String(benchpressWeight.weekFour())
            setFourWeight.text = "1 x " + String(benchpressWeight.weekFour())
            setFiveWeight.text = "1 x " + String(benchpressWeight.weekFour())
        }
        
        
        
        
        
        
        
        
        
    }
        
        
        
    
    
    
    
    
    
}

