import Foundation

class TaskManager: ObservableObject {
    @Published var tasksSooner: [String]
    @Published var tasksLater: [String]
    @Published var doneTasks: [String]
    
    init(sooner: [String], later: [String], done: [String]) {
        self.tasksSooner = sooner
        self.tasksLater = later
        self.doneTasks = done
    }
    
    func addNewTask(_ task: String) {
        if !task.isEmpty {
            tasksSooner.append(task)
        }
    }
    
    func moveTaskToOtherSection(_ task: String, isSooner: Bool) {
        if isSooner {
            tasksSooner.removeAll { $0 == task }
            tasksLater.append(task)
        } else {
            tasksLater.removeAll { $0 == task }
            tasksSooner.append(task)
        }
    }
    
    func markTaskAsDone(_ task: String) {
        tasksSooner.removeAll { $0 == task }
        tasksLater.removeAll { $0 == task }
        doneTasks.append(task)
    }
    
    func deleteTask(_ task: String) {
        tasksSooner.removeAll { $0 == task }
        tasksLater.removeAll { $0 == task }
    }
}
