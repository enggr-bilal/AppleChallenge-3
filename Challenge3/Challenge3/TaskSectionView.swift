import SwiftUI

struct TaskSectionView: View {
    var title: String
    @Binding var tasks: [String]
    @Binding var otherTasks: [String]
    @Binding var doneTasks: [String]
    var iconName: String
    var isSooner: Bool
    
    var body: some View {
        Section(header: HStack {
            Image(systemName: iconName)
                .foregroundColor(.blue)
            Text(title)
                .font(.headline)
        }) {
            ForEach(tasks.indices, id: \.self) { index in
                HStack {
                    // Move Buttons
                    Button(action: {
                        moveTaskToOtherSection(index)
                    }) {
                        Image(systemName: isSooner ? "arrow.down.circle" : "arrow.up.circle")
                            .foregroundColor(.blue)
                    }
                    
                    // Task Editable Text
                    TextField("Edit task", text: Binding(
                        get: { tasks[index] },
                        set: { tasks[index] = $0 }
                    ))
                    
                    Spacer()
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        markTaskAsDone(index)
                    } label: {
                        Label("Done", systemImage: "checkmark")
                    }
                }
            }
            .onDelete(perform: deleteTask)
        }
    }
    
    // Move task to the other section
    private func moveTaskToOtherSection(_ index: Int) {
        let task = tasks[index]
        tasks.remove(at: index)
        otherTasks.append(task)
    }
    
    // Mark task as done
    private func markTaskAsDone(_ index: Int) {
        let task = tasks[index]
        tasks.remove(at: index)
        doneTasks.append(task)
    }
    
    // Delete Task
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
