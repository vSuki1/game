//
//  levelViewController.swift
//  game
//
//  Created by Disukhi Ahmed on 3/15/24.
//

import UIKit

class levelViewController: UIViewController {
    
    var update: Int = 7 {
        didSet{
            // do this after the var changes
            if charLabel.frame.maxY == labelRespawn.frame.maxY {
                charLabel.text = "Its working"
            }
        }
        willSet{
            // do this before the var changes
        }
    }
    
    @IBOutlet weak var deathbeam: UILabel!
    
    @IBOutlet weak var labelRespawn: UILabel!
    
    @IBOutlet weak var keyImage: UIImageView!
    
    @IBOutlet weak var charLabel: UILabel!
    
    var isButtonheldUp = false
    var isButtonheldDown = false
    var isButtonHeldRight = false
    var isButtonHeldLeft = false
    var moveDist = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        keyImage.image = UIImage(named: "key")
        
        charLabel.frame = labelRespawn.frame
        
    }
    
    
    @IBAction func leftB(_ sender: UIButton) {
        isButtonHeldLeft = false
        isButtonheldUp = false
        isButtonheldDown = false
        isButtonHeldRight = false
        isButtonHeldLeft = true
        moveLabelLeftRepeatedly()
    }
    
    @IBAction func rightB(_ sender: UIButton) {
        isButtonHeldLeft = false
        isButtonheldUp = false
        isButtonheldDown = false
        isButtonHeldRight = true
        moveLabel2RightRepeatedly()
    }
    
    @IBAction func downB(_ sender: UIButton) {
        isButtonHeldLeft = false
        isButtonheldDown = true
        isButtonheldUp = false
        isButtonHeldRight = false
        moveLabel2Repeatedly()
    }
    
    @IBAction func upB(_ sender: UIButton) {
        isButtonHeldLeft = false
        isButtonheldUp = true
        isButtonheldDown = false
        isButtonHeldRight = false
        moveLabelRepeatedly()
    }
    func checkCollision() {
        if charLabel.frame.intersects(deathbeam.frame) {
            charLabel.frame = labelRespawn.frame
        }
    }
    func moveLabelRepeatedly() {
        guard isButtonheldUp else { return }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
            
            
            self.charLabel.transform = self.charLabel.transform.translatedBy(x: 0, y: -CGFloat(self.moveDist))
        }, completion: nil)
            
        checkCollision()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.moveLabelRepeatedly()
        }
        
    }
    
    func moveLabel2Repeatedly() {
        guard isButtonheldDown else { return }
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
            self.charLabel.transform = self.charLabel.transform.translatedBy(x: 0, y: CGFloat(self.moveDist))
        }, completion: nil)
        checkCollision()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.moveLabel2Repeatedly()
        }
        
    }
    func moveLabel2RightRepeatedly() {
        guard isButtonHeldRight else { return }
        
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
            
            self.charLabel.transform = self.charLabel.transform.translatedBy(x: CGFloat(self.moveDist), y: 0)
        }, completion: nil)
            
        checkCollision()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.moveLabel2RightRepeatedly()
        }
        
    }
        func moveLabelLeftRepeatedly() {
            guard isButtonHeldLeft else { return }
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           options: [.curveLinear],
                           animations: {
            
                self.charLabel.transform = self.charLabel.transform.translatedBy(x: CGFloat(-self.moveDist), y: 0)
                
            }, completion: nil)
          
            checkCollision()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.moveLabelLeftRepeatedly()
            }
            
        }
        
    }

