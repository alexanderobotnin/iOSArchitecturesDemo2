//
//  SongDetailHeaderView.swift
//  iOSArchitecturesDemo
//
//  Created by Alexander Obotnin on 03.01.2023.
//  Copyright © 2023 Alexander Obotnin. All rights reserved.
//

import UIKit

class SongDetailHeaderView: UIView {
    
    // MARK: - Subviews
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupLayout()
    }
    
    // MARK: - UI
    
    private func setupLayout() {
        self.addSubview(self.imageView)
        self.addSubview(self.trackNameLabel)
        self.addSubview(self.artistNameLabel)
        self.addSubview(self.collectionNameLabel)
        self.addSubview(self.genreLabel)
        self.addSubview(self.releaseDateLabel)
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.imageView.widthAnchor.constraint(equalToConstant: 120.0),
            self.imageView.heightAnchor.constraint(equalToConstant: 120.0),
            
            self.trackNameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 12.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16.0),
            self.trackNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16.0),
            
            self.artistNameLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor, constant: 8.0),
            self.artistNameLabel.leftAnchor.constraint(equalTo: self.trackNameLabel.leftAnchor),
            self.artistNameLabel.rightAnchor.constraint(equalTo: self.trackNameLabel.rightAnchor),
            
            self.collectionNameLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: 8.0),
            self.collectionNameLabel.leftAnchor.constraint(equalTo: self.artistNameLabel.leftAnchor),
            self.collectionNameLabel.rightAnchor.constraint(equalTo: self.artistNameLabel.rightAnchor),
            
            self.genreLabel.topAnchor.constraint(equalTo: self.collectionNameLabel.bottomAnchor, constant: 8.0),
            self.genreLabel.leftAnchor.constraint(equalTo: self.artistNameLabel.leftAnchor),
            
            self.releaseDateLabel.topAnchor.constraint(equalTo: self.genreLabel.topAnchor),
            self.releaseDateLabel.leftAnchor.constraint(equalTo: self.genreLabel.rightAnchor),
            self.releaseDateLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            
        ])
    }
}
