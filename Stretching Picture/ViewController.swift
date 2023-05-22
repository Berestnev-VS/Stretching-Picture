//
//  ViewController.swift
//  Stretching Picture
//
//  Created by Владимир on 20.05.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "falcon")
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    var scrollView: UIScrollView = UIScrollView()
    
    let initialImageViewHeight: CGFloat = 270.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        scrollView.frame = view.bounds
        imageView.frame = CGRect(x: .zero, y: -scrollView.safeAreaInsets.top, width: scrollView.frame.width, height: initialImageViewHeight)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        if y < 0 {
            imageView.frame = .init(x: .zero, y: -scrollView.safeAreaInsets.top - abs(y), width: scrollView.frame.width, height: initialImageViewHeight + abs(y))
        }
        scrollView.verticalScrollIndicatorInsets.top = imageView.frame.height - view.safeAreaInsets.top
    }
    
}

