//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
    func passWindSwitch(windSpeedOn: Bool)
}


class ChangeCityViewController: UIViewController {
    
    var delegate : ChangeCityDelegate?
    var switchWind : Bool = false
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!

    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    override func viewDidLoad() {
        super.viewDidLoad()
        windSpeedSwitch.isOn = switchWind
        print(switchWind)
    }
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {

        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)

        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var windSpeedSwitch: UISwitch!
    
    @IBAction func windSpeedAction(_ sender: UISwitch) {
        delegate?.passWindSwitch(windSpeedOn: sender.isOn)
    }
    
    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
