//
//  RankingViewController.swift
//  Hacktechproj
//
//  Created by Mohit on 03/03/19.
//  Copyright © 2019 Mohit D. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
     let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var rankingtable: UITableView!
    
    var cm:RankingModel = RankingModel();
    var sentlink:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) { // so that the table view always stays updated
        self.rankingtable.reloadData()
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cm.fetchRecord()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // add each row from core data fetchResults
        let cell = tableView.dequeueReusableCell(withIdentifier: "Rankingcell", for: indexPath) as! RankingTableViewCell
      //  cell.layer.borderWidth = 1.0
        
        let rowdata = cm.getRankingObject(row: indexPath.row) as Ranking
        cell.NameLabel?.text = rowdata.name
        cell.ScoreLabel?.text = rowdata.score
        cell.Avtrimg?.load(from: sentlink!)
        return cell
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
