//
//  ViewController.swift
//  Hacktechproj
//
//  Created by Mohit on 02/03/19.
//  Copyright © 2019 Mohit D. All rights reserved.
//

import UIKit
import SCSDKLoginKit
import SCSDKBitmojiKit  // for bitmojis


class ViewController: UIViewController {

    @IBOutlet weak var StartButton: UIButton!
    
    @IBOutlet weak var BitmojiImageView: UIImageView!
    
    var snapname:String = "modo85271"
    var avatarstringname:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        StartButton.isHidden = true
        StartButton.isEnabled = false
        
      /*  let loginButton = SCSDKLoginButton()
        {
            (success : Bool, error : Error?) in
            // do something
                //make the buttons visible and seek the bitmoji user icon key
        }
        
        self.view.addSubview(loginButton!)*/
    }   // end of viewDidLoad
    
 /*   override func viewDidAppear(_ animated: Bool) {
        StartButton.isHidden = false
        StartButton.isEnabled = true
    } */
    
    
    private func goToLoginConfirm(_ entity: UserEntity){
     /*   let storyboard = UIStoryboard(name: "LoginConfirm", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! LoginConfirmViewController
        vc.userEntity = entity
        present(vc, animated: true, completion: nil)*/
        self.StartButton.isHidden = false
        self.StartButton.isEnabled = true
        
        guard let avatarString = entity.avatar else { return }
        BitmojiImageView.load(from: avatarString)
        self.avatarstringname = avatarString
        self.snapname = entity.displayName!
    }
    
    
    
    @IBAction func snapchatLoginAction(_ sender: Any) {
        SCSDKLoginClient.login(from: self, completion: { success, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if success {
                print("issa success")
                self.fetchSnapUserInfo() //example code
            }
        })
    }
    
    private func fetchSnapUserInfo(){
        let graphQLQuery = "{me{displayName, bitmoji{avatar}}}"
        SCSDKLoginClient
            .fetchUserData(
                withQuery: graphQLQuery,
                variables: nil,
                success: { userInfo in
                    if let userInfo = userInfo,
                        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted),
                        let userEntity = try? JSONDecoder().decode(UserEntity.self, from: data) {
                        DispatchQueue.main.async {
                            self.goToLoginConfirm(userEntity)
                            self.StartButton.isHidden = false
                            // call function and send userEntity value
                            //
                        }
                    }
            }) { (error, isUserLoggedOut) in
                print(error?.localizedDescription ?? "")
                print("I'm here~!")
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "HometoGame")
        {
            // Get the new view controller using segue.destination.

            var obj = segue.destination as! GameViewController
            // Pass the selected object to the new view controller.
            if snapname != nil && snapname != "" {
                obj.snapun = snapname
            }
            else
            {
                obj.snapun = "modo85271"
            }
            obj.avstring = avatarstringname
        }
    }
    
    @IBAction func fromResultsViewController(segue: UIStoryboardSegue) // unwind segue method
    {
        
    }
    
    
}

