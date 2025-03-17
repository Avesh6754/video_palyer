

---

# 🎬 Video Player App  

## 📌 Overview  
The **Video Player App** is a Flutter-based application that allows users to stream videos from an API. It utilizes the **Provider** package for state management and integrates **Chewie** and **Video Player** for smooth video playback with custom controls.

---

## 🚀 Features  
✅ Fetch and display videos from an API  
✅ Play/Pause, Seek, and Fullscreen options  
✅ Adaptive controls using **Chewie**  
✅ Video buffering and error handling  
✅ State management with **Provider**  

---

## 🛠 Tech Stack  
- **Flutter** (Framework)  
- **Dart** (Programming Language)  
- **Provider** (State Management)  
- **Video Player Package** (Core Video Playback)  
- **Chewie Package** (Enhanced Video UI)  
- **REST API** (Fetching Video Data)  

---

## 📸 Screenshots  
*(Include app screenshots here to showcase UI and functionality.)*  

---

## 🔧 Installation  
1. **Clone the repository:**  
   ```bash
   git clone https://github.com/yourusername/video-player-app.git
   ```
2. **Navigate to the project directory:**  
   ```bash
   cd video-player-app
   ```
3. **Install dependencies:**  
   ```bash
   flutter pub get
   ```
4. **Run the app:**  
   ```bash
   flutter run
   ```

---

## 📂 Folder Structure  
```
lib/
│── main.dart               # Entry point of the app
│── models/                 # Data models for API response
│── providers/              # State management using Provider
│── screens/                # UI Screens
│── services/               # API Service for fetching videos
│── widgets/                # Reusable widgets
```

---

## 🛠 Dependencies  
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  chewie: ^1.7.1
  video_player: ^2.7.0
  http: ^0.13.5
```

---

## 📡 API Integration  
Make sure to replace the **API URL** in `services/video_service.dart`:  
```dart
final String apiUrl = "https://yourapi.com/videos";
```

---

## 👨‍💻 Contributing  
Contributions are welcome! Feel free to fork this repository and submit a pull request.

---

## 📜 License  
This project is licensed under the **MIT License**.


---
<p>
  <img src="https://github.com/user-attachments/assets/03b4be77-6aa0-4305-a191-5d123066d52d" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/af2ee56a-b149-41fe-8b29-7d031357a2fd" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/5ec8c4cf-eb1f-4d94-af6e-3f6a74701686" width="22%" Height="35%">
  </p>
