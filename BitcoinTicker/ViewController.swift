//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let BASE_URL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    let currencySymbolArray = ["$", "R$", "$", "¥", "€", "£", "$", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    
    
    
    let headers = [
        "x-ba-key": ""
    ]
    
    let llave = "llave.txt"
    
    var finalURL = ""
    
    var posicion : Int = 0
    
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
        posicion = row
        finalURL = BASE_URL + currencyArray[row]
        print(finalURL)
        getCurrencyData(url: finalURL)
    }
    
      //MARK: - Networking
   
    func getCurrencyData(url: String) {
        Alamofire.request(url, headers: headers)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the currency data")
                    let currencyJSON : JSON = JSON(response.result.value!)
                    print("prueba: \(currencyJSON)")
                    self.updateCurrencyData(json: currencyJSON)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    //self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }

    }
    
//    //MARK: - JSON Parsing
//    /***************************************************************/
    
    func updateCurrencyData(json : JSON) {
        bitcoinPriceLabel.text = currencySymbolArray[posicion] + json["ask"].stringValue
    }
}

