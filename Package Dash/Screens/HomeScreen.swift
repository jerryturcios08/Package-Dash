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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyling()

        #if DEBUG
        // Add dummy data for tasks
        tasks.append(Task(image: UIImage(named: "Package Collector Icon")!, category: .packageCollector, summary: "A supply package was found a few miles from home base. Retrieve it in order to obtain supplies for the next week.", status: .ready))
        tasks.append(Task(image: UIImage(named: "Relocation Icon")!, category: .relocation, summary: "A group of bandits have rallied up and are approaching home base. We need to relocate to a safehouse 5 miles away from our current location.", status: .inProgress))
        tasks.append(Task(image: UIImage(named: "Package Collector Icon")!, category: .packageCollector, summary: "A supply package was found a few miles from home base. Retrieve it in order to obtain supplies for the next week.", status: .ready))
        tasks.append(Task(image: UIImage(named: "Relocation Icon")!, category: .relocation, summary: "A group of bandits have rallied up and are approaching home base. We need to relocate to a safehouse 5 miles away from our current location.", status: .inProgress))
        tasks.append(Task(image: UIImage(named: "Package Collector Icon")!, category: .packageCollector, summary: "A supply package was found a few miles from home base. Retrieve it in order to obtain supplies for the next week.", status: .ready))
        tasks.append(Task(image: UIImage(named: "Relocation Icon")!, category: .relocation, summary: "A group of bandits have rallied up and are approaching home base. We need to relocate to a safehouse 5 miles away from our current location.", status: .inProgress))
        tasks.append(Task(image: UIImage(named: "Package Collector Icon")!, category: .packageCollector, summary: "A supply package was found a few miles from home base. Retrieve it in order to obtain supplies for the next week.", status: .ready))
        tasks.append(Task(image: UIImage(named: "Relocation Icon")!, category: .relocation, summary: "A group of bandits have rallied up and are approaching home base. We need to relocate to a safehouse 5 miles away from our current location.", status: .inProgress))
        tasks.append(Task(image: UIImage(named: "Package Collector Icon")!, category: .packageCollector, summary: "A supply package was found a few miles from home base. Retrieve it in order to obtain supplies for the next week.", status: .ready))
        tasks.append(Task(image: UIImage(named: "Relocation Icon")!, category: .relocation, summary: "A group of bandits have rallied up and are approaching home base. We need to relocate to a safehouse 5 miles away from our current location.", status: .inProgress))
        tasks.append(Task(image: UIImage(named: "Package Collector Icon")!, category: .packageCollector, summary: "A supply package was found a few miles from home base. Retrieve it in order to obtain supplies for the next week.", status: .ready))
        tasks.append(Task(image: UIImage(named: "Relocation Icon")!, category: .relocation, summary: "A group of bandits have rallied up and are approaching home base. We need to relocate to a safehouse 5 miles away from our current location.", status: .inProgress))
        tasks.append(Task(image: UIImage(named: "Package Collector Icon")!, category: .packageCollector, summary: "A supply package was found a few miles from home base. Retrieve it in order to obtain supplies for the next week.", status: .ready))
        tasks.append(Task(image: UIImage(named: "Relocation Icon")!, category: .relocation, summary: "A group of bandits have rallied up and are approaching home base. We need to relocate to a safehouse 5 miles away from our current location.", status: .inProgress))
        #endif
    }

    private func setupStyling() {
        // Configure screen properties
        title = "Today"
        navigationController?.navigationBar.tintColor = .white
        tabBarController?.tabBar.tintColor = .white

        // Configure table view properties
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TaskSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let vc = segue.destination as? TaskScreen {
                    let task = tasks[indexPath.row]
                    vc.selectedTask = task
                }
            }
        }
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

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
