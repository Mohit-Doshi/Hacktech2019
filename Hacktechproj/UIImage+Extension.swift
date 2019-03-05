//
//  UIImage+Extension.swift
//  Hacktechproj
//
//  Created by Mohit on 02/03/19.
//  Copyright © 2019 Mohit D. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(from urlString: String){
        guard let imageURL = URL(string: urlString) else {
            return
        }
        
        do {
            let data = try Data(contentsOf: imageURL)
            let image = UIImage(data: data)
            self.image = image
        } catch {
            
        }
    }
}


extension UIImage {
    
    static func load(from urlString: String) -> UIImage? {
        guard let imageURL = URL(string: urlString),
            let data = try? Data(contentsOf: imageURL) else {
                return nil
        }
        return UIImage(data: data)
    }
    
    

}
