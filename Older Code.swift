//
//  Older Code.swift
//  Lemonade Stand
//
//  Created by Bradley White on 9/15/14.
//  Copyright (c) 2014 Code by Brad. All rights reserved.
//

import Foundation
/*
class ViewController: UIViewController {
    
    @IBOutlet var currentMoneyLabel: UILabel!
    @IBOutlet var currentLemonLabel: UILabel!
    @IBOutlet var currentIceCubeLabel: UILabel!
    @IBOutlet var numberOfLemonsToPurchaseLabel: UILabel!
    @IBOutlet var numberOfIceCubesToPurchaseLabel: UILabel!
    @IBOutlet var numberOfLemonsToMixLabel: UILabel!
    @IBOutlet var numberOfIceCubesToMixLabel: UILabel!
    
    @IBOutlet var weatherImageView: UIImageView!
    
    var cashOnHand = 10
    var lemonsOnHand = 1
    var iceCubeOnHand = 1
    
    var purchaseTotalLemons = 0
    var purchaseTotalIceCubes = 0
    var mixTotalLemons = 0
    var mixTotalIceCubes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentMoneyLabel.text = "$\(cashOnHand)"
        currentLemonLabel.text = "\(lemonsOnHand) Lemon"
        currentIceCubeLabel.text = "\(iceCubeOnHand) Ice Cube"
        weatherImageView.image = UIImage(named: "mild.png")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func increaseQuantityOfLemonsToPurchase(sender: AnyObject) {
        if cashOnHand >= 2 {
            purchaseTotalLemons++
            numberOfLemonsToPurchaseLabel.text = "\(purchaseTotalLemons)"
            cashOnHand -= 2
            currentMoneyLabel.text = "$\(cashOnHand)"
        }
    }
    
    @IBAction func decreaseQuantityOfLemonsToPurchase(sender: AnyObject) {
        if purchaseTotalLemons > 0 {
            purchaseTotalLemons--
            numberOfLemonsToPurchaseLabel.text = "\(purchaseTotalLemons)"
            cashOnHand += 2
            currentMoneyLabel.text = "$\(cashOnHand)"
        }
    }
    
    @IBAction func increaseQuantityOfIceCubesToPurchase(sender: AnyObject) {
        
        if cashOnHand >= 1 {
            purchaseTotalIceCubes++
            numberOfIceCubesToPurchaseLabel.text = "\(purchaseTotalIceCubes)"
            cashOnHand -= 1
            currentMoneyLabel.text = "$\(cashOnHand)"
        }
    }
    
    @IBAction func decreaseQuantityOfIceCubesToPurchase(sender: AnyObject) {
        
        if purchaseTotalIceCubes > 0 {
            purchaseTotalIceCubes--
            numberOfIceCubesToPurchaseLabel.text = "\(purchaseTotalIceCubes)"
            cashOnHand += 1
            currentMoneyLabel.text = "$\(cashOnHand)"
        }
    }
    
    @IBAction func increaseNumberOfLemonsToMix(sender: AnyObject) {
        
        if mixTotalLemons < lemonsOnHand {
            mixTotalLemons++
            numberOfLemonsToMixLabel.text = "\(mixTotalLemons)"
            lemonsOnHand -= 1
            if lemonsOnHand == 1 {
                currentLemonLabel.text = "\(lemonsOnHand) Lemon"
            } else {
                currentLemonLabel.text = "\(lemonsOnHand) Lemons"
            }
        }
    }
    
    @IBAction func decreaseNumberOfLemonsToMix(sender: AnyObject) {
        
        if mixTotalLemons > 0 {
            mixTotalLemons--
            numberOfLemonsToMixLabel.text = "\(mixTotalLemons)"
            lemonsOnHand += 1
            if lemonsOnHand == 1 {
                currentLemonLabel.text = "\(lemonsOnHand) Lemon"
            } else {
                currentLemonLabel.text = "\(lemonsOnHand) Lemons"
            }
        }
    }
    
    @IBAction func increaseNumberOfIceCubesToMix(sender: AnyObject) {
        
        if mixTotalIceCubes < iceCubeOnHand {
            mixTotalIceCubes++
            numberOfIceCubesToMixLabel.text = "\(mixTotalIceCubes)"
            iceCubeOnHand -= 1
            if iceCubeOnHand == 1 {
                currentIceCubeLabel.text = "\(iceCubeOnHand) Ice Cube"
            } else {
                currentIceCubeLabel.text = "\(iceCubeOnHand) Ice Cubes"
            }
        }
    }
    
    @IBAction func decreaseNumberOfIceCubesToMix(sender: AnyObject) {
        
        if mixTotalIceCubes > 0 {
            mixTotalIceCubes--
            numberOfIceCubesToMixLabel.text = "\(mixTotalIceCubes)"
            iceCubeOnHand += 1
            if iceCubeOnHand == 1 {
                currentIceCubeLabel.text = "\(iceCubeOnHand) Ice Cube"
            } else {
                currentIceCubeLabel.text = "\(iceCubeOnHand) Ice Cubes"
            }
        }
    }
    
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        
    }
    
}
*/