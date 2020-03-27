//
//  ViewController.swift
//  iOS13-Programmatic-Log-In-Screen
//
//  Created by Paul Solt on 3/27/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let textFieldHeight: CGFloat = 40
    let buttonHeight: CGFloat = 50
    let imageHeight: CGFloat = 300

    // Lazy property with closures


    // Scroll View
    //      Content View (UIView - Background)
    //          Top Image View (300)
    //          Stack View

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero) // will resize with Auto Layout
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = self.view.frame.size
        scrollView.backgroundColor = .orange
        return scrollView
    }()

    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .yellow
        return contentView
    }()

    lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "city-anthony-reungere")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()

    lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpViews()
        setUpConstraints()
        
    }
    
    func setUpViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(topImageView)
        contentView.addSubview(bottomView)
        
        bottomView.addSubview(stackView)
        
        // Add all form elements to the StackView
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            // Scroll View
            scrollView.topAnchor.constraint(equalTo: view.topAnchor), // view.safeAreaLayoutGuide.topAnchor
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Don't add constraints to content view, since we want it to grow based on size of content
            
            // Top Image View
            topImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            topImageView.bottomAnchor.constraint(equalTo: bottomView.topAnchor),
            
            topImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            // Bottom Stack View
            bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bottomView.heightAnchor.constraint(greaterThanOrEqualToConstant: 20), // we won't see this view because it collapses due to not having any content

            // Stack View
            stackView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),

            
        
        ])
    }
}

