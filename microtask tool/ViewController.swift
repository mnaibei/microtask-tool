//
//  ViewController.swift
//  microtask tool
//
//  Created by Mucha Naibei on 10/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Next Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
               
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
            getRandomPhoto()
        }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 30, y:view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    
    func getRandomPhoto(){
        
        //var urlString = ["https://placetrustafrica.blob.core.windows.net/civ/Spatial%20Collective/KISIP%20Uploads/Ready%20for%20use/Mlango%20Kubwa%20anonymized%20compressed/GSAA0185.JPG", "https://placetrustafrica.blob.core.windows.net/civ/Spatial%20Collective/KISIP%20Uploads/Ready%20for%20use/Mlango%20Kubwa%20anonymized%20compressed/GSAA0206.JPG", "https://placetrustafrica.blob.core.windows.net/civ/Spatial%20Collective/KISIP%20Uploads/Ready%20for%20use/Mlango%20Kubwa%20anonymized%20compressed/GSAA0526.JPG"]
        let urlString =
                "https://placetrustafrica.blob.core.windows.net/civ/Spatial%20Collective/KISIP%20Uploads/Ready%20for%20use/Mlango%20Kubwa%20anonymized%20compressed/GSAA0185.JPG"
      
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
    }

}

