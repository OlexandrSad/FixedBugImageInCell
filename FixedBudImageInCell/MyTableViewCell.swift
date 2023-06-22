//
//  MyTableViewCell.swift
//  FixedBudImageInCell
//
//  Created by Олександр on 22.06.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    
    var TmpPath: String? //якщо таблицю швидко скролити то накидується багато задач з завантаженнями картинок, всі ці картинки будуть в процесі завантаження, і коли ми зупинимо скролити то в потрібній ячейці відобразиться не та картинка яка по черзі має бути з масива а та яка завантажиться перша з усіх накиданих картинок на завантаження, а всі інші картинки пропадуть(завантажаться марно). Це проперті вирішує цю проблему.
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        self.myImageView.image = nil
    }
    
    func setImageInCell (path: String) {
        self.TmpPath = path//---------------------------------
        DispatchQueue.global().async {
            if let url = URL(string: path),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data),
               self.TmpPath == path {//-----------------------
                DispatchQueue.main.async {
                    self.myImageView.image = image
                }
            }
        }
    }
}
