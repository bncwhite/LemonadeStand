//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by Bradley White on 9/12/14.
//  Copyright (c) 2014 Code by Brad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentMoneyLabel: UILabel!
    @IBOutlet var currentLemonLabel: UILabel!
    @IBOutlet var currentIceCubeLabel: UILabel!
    @IBOutlet var numberOfLemonsToPurchaseLabel: UILabel!
    @IBOutlet var numberOfIceCubesToPurchaseLabel: UILabel!
    @IBOutlet var numberOfLemonsToMixLabel: UILabel!
    @IBOutlet var numberOfIceCubesToMixLabel: UILabel!
    
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    var price = Price()
    
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    
    var weatherArray: [[Int]] = [[-10, -9, -5, -7], [5, 8, 10, 9], [22, 25, 27, 23]]
    var weatherToday: [Int] = [0, 0, 0, 0]
    
    var weatherImageView:UIImageView = UIImageView(frame: CGRectMake(20, 50, 50, 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(weatherImageView)
        
        simulateWeatherToday()
        updateMainView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func increaseQuantityOfLemonsToPurchase(sender: AnyObject)
    {
        if supplies.money >= price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message:"You dont have enough money")
        }
    }

    @IBAction func increaseQuantityOfIceCubesToPurchase(sender: AnyObject)
    {
        if supplies.money >= price.iceCube {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(header:"Error", message: "You dont have enough money")
        }
    }
    @IBAction func increaseNumberOfLemonsToMix(sender: AnyObject)
    {
        if supplies.lemons > 0 {
            supplies.lemons -= 1
            lemonsToMix += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You dont have enough lemons")
        }
    }
    
    @IBAction func increaseNumberOfIceCubesToMix(sender: AnyObject)
    {
        if supplies.iceCubes > 0 {
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You dont have enough ice cubes")
        }
    }
    
    @IBAction func decreaseNumberOfLemonsToMix(sender: AnyObject)
    {
        if lemonsToMix > 0 {
            lemonsToMix -= 1
            supplies.lemons += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You have nothing to un-mix")
        }
    }
    
    @IBAction func decreaseNumberOfIceCubesToMix(sender: AnyObject)
    {
        if iceCubesToMix > 0 {
            iceCubesToMix -= 1
            supplies.iceCubes += 1
            updateMainView()
        } else {
            showAlertWithText(message: "You have nothing to un-mix")
        }
    }
    
    @IBAction func decreaseQuantityOfLemonsToPurchase(sender: AnyObject)
    {
        if lemonsToPurchase > 0 {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
            updateMainView()
        }
        else {
            showAlertWithText(header:"Error", message: "You dont have any lemons planned for purchase")
        }
    }
    
    @IBAction func decreaseQuantityOfIceCubesToPurchase(sender: AnyObject)
    {
        if iceCubesToPurchase > 0 {
            iceCubesToPurchase -= 1
            supplies.money += price.iceCube
            supplies.iceCubes -= 1
            updateMainView()
        } else {
            showAlertWithText(header:"Error", message: "You dont have any ice cubes planned for purchase")
        }
    }
    
    
    
    @IBAction func startDayButtonPressed(sender: AnyObject)
    {
        let average = findAverage(weatherToday)
        
        let customers = Int(arc4random_uniform(UInt32(average)))
        println("Customers: \(customers)")
        
        let lemonadeRatio = Float(lemonsToMix) / Float(iceCubesToMix)
        println("Lemonade Ratio: \(lemonadeRatio)")
        
        for x in 0...customers {
            
            let preference = Double(arc4random_uniform(UInt32(100))) / 100
            
            if preference < 0.4 && lemonadeRatio > 1 {
                supplies.money += 1
                println("Paid!")
            }
            else if preference > 0.6 && lemonadeRatio < 1 {
                supplies.money += 1
                println("Paid!")
            }
            else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1 {
                supplies.money += 1
                println("Paid!")
            }
            else {
                println("No match, no money")
            }
        }
        
        lemonsToPurchase = 0
        iceCubesToPurchase = 0
        lemonsToMix = 0
        iceCubesToMix = 0
        
        simulateWeatherToday()
        updateMainView()
    }
    
    func updateMainView()
    {
        currentMoneyLabel.text = "$\(supplies.money)"
        
        if (supplies.lemons != 1) {
            currentLemonLabel.text = "\(supplies.lemons) Lemons"
        } else {
            currentLemonLabel.text = "\(supplies.lemons) Lemon"
        }
        
        if (supplies.iceCubes != 1) {
            currentIceCubeLabel.text = "\(supplies.iceCubes) Ice Cubes"
        } else {
            currentIceCubeLabel.text = "\(supplies.iceCubes) Ice Cube"
        }
        
        numberOfLemonsToPurchaseLabel.text = "\(lemonsToPurchase)"
        numberOfIceCubesToPurchaseLabel.text = "\(iceCubesToPurchase)"
        
        numberOfLemonsToMixLabel.text = "\(lemonsToMix)"
        numberOfIceCubesToMixLabel.text = "\(iceCubesToMix)"
    }

    func showAlertWithText(header:String = "Warning", message: String)
    {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func simulateWeatherToday()
    {
        let index = Int(arc4random_uniform(UInt32(weatherArray.count)))
        weatherToday = weatherArray[index]
        
        switch index {
        case 0:
            weatherImageView.image = UIImage(named: "cold")
        case 1:
            weatherImageView.image = UIImage(named: "mild")
        case 2:
            weatherImageView.image = UIImage(named: "warm")
        default:
            weatherImageView.image = UIImage(named: "warm")
        }
    }
    
    func findAverage(data:[Int]) -> Int
    {
        var sum = 0
        
        for x in data {
            sum += x
        }
        
        var average:Double = Double(sum) / Double(data.count)
        var rounded:Int = Int(ceil(average))
        
        return rounded
    }
}

