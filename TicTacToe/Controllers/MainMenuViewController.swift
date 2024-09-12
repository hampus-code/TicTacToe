//
//  MainMenuViewController.swift
//  TicTacToe
//
//  Created by Hampus Andersson on 2024-09-11.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    func setupGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = playGameBtn.bounds
            gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor, UIColor.orange.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            playGameBtn.layer.addSublayer(gradientLayer)
            
            let animation = CABasicAnimation(keyPath: "locations")
            animation.fromValue = [0, 0.5, 1]
            animation.toValue = [1, 1.5, 2]
            animation.duration = 5.0
            animation.repeatCount = .greatestFiniteMagnitude
            animation.autoreverses = true
            
            gradientLayer.add(animation, forKey: "gradientAnimation")
        }
        */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func playGameBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func playComputerBtn(_ sender: UIButton) {
    }
    
    @IBAction func aboutGameBtn(_ sender: UIButton) {
    }
    

}
