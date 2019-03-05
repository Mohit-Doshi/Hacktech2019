//
//  GameViewController.swift
//  Hacktechproj
//
//  Created by Mohit on 02/03/19.
//  Copyright © 2019 Mohit D. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

        let dictnry = [1:8, 2:5, 3:7, 4:6, 5:2, 6:4, 7:3, 8:1]
        var clickcount:Int = 0
        var firstclick:Int?
        var secondclick:Int?
        var matches:Int = 0
        var score:Int = 1080
        var jsn:NSDictionary?
        var ob:FactsApiCall?
        var snapun:String?
        var avstring:String?
    
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image3: UIImageView!
    @IBOutlet weak var Image4: UIImageView!
    @IBOutlet weak var Image5: UIImageView!
    @IBOutlet weak var Image6: UIImageView!
    @IBOutlet weak var Image7: UIImageView!
    @IBOutlet weak var Image8: UIImageView!
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
        clickcount = 0
        matches = 0
        score = 1080
        NextButton.isHidden = true
        NextButton.isEnabled = false
        Image1.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image2.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image3.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image4.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image5.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image6.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image7.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image8.image = UIImage(imageLiteralResourceName: "questionmark.png")
        ob = FactsApiCall()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        // Do any additional setup after loading the view.
        clickcount = 0
        matches = 0
        score = 1080
        NextButton.isHidden = true
        NextButton.isEnabled = false
        Image1.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image2.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image3.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image4.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image5.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image6.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image7.image = UIImage(imageLiteralResourceName: "questionmark.png")
        Image8.image = UIImage(imageLiteralResourceName: "questionmark.png")
        
        ob = FactsApiCall()
        
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    
        super.viewDidAppear(animated)
    }
    
    func checkclick(num1:Int, num2:Int)
    {
        if(dictnry[num1] == num2 && dictnry[num2] == num1)
        {
            matches += 1
        }
        else
        {
            switch num1
            {
            case 1:
                Image1.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 2:
                Image2.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 3:
                Image3.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 4:
                Image4.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 5:
                Image5.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 6:
                Image6.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 7:
                Image7.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 8:
                Image8.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            default:
                print("10")
            }
            switch num2
            {
            case 1:
                Image1.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 2:
                Image2.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 3:
                Image3.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 4:
                Image4.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 5:
                Image5.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 6:
                Image6.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 7:
                Image7.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            case 8:
                Image8.image = UIImage(imageLiteralResourceName: "questionmark.jpg")
            default:
                print("10")
            }
        } // end of else
        // switch case to turn bad ones back to ?
        
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        
    } // end of checkclick
    
    override func viewWillAppear(_ animated: Bool) {  // to hide the Header bar in navigation controller
        self.navigationController?.setNavigationBarHidden(false /*true*/, animated: animated)
        super.viewWillAppear(animated)
    }
    
    @IBAction func Button1(_ sender: UIButton)
    {
        clickcount += 1
        score -= 10
        ScoreLabel.text = "Score = \(score)"
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        Image1.image = UIImage(imageLiteralResourceName: "frenchfries.png")
        if clickcount % 2 == 0
        {
            secondclick = 1
            checkclick(num1: firstclick!, num2:secondclick!)
        }
        else
        {
            firstclick = 1
        }
    }
    @IBAction func Button2(_ sender: UIButton)
    {
        clickcount += 1
        score -= 10
        ScoreLabel.text = "Score = \(score)"
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        Image2.image = UIImage(imageLiteralResourceName: "potatochips.png")
        if clickcount % 2 == 0
        {
            secondclick = 2
            checkclick(num1: firstclick!, num2:secondclick!)
        }
        else
        {
            firstclick = 2
        }
    }
    @IBAction func Button3(_ sender: UIButton)
    {
        clickcount += 1
        score -= 10
        ScoreLabel.text = "Score = \(score)"
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        Image3.image = UIImage(imageLiteralResourceName: "hashbrowns.png")
        if clickcount % 2 == 0
        {
            secondclick = 3
            checkclick(num1: firstclick!, num2:secondclick!)
        }
        else
        {
            firstclick = 3
        }
    }
    @IBAction func Button4(_ sender: UIButton)
    {
        clickcount += 1
        score -= 10
        ScoreLabel.text = "Score = \(score)"
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        Image4.image = UIImage(imageLiteralResourceName: "supotato.png")
        if clickcount % 2 == 0
        {
            secondclick = 4
            checkclick(num1: firstclick!, num2:secondclick!)
        }
        else
        {
            firstclick = 4
        }
    }
    @IBAction func Button5(_ sender: UIButton)
    {
        clickcount += 1
        score -= 10
        ScoreLabel.text = "Score = \(score)"
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        Image5.image = UIImage(imageLiteralResourceName: "potatochips.png")
        if clickcount % 2 == 0
        {
            secondclick = 5
            checkclick(num1: firstclick!, num2:secondclick!)
        }
        else
        {
            firstclick = 5
        }
    }
    @IBAction func Button6(_ sender: UIButton)
    {
        clickcount += 1
        score -= 10
        ScoreLabel.text = "Score = \(score)"
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        Image6.image = UIImage(imageLiteralResourceName: "supotato.png")
        if clickcount % 2 == 0
        {
            secondclick = 6
            checkclick(num1: firstclick!, num2:secondclick!)
        }
        else
        {
            firstclick = 6
        }
    }
    @IBAction func Button7(_ sender: UIButton)
    {
        clickcount += 1
        score -= 10
        ScoreLabel.text = "Score = \(score)"
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        Image7.image = UIImage(imageLiteralResourceName: "hashbrowns.png")
        if clickcount % 2 == 0
        {
            secondclick = 7
            checkclick(num1: firstclick!, num2:secondclick!)
        }
        else
        {
            firstclick = 7
        }
    }
    @IBAction func Button8(_ sender: UIButton)
    {
        clickcount += 1
        score -= 10
        ScoreLabel.text = "Score = \(score)"
        if(matches >= 4)
        {
            NextButton.isEnabled = true
            NextButton.isHidden = false
        }
        Image8.image = UIImage(imageLiteralResourceName: "frenchfries.png")
        if clickcount % 2 == 0
        {
            secondclick = 8
            checkclick(num1: firstclick!, num2:secondclick!)
        }
        else
        {
            firstclick = 8
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destination.
        if(segue.identifier == "GametoResults")
        {
            var obj = segue.destination as! ResultsViewController
            // Pass the selected object to the new view controller.
//            print("\(snapun!) \t\t\t\t\t\t\t\t\t \(ScoreLabel.text!)")
        
            obj.scorefromgame = ScoreLabel.text!
            obj.factsinJSON = ob?.getJSON()
            obj.usrname = snapun!
            obj.avs = avstring!
        }
    }
    

}
