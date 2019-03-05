//
//  ResultsViewController.swift
//  Hacktechproj
//
//  Created by Mohit on 03/03/19.
//  Copyright © 2019 Mohit D. All rights reserved.
//

import UIKit
import SceneKit
import SCSDKCreativeKit
import ARKit
import SCSDKBitmojiKit

class ResultsViewController: UIViewController {

    var scorefromgame:String?
    var factsinJSON:NSDictionary?
    var usrname:String?
    var avs:String?
    var cm:RankingModel = RankingModel();

    
    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var Facts: UITextView!
    @IBOutlet weak var AvatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        UserNameLabel.text = "UserName: \t\(usrname!)"
        ScoreLabel.text = scorefromgame!
        var temptext = factsinJSON?["text"] as? String
        let characters = Array(temptext!)
        temptext = ""
        for chacter in characters
        {
            if (/*chacter == "a" || chacter == "e" || chacter == "i" ||*/ chacter == "o"/*|| chacter == "u" || chacter == "A" || chacter == "E" || chacter == "I"*/ || chacter == "O"/* || chacter == "U"*/)
            {
                temptext?.append("🥔")
            }
            else
            {
                temptext?.append(chacter)
            }
        }

        Facts.isEditable = false
        Facts.text = "\t\tFACT:-\n\(temptext!)"
        AvatarImageView.load(from: avs!)
        
        cm.addRanking(name: usrname!, score: scorefromgame!)        
    }
    
    override func viewWillAppear(_ animated: Bool) {  // to hide the Header bar in navigation controller
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }
    
    
    
    func sendSnapchat(photo: UIImage) {
        let snapPhoto = SCSDKSnapPhoto(image: photo)
        let snap = SCSDKPhotoSnapContent(snapPhoto: snapPhoto)
        // snap.sticker = /* Optional, add a sticker to the Snap */
        // snap.caption = /* Optional, add a caption to the Snap */
        // snap.attachmentUrl = /* Optional, add a link to the Snap */
        let api = SCSDKSnapAPI(content: snap)
        api.startSnapping { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                // Successfully shared content to Snapchat!
            }
        }
    }
    
    func takeScreenshot(_ shouldSave: Bool = true) -> UIImage?
    {
        var screenshotImage :UIImage?
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        guard let context = UIGraphicsGetCurrentContext() else {return nil}
        layer.render(in:context)
        screenshotImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let image = screenshotImage, shouldSave {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        return screenshotImage
    }
    
    @IBAction func SendToSnap(_ sender: UIButton)
    {
        let snapshot = takeScreenshot()
        sendSnapchat(photo: snapshot!)
    //    let photo = SCSDKSnapPhoto(image: snapshot)
    //    let snap = SCSDKPhotoSnapContent(snapPhoto: photo)
        
        // Sticker
     //   let sticker = SCSDKSnapSticker(stickerImage: #imageLiteral(resourceName: "snap-ghost"))
     //   snap.sticker = sticker
        
        // Caption
    //    snap.caption = "Snap on Snapchat!"
        
        // URL
    //    snap.attachmentUrl = "https://www.snapchat.com"
    }
    
    // Delegate Methods
    func bitmojiStickerPickerViewController(_ stickerPickerViewController: SCSDKBitmojiStickerPickerViewController, didSelectBitmojiWithURL bitmojiURL: String) {
    /*
        bitmojiSelectionView?.removeFromSuperview()
        
        if let image = UIImage.load(from: bitmojiURL) {
            DispatchQueue.main.async {
                self.setImageToScene(image: image)
            }
        }*/
    }
    
    func bitmojiStickerPickerViewController(_ stickerPickerViewController: SCSDKBitmojiStickerPickerViewController, searchFieldFocusDidChangeWithFocus hasFocus: Bool) {
        
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if(segue.identifier == "RtoR")
        {
            var obj = segue.destination as! RankingViewController
            obj.sentlink = avs!
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
