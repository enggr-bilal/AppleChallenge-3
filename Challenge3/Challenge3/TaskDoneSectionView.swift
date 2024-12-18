import SwiftUI

struct TaskDoneSectionView: View {
    var title: String
    @Binding var tasks: [String]
    var iconName: String
    
    var body: some View {
        Section(header: HStack {
            Image(systemName: iconName)
                .foregroundColor(.green)
            Text(title)
                .font(.headline)
        }) {
            ForEach(tasks, id: \.self) { task in
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text(task)
                        .strikethrough()
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
    }
}
