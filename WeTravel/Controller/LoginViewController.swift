//
//  LoginViewController.swift
//  WeTravel
//
//  Created by GHTK on 30/7/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginbkg: UIImageView!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func login(_ sender: Any) {
        let mainSB = UIStoryboard(name: "Main", bundle: .main)
        let mainTabbarVC = mainSB.instantiateViewController(identifier: "MainScene")
        
        guard let window = UIApplication.shared.windown
        else { return }
        
        window.rootViewController = mainTabbarVC
        window.makeKeyAndVisible()
        
    }
    
    
}
extension UIApplication {
    var windown: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter {$0.activationState == .foregroundActive }
            .compactMap {$0 as? UIWindowScene }
            .first?
            .keyWindow
    }
}

