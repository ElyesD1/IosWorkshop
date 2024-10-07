//
//  displaydetails.swift
//  testt
//
//  Created by Apple Esprit on 24/9/2024.
//

import UIKit

class displaydetails: UIViewController {

   
    
    
    
    var itemname : String?
    var brandnamee : String?
    var itempricee : String?
    
    @IBOutlet weak var itemprice: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var item: UILabel!
    
    @IBOutlet weak var brandname: UILabel!

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    image.image = UIImage(named: itemname! )
    item.text = itemname!
    brandname.text = brandnamee!
    itemprice.text = itempricee!

    
    
}

}
