import SwiftUI

struct RepositoryCell : View {
    var repository: Repository
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(repository.name)
                    .bold()
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .lineLimit(1)
            }
            if repository.description != nil {
                Spacer(minLength: 4.0)
                HStack {
                    Text(repository.description ?? "")
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
            }
            Spacer(minLength: 16.0)
            
            HStack() {
                Image(systemName: "star")
                    .font(.system(size: 14.0))
                Text("\(repository.stargazersCount)")
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                Spacer(minLength: 16.0)
                
                Image(systemName: "eye")
                    .font(.system(size: 14.0))
                Text("\(repository.watchersCount)")
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                Spacer(minLength: 16.0)
                
                Image(systemName: "arrow.branch")
                    .font(.system(size: 14.0))
                Text("\(repository.forksCount)")
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                Spacer(minLength: 16.0)
                
                if repository.license?.key != nil {
                    Image(systemName: "doc.text")
                        .font(.system(size: 14.0))
                    Text("\(repository.license?.key ?? "")")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer(minLength: 16.0)
                }
            }
        }
    }
}
