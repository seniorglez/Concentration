//
//  ConcentrationThemeViewController.swift
//  Prueba
//
//  Created by Diego on 04/03/2020.
//  Copyright © 2020 Diego Dominguez. All rights reserved.
//

import UIKit

class ConcentrationThemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let themes = [
        "Sports":"⚽️🏀🏈⚾️🥎🏐🏉🎾🥏🎱🏓",
        "Animals":"🐶🐱🐭🐹🐰🦊🦝🐻🐼🦘🦡",
        "Faces":"😀😁😂🤣😃😄😅😆😉😊😋😎"
    ]
    
    private var concentrationViewController: ConcentrationViewController?{
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    
    
    @IBAction func changeTheme(_ sender: Any) {
        if let cvc = concentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                           cvc.theme=theme
                       } else {
                performSegue(withIdentifier: "Choose Theme", sender: sender)
                   }
            
        }
           
    }
    private var lastSeguedConcentrationViewController: ConcentrationViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "Choose Theme"{
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName]{
                if let cvc = segue.destination as? ConcentrationViewController{
                    cvc.theme = theme;
                    lastSeguedConcentrationViewController = cvc
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
