//
//  ProfileScreen.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

class Achievement: NSObject {
    var achievementTitle: String
    var achievementDescription: String
    var completedDate: Date

    init(achievementTitle: String, achievementDescription: String, completedDate: Date) {
        self.achievementTitle = achievementTitle
        self.achievementDescription = achievementDescription
        self.completedDate = completedDate
    }
}

class ProfileScreen: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var joinedSinceLabel: UILabel!
    @IBOutlet var rankLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!

    var achievements = [Achievement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if achievements.isEmpty {
            collectionView.isHidden = true
            let emptyLabel = UILabel()
            emptyLabel.translatesAutoresizingMaskIntoConstraints = false
            emptyLabel.text = "No achievements have been found"
            view.addSubview(emptyLabel)

            NSLayoutConstraint.activate([
                emptyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emptyLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        } else {
            collectionView.isHidden = false
        }

        #if DEBUG
        let user = User(avatar: UIImage(named: "avatar")!, name: "Jerry Turcios", joinedSinceDate: Date(timeIntervalSinceNow: 0), rank: .hunter)
        imageView.image = user.avatar
        imageView.contentMode = .scaleAspectFill
        nameLabel.text = user.name
        nameLabel.font = .boldSystemFont(ofSize: 30)

        let calendar = Calendar.current
        let month = calendar.component(.month, from: user.joinedSinceDate)
        let day = calendar.component(.day, from: user.joinedSinceDate)
        let year = calendar.component(.year, from: user.joinedSinceDate)
        joinedSinceLabel.text = "Active since \(month)/\(day)/\(year)"

        rankLabel.text = "Current Rank: \(user.rank.rawValue)"
        #endif

        setupStyling()
    }

    private func setupStyling() {
        // Configures the view's styling
        view.backgroundColor = .opaqueSeparator

        // Configures the image view styling
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
}

extension ProfileScreen: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Achievement", for: indexPath) as? AchievementCell else {
//            fatalError("Error: Unable to dequeue collection view cell for achievements")
//        }
//

        return UICollectionViewCell()
    }
}
