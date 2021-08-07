import SwiftUI

struct UserView: View {
  
  
  @State private var userName = ""
  @State private var favoriteGenre = ""
  
  @EnvironmentObject var userStore: UserStore
  
  @Environment(\.presentationMode) var presentationMode
  
  
  var body: some View {
    
    NavigationView {
      Form {
        Section(header: Text("User")) {
          TextField("User name", text: $userName)
        }
        Section(header: Text("Favorite Genre")) {
          
          GenrePicker(genre: $favoriteGenre)
          
        }
      }
      
    }
    
    .navigationBarTitle(Text("\(userName) info"), displayMode: .inline)
    
    .navigationBarItems(
    trailing:
      Button(action: updateUserInfo) {
        Text("update")
      
      
      }
    )
//    ).onAppear {
//      userName = userStore.currentUserInfo?.userName ?? ""
//      favoriteGenre = userStore.currentUserInfo?.favoriteGenre ?? ""
//    }

    
    
  }
  
  func updateUserInfo(){
    
    let newUserInfo = UserInfo(userName: userName, favoriteGenre: favoriteGenre)
    userStore.currentUserInfo = newUserInfo
    
    presentationMode.wrappedValue.dismiss()
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
  }
}
