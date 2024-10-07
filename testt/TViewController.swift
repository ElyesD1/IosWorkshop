//
//  TViewController.swift
//  testt
//
//  Created by Apple Esprit on 18/9/2024.
//

import UIKit

class TViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var item = ["Longsleeve Violeta", "Shirt", "Pullover", "Blouse"]
    var brandname = ["Gucci", "H&M", "Bershka", "Zara"]
    var itemprice = ["51$", "46$", "34$", "99$"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        // Create custom logout button
        let logoutButton = UIButton(type: .system)
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.setTitleColor(.systemRed, for: .normal) // Optional: change text color
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)

        // Create UIBarButtonItem using the custom button
        let logoutBarButtonItem = UIBarButtonItem(customView: logoutButton)
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }

    @IBAction func logoutTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
  
    // MARK: - Table View Data Source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")!
        
        let contentView = cell.contentView
        let name = contentView.viewWithTag(1) as! UILabel
        let imageView = contentView.viewWithTag(2) as! UIImageView
        let brandLabel = contentView.viewWithTag(3) as! UILabel
        let priceLabel = contentView.viewWithTag(4) as! UILabel

        name.text = item[indexPath.row]
        brandLabel.text = brandname[indexPath.row]
        priceLabel.text = itemprice[indexPath.row]
        imageView.image = UIImage(named: item[indexPath.row])

        return cell
    }

    // MARK: - Table View Delegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = [item[indexPath.row], brandname[indexPath.row], itemprice[indexPath.row]]
        performSegue(withIdentifier: "arrow", sender: object)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let object = sender as? [String],
           let destination = segue.destination as? displaydetails {
            destination.itemname = object[0]
            destination.brandnamee = object[1]
            destination.itempricee = object[2]
        }
    }
}
