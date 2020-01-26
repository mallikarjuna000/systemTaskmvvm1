//
//  ViewController.swift
//  systemTask1
//
//  Created by mallikarjuna Bakka on 25/12/19.
//  Copyright © 2019 mallikarjuna Bakka. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
 @objc func handleSwitch(_ sender: UISwitch)
    {
        if (sender.isOn == true){
            print("on")
            tapCount += 1
         self.pageCountButton.title = "switchCount:\(tapCount)"
            
        }
        else{
            print("off")
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var pageCountButton: UIBarButtonItem!
    @IBOutlet var switchCountButton: UIBarButtonItem!
    var arrMovieVM = [MovieViewModel]()
    var tapCount: Int = 0
    override func viewDidLoad() {
      tableView.delegate = self
       tableView.dataSource = self
        super.viewDidLoad()
        self.getData()
       
        
        // Do any additional setup after loading the view.
    }
    func getData(){
      Service.shareInstance.getAllMovieData { (movies, error) in
            
            if(error == nil){
                self.arrMovieVM = movies?.map({return MovieViewModel(movie: $0)}) ?? []
                
                DispatchQueue.main.async{
                    
                    self.tableView.reloadData()
                }
              //  print(movies)
            }
            
        }
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrMovieVM.count
        
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        if (cell == nil) {
          //  println("1")
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "TableViewCell") as! TableViewCell
            //cell = tableViewCell
        }
        
        let MVM = arrMovieVM[indexPath.row]
        let url = URL(string: MVM.artworkUrl30 ?? "")
        //imageView.kf.setImage(with: url)
        cell.titleLabel.text = MVM.artistName ?? ""
        cell.dateLabel.text = MVM.releaseDate ?? ""
        cell.artistImageView.kf.setImage(with: url)
        
        cell.switch.tag = indexPath.row
           
        cell.switch.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
           
        return cell
           
       }
}
