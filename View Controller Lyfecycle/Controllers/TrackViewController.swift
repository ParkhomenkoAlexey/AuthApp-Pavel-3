//
//  TrackViewController.swift
//  View Controller Lyfecycle
//
//  Created by Алексей Пархоменко on 06.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController {
    
    let dragDownButton = UIButton()
    let trackImageView = UIImageView()
    let slider = UISlider()
    let currentSecondsLabel = UILabel()
    let timeLeftLabel = UILabel()
    let trackNameLabel = UILabel()
    let artistNameLabel = UILabel()
    let previousTrackButton = UIButton()
    let startStopButton = UIButton()
    let nextTrackButton = UIButton()
    let volumeSlider = UISlider()
    let offVolumeImageView = UIImageView()
    let onVolumeImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set(track: Track(trackName: "bad guy", artistName: "Billie Eilish", collectionName: "WHERE ARE YOU GO", artworkUrl60: nil))
        setupElements()
        setupConstraints()
    }
    
    func set(track: Track) {
        trackNameLabel.text = track.trackName
        artistNameLabel.text = track.artistName
        trackImageView.image = #imageLiteral(resourceName: "fouth")
    }
    
}

// MARK: - Setup Views
extension TrackViewController {
    func setupElements() {
        view.backgroundColor = .white
        dragDownButton.setImage(#imageLiteral(resourceName: "Drag Down"), for: .normal)
//        dragDownButton.translatesAutoresizingMaskIntoConstraints = false
//        trackImageView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Setup Constraints
extension TrackViewController {
    func setupConstraints() {
        
        
        let stackView = UIStackView(arrangedSubviews: [dragDownButton, trackImageView])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        trackImageView.heightAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
        ])
        
    }
}

// MARK: - SwiftUI
import SwiftUI

struct TrackVCProvider: PreviewProvider {
    static var previews: some View {
        Group {
            Group {
                ContainerView().edgesIgnoringSafeArea(.all)
                    .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
                    .previewDisplayName("iPhone 11 Pro")
                
                ContainerView().edgesIgnoringSafeArea(.all)
                    .previewDevice(PreviewDevice(rawValue: "iPhone 7"))
                    .previewDisplayName("iPhone 7")
            }
        }
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = TrackViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<TrackVCProvider.ContainerView>) -> TrackViewController {
            return viewController
        }
        func updateUIViewController(_ uiViewController: TrackVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<TrackVCProvider.ContainerView>) {
            
        }
    }
}
