plugins {
    id("com.android.application")
    id("kotlin-android")
    // Flutter Gradle plugin should be applied last
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.untitled"
    compileSdk = 35 // Replace with actual number if flutter.compileSdkVersion fails

    ndkVersion = "27.0.12077973"

    defaultConfig {
        applicationId = "com.example.untitled"
        minSdk = 21 // Replace with actual number if flutter.minSdkVersion fails
        targetSdk = 34 // Replace with actual number if flutter.targetSdkVersion fails
        versionCode = 1 // Replace with actual number if flutter.versionCode fails
        versionName = "1.0" // Replace with actual number if flutter.versionName fails
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
