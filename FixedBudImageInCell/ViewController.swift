//
//  ViewController.swift
//  FixedBudImageInCell
//
//  Created by Олександр on 22.06.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var images = ["https://img.freepik.com/free-photo/rpa-concept-with-blurry-hand-touching-screen_23-2149311914.jpg?w=1480&t=st=1687444582~exp=1687445182~hmac=88a006e7a301523a9072b6f55a429a176b1fe363b1d6153cb1bfc23682592dc8",
        "https://transcosmos.co.uk/wp-content/uploads/2015/10/technology-customer-support1.jpg",
        "https://media.istockphoto.com/id/1321462048/photo/digital-transformation-concept-system-engineering-binary-code-programming.jpg?s=612x612&w=0&k=20&c=Ib8RLw3_eCOo9N3YE4pvp9rcb_WmirjS-9x9R-vTd68=",
        "https://t4.ftcdn.net/jpg/03/08/69/75/360_F_308697506_9dsBYHXm9FwuW0qcEqimAEXUvzTwfzwe.jpg",
        "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dGVjaG5vbG9neXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
        "https://dxc.scene7.com/is/image/dxc/AdobeStock_432104398-6?qlt=90&wid=1200&ts=1669901329429&$landscape_desktop$&dpr=off",
        "https://thumbs.dreamstime.com/b/consultant-presenting-tag-cloud-information-technology-213591032.jpg",
        "https://www.techbooky.com/wp-content/uploads/2018/04/technology-and-us-scaled.jpg",
        "https://media.gettyimages.com/id/1335295270/photo/global-connection.jpg?s=612x612&w=gi&k=20&c=xs_DvcvEflA-EIRXXGK71Et6OtVHldTx2E7flyjybk0="]
    
    let cellIdentifier = "myCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        let xib = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(xib, forCellReuseIdentifier: cellIdentifier)
    }
}




extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MyTableViewCell
        cell.setImageInCell(path: images[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
