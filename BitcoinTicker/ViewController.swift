//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    //Función que regresa el número de columnas.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //Función que regresa el número de filas.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    //Función que llena el picker view con los strings del arreglo currencyArray.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    //Función que realiza una acción, cuando el usuario selecciona un elemento.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(currencyArray[row])
        finalURL = baseURL + currencyArray[row]
        print(finalURL)
    }
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
//    func getWeatherData(url: String, parameters: [String : String]) {
//        
//        Alamofire.request(url, method: .get, parameters: parameters)
//            .responseJSON { response in
//                if response.result.isSuccess {
//
//                    print("Sucess! Got the weather data")
//                    let weatherJSON : JSON = JSON(response.result.value!)
//
//                    self.updateWeatherData(json: weatherJSON)
//
//                } else {
//                    print("Error: \(String(describing: response.result.error))")
//                    self.bitcoinPriceLabel.text = "Connection Issues"
//                }
//            }
//
//    }
//
//    
//    
//    
//    
//    //MARK: - JSON Parsing
//    /***************************************************************/
//    
//    func updateWeatherData(json : JSON) {
//        
//        if let tempResult = json["main"]["temp"].double {
//        
//        weatherData.temperature = Int(round(tempResult!) - 273.15)
//        weatherData.city = json["name"].stringValue
//        weatherData.condition = json["weather"][0]["id"].intValue
//        weatherData.weatherIconName =    weatherData.updateWeatherIcon(condition: weatherData.condition)
//        }
//        
//        updateUIWithWeatherData()
//    }
//    




}

