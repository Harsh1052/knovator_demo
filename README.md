# knovator_task

A new Flutter project.

Creating a `README.md` file is an essential step to document your project's functionality, setup instructions, and other relevant details. Below is a template for a `README.md` file that you can customize according to your project's needs.

---

# **Flutter Post List App**

This is a Flutter-based mobile application that displays a list of posts fetched from an API. The app includes advanced features such as post timers, visibility tracking, and local storage integration.

## **Features**

### **1. Display Posts**
- The app fetches posts from the API: `https://jsonplaceholder.typicode.com/posts`.
- Each post is displayed in a `ListView`, with the title and a timer icon.

### **2. Post Details**
- When a user taps on a post, it navigates to a detail screen.
- The detail screen displays the full description of the post fetched from the API endpoint: `https://jsonplaceholder.typicode.com/posts/{postId}`.

### **3. Mark as Read**
- When a user taps on a post, the background color of the post changes to indicate it has been marked as read.
- The initial background color of each post is light yellow, and it changes to white once read.

### **4. Timer Functionality**
- Each post in the list has a timer displayed on the right side.
- The timer starts when the user taps on the timer icon and pauses when the post is not visible on the screen or when the user navigates to the detail screen.
- The timer resumes from where it was paused when the post becomes visible again.

### **5. Visibility Tracking**
- The app tracks the visibility of each post using a `ScrollController`.
- If a post scrolls out of view, the corresponding timer is paused.
- When the post scrolls back into view, the timer resumes.

### **6. Local Storage Integration**
- The app integrates local storage to enhance data persistence.
- Initially, data is displayed from local storage, if available.
- Background synchronization with the API ensures that the data is always up-to-date.

## **Setup Instructions**

### **Prerequisites**
- Ensure you have Flutter installed on your system. You can follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install) to set up your environment.
- You should have a working knowledge of Dart and Flutter.

### **Installation**

1. **Clone the Repository**
   ```bash
   git clone https://github.com/your-username/flutter-post-list-app.git
   cd flutter-post-list-app
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the Application**
   ```bash
   flutter run
   ```

## **Code Structure**

- **`lib/main.dart`:** The entry point of the application.
- **`lib/models/post.dart`:** The `Post` model that represents a single post and its timer state.
- **`lib/models/api_response.dart`:** The `APIRespone` model that represents a dynamic model of the API's response.
- **`lib/screens/home_screen.dart`:** The main screen that displays the list of posts.
- **`lib/screens/detail_screen.dart`:** The detail screen that displays the full post content.
- **`lib/custom_widgets/post_tile`:** The widget that represents each post in the list, managing the timer and visibility.
- **`lib/provider/post_provide.dart`


## **Contributing**

If you'd like to contribute to this project, please fork the repository and use a feature branch. Pull requests are welcome.

## **License**

This project is open source and available under the [MIT License](LICENSE).

---

This template provides a comprehensive overview of the project and includes all the necessary sections to ensure that users and developers can easily understand and work with your Flutter application. Customize it as needed based on your specific project.

## DEMO APK




https://github.com/user-attachments/assets/44028da8-c31c-4639-9fb9-082a22306bee

