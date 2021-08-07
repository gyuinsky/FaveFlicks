import Combine



struct UserInfo {
  let userName: String
  let favoriteGenre: String
}



// 1
class UserStore: ObservableObject {
  // 2
  @Published var currentUserInfo: UserInfo?
}
