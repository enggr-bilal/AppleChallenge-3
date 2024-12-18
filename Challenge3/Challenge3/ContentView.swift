import SwiftUI

struct ContentView: View {
    @State private var tasksSooner = [
        "Tap an archived todo to delete it",
        "Swipe a done todo to undo it",
        "Swipe a todo to mark it done"
    ]
    
    @State private var tasksLater = [
        "Tap a todo's text to edit it",
        "Add a Twodos widget",
        "Leave a review for Twodos"
    ]
    
    @State private var doneTasks: [String] = [] // Tasks marked as done
    @State private var newTask: String = "" // To hold the new task text
    
    var body: some View {
        NavigationView {
            VStack {
                // New Task Input Section
                HStack {
                    TextField("Enter new task...", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        addNewTask()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                }
                .padding()
                
                // Task Lists
                List {
                    // Sooner Section
                    TaskSectionView(
                        title: "Sooner",
                        tasks: $tasksSooner,
                        otherTasks: $tasksLater,
                        doneTasks: $doneTasks,
                        iconName: "clock",
                        isSooner: true
                    )
                    
                    // Later Section
                    TaskSectionView(
                        title: "Later",
                        tasks: $tasksLater,
                        otherTasks: $tasksSooner,
                        doneTasks: $doneTasks,
                        iconName: "calendar",
                        isSooner: false
                    )
                    
                    // Done Section
                    if !doneTasks.isEmpty {
                        TaskDoneSectionView(
                            title: "Done",
                            tasks: $doneTasks,
                            iconName: "checkmark.circle"
                        )
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Your Todos")
            }
        }
    }
    
    // Function to add new tasks to the "Sooner" section
    private func addNewTask() {
        if !newTask.isEmpty {
            tasksSooner.append(newTask)
            newTask = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
