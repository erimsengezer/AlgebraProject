//
//  ViewController.swift
//  AlgebraProject
//
//  Created by Erim Şengezer on 23.10.2019.
//  Copyright © 2019 Erim Şengezer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    //MARK: - Variables
    
    var responseArray = [String]()
    var profileImageArray = [UIImage]()
    var chosenName = ""
    var chosenImage = UIImage()
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        profileImageArray.append(UIImage(named: "profile1")!)
        profileImageArray.append(UIImage(named: "profile3")!)
        profileImageArray.append(UIImage(named: "profile2")!)
        
        let url = URL(string: "https://5db03c618087400014d37bd9.mockapi.io/algebra/data")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OKAY", style: .default, handler: nil)
                
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            self.responseArray = jsonResponse["people"] as! [String]
                            print(self.responseArray)
                            self.tableView.reloadData()
                        }
                    }catch{
                        print("error")
                    }
                    
                    
                }
                
            }
        }
        task.resume()
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArray.count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.profileImage.image = profileImageArray[indexPath.row]
        cell.nameLabel.text = responseArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenName = responseArray[indexPath.row]
        chosenImage = profileImageArray[indexPath.row]
        
        performSegue(withIdentifier: "goToDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedName = chosenName
            destinationVC.selectedImage = chosenImage
        }
    }

    
}

