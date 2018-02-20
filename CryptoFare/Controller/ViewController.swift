//
//  ViewController.swift
//  CryptoFare
//
//  Created by Nikita Petrenko on 2/18/18.
//  Copyright © 2018 Nikita Petrenko. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UITableViewController {
    
    var cryptoArray: [Currency] = [Currency]()
    let baseURL = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=XMR,DASH,BTC,BCH,ETH,LTC,XRP&tsyms=USD"
    
    @IBOutlet var cryptoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cryptoTableView.register(UINib(nibName: "CustomPriceCell", bundle: nil), forCellReuseIdentifier: "customCell")
        getCryptoData(url: baseURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! MyCustomPriceCell
        cell.cryptoName.text = cryptoArray[indexPath.row].name
        cell.cryptoAbbreviation.text = cryptoArray[indexPath.row].abbreviation
        cell.cryptoPrice.text = "$" + cryptoArray[indexPath.row].price
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoArray.count
    }
    
    
    //MARK:- Get Price Data
    func getCryptoData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Got the crypto data")
                    let cryptoJSON : JSON = JSON(response.result.value!)
                    
                    self.updateCryptoData(json: cryptoJSON)
                    self.tableView.reloadData()
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                }
        }
        
    }
    
    //MARK:- JSON Parsing
    func updateCryptoData(json : JSON) {
        
        if let bitcoinResult = json["BTC"]["USD"].double {
            print("Success")
            let currencyOne = Currency()
            currencyOne.name = "Bitcoin"
            currencyOne.abbreviation = "BTC"
            currencyOne.price = "\(bitcoinResult)"
            cryptoArray.append(currencyOne)
        } else {
            print("error")
        }
        
        if let etherResult = json["ETH"]["USD"].double {
            print("Success")
            let currencyTwo = Currency()
            currencyTwo.name = "Ether"
            currencyTwo.abbreviation = "ETH"
            currencyTwo.price = "\(etherResult)"
            cryptoArray.append(currencyTwo)
        } else {
            print("error")
        }
        
        if let litecoinResult = json["LTC"]["USD"].double {
            print("Success")
            let currencyThree = Currency()
            currencyThree.name = "Litecoin"
            currencyThree.abbreviation = "LTC"
            currencyThree.price = "\(litecoinResult)"
            cryptoArray.append(currencyThree)
        } else {
            print("error")
        }
        
        if let rippleResult = json["XRP"]["USD"].double {
            print("Success")
            let currencyFour = Currency()
            currencyFour.name = "Ripple"
            currencyFour.abbreviation = "XRP"
            currencyFour.price = "\(rippleResult)"
            cryptoArray.append(currencyFour)
        } else {
            print("error")
        }
        
        if let bchResult = json["BCH"]["USD"].double {
            print("Success")
            let currencyFive = Currency()
            currencyFive.name = "Bitcoin Cash"
            currencyFive.abbreviation = "BCH"
            currencyFive.price = "\(bchResult)"
            cryptoArray.append(currencyFive)
        } else {
            print("error")
        }
        
        if let dashResult = json["DASH"]["USD"].double {
            print("Success")
            let currencySix = Currency()
            currencySix.name = "Dash Coin"
            currencySix.abbreviation = "DASH"
            currencySix.price = "\(dashResult)"
            cryptoArray.append(currencySix)
        } else {
            print("error")
        }
        
        if let bchResult = json["XMR"]["USD"].double {
            print("Success")
            let currencySeven = Currency()
            currencySeven.name = "Monero"
            currencySeven.abbreviation = "XMR"
            currencySeven.price = "\(bchResult)"
            cryptoArray.append(currencySeven)
        } else {
            print("error")
        }
        
    }

    


}

