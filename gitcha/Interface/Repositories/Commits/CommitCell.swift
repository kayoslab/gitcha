import SwiftUI

/// The view declaration for a cell that displays a single commit.
struct CommitCell : View {
    var commit: Commit
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(commit.shortSha)
                    .bold()
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .lineLimit(1)
            }
            Spacer(minLength: 4.0)
            HStack {
                Text(commit.data.message)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            Spacer(minLength: 16.0)
            
            HStack() {
                Image(systemName: "person")
                    .font(.system(size: 14.0))
                Text("\(commit.data.name)")
                    .foregroundColor(.gray)
                    .lineLimit(nil)
            }
        }
    }
}
