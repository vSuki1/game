//
//  ViewController.swift
//  game
//
//  Created by Disukhi Ahmed on 3/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movableObject: UIView!
  
    @IBOutlet weak var movableobject2: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var labletoWIn: UILabel!
    
    
    @IBAction func movement(_ sender: UIButton) {
        let moveit = 10
          
        
        
              
        self.movableObject.transform = self.movableObject.transform.translatedBy(x: 0, y: -CGFloat(moveit))
        
        
        if self.movableObject.frame.minY <= self.labletoWIn.frame.maxY {
            self.labletoWIn.text = "WINNER IS RED"
        }
    }
    
    
    @IBAction func movement2(_ sender: UIButton) {
        let moveit = -10
        
        self.movableobject2.transform = self.movableobject2.transform.translatedBy(x: 0, y: -CGFloat(moveit))
        
        if self.movableobject2.frame.maxY >= self.labletoWIn.frame.minY {
            self.labletoWIn.text = "WINNER IS BLUE"
        }
    }
    
    
}

