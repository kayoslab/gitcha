import Combine
import gitcha_networking

/// An extension for the networking service that allows to create observable network tasks which
/// then can be used by the user interface.
final class ObservableTask<A>: ObservableObject where A: Task {
    /// Will change notification
    let objectWillChange = ObservableObjectPublisher()
    /// Did change notification
    let didChange = PassthroughSubject<A.SuccessType, NetworkingError>()
    /// The underlying task which should be executed.
    private let task: A
    
    /// The response data in case the task's execution was successful.
    var data: A.SuccessType? {
        willSet {
            objectWillChange.send()
        }
        
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let value = self?.data else { return }
                self?.didChange.send(value)
            }
        }
    }
    
    /// The response data in case the task's execution resulted in an error.
    var error: NetworkingError? {
        willSet {
            objectWillChange.send()
        }
        
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let error = self?.error else { return }
                self?.didChange.send(completion: .failure(error))
            }
        }
    }

    init(task: A) {
        self.task = task
        reload()
    }

    /// Call this function to load/reload the task data.
    func reload() {
        task.execute { [weak self] (result) in
            switch result {
            case .success(let value):
                self?.data = value
            case .failure(let error):
                self?.error = error
            }
        }
    }
}
