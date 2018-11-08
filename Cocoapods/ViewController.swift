//
//  ViewController.swift
//  Cocoapods
//
//  Created by iGuest on 11/7/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var searchBox: UITextField!
    @IBOutlet weak var btnGetWeather: UIButton!
    @IBOutlet weak var lblHigh: UILabel!
    @IBOutlet weak var lblLow: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // When "Get Weather" is pressed"
    @IBAction func btnGetWeather(_ sender: Any) {
        let appID = "" // replace "" with your OpenWeatherAPI key here
        let units = "imperial"
        if searchBox.text?.count == 0 {
            print("City length was 0")
            return
        }
        searchWeather(city: searchBox.text!, appID: appID, units: units)
    }
    
    // Make call to OpenWeatherAPI using city, API Key, and what units
    func searchWeather(city: String, appID: String, units: String) {
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(city.fix())&appID=\(appID)&units=\(units)"
        Alamofire.request(baseURL).responseJSON { response in
            if let resp = response.result.value {
                print(resp)
                let dictionary = resp as? NSDictionary
                guard let main = dictionary?["main"] as? NSDictionary else {
                    print("Couldn't find main")
                    return
                }
                print(main)
                if let max = main["temp_max"] as? Double {
                    self.lblHigh.text = "\(max)°"
                }
                if let min = main["temp_min"] as? Double {
                    self.lblLow.text = "\(min)°"
                }
            }
        }
    }
}

// Trims leading and trailing white space as well adds encoding to take in account spaces such as, "Las Vegas"
extension String {
    func fix() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "Seattle"
    }
}

