# ProGuard rules for Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# ProGuard rules for Kotlin
-keep class kotlin.** { *; }
-dontwarn kotlin.**

# ProGuard rules for your app (ajuste conforme necessário)
-keep class com.example.pizza_app.** { *; }
-dontwarn com.example.pizza_app.**
