//
//  ViewController.swift
//  Package Dash
//
//  Created by Jerry Turcios on 2/8/20.
//  Copyright © 2020 Jerry Turcios. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {
    @IBOutlet var tableView: UITableView!

    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()

        #if DEBUG
        // Add dummy data for tasks
        #endif
    }
}

extension HomeScreen: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Task", for: indexPath) as? TaskCell else {
            fatalError("Error: Unable to dequeue table view cell for tasks")
        }

        let task = tasks[indexPath.row]
        cell.setupCell(task: task)

        return cell
    }
}
