//
//  ViewController.swift
//  news
//
//  Created by Zulyar Kurban on 28/12/2017.
//  Copyright © 2017 Zulyar Kurban. All rights reserved.
//

import UIKit
import SDWebImage
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var titleArray = [String]()
        var imageArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        NewsData()
        self.tableView.reloadData()
    }

    
    func NewsData(){
        
        let mainPath = "https://newsapi.org/v2/top-headlines?sources=crypto-coins-news&apiKey=90b8d2a7843848549d882c1070d069b2"
          let url = URL(string: mainPath)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print("Something going wrong")
            } else {
                do {
                    if let parsedata = try JSONSerialization.jsonObject(with: data!, options: .allowFragments ) as? NSDictionary {
                        if let articlesArray  = parsedata.value(forKey: "articles") as? NSArray {
                            for myarticle in articlesArray {
                                if let articleDic = myarticle as? NSDictionary {
                                    if let title = articleDic.value(forKey: "title") {
                                        self.titleArray.append(title as! String)
                                       
                                    }
                                    if let image = articleDic.value(forKey: "urlToImage") {
                                        self.imageArray.append(image as! String)
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! customCellTableViewCell
     
        cell.CustomTitle.text = titleArray[indexPath.row]
        cell.Customimage.sd_setImage(with: URL(string: imageArray[indexPath.row]))
        
        return cell
    }

}

