<h1>Welcome</h1>
<h2>Push Notification with Flutter & Firebase</h2>

<p style=""> ⚠️⚠️ there is no <i> google-services.json </i>file attached in this project because of security issues, you need to attach it with your own firebase project ⚠️⚠️</p> 

<br>
you need the below dependencies for this project and <i>you can use latest packages using links below</i>
<br><br>
dependencies: <br>
&nbsp;&nbsp;&nbsp;
  <a href='https://pub.dev/packages/firebase_core'>
    firebase_core: ^1.15.0 
  </a><br>
&nbsp;&nbsp;&nbsp;
  <a href='https://pub.dev/packages/overlay_support'>
    overlay_support: ^1.2.1
  </a><br>
&nbsp;&nbsp;&nbsp;
  <a href='https://pub.dev/packages/firebase_messaging'>
    firebase_messaging: ^11.2.14
  </a><br>

&nbsp;&nbsp;&nbsp;
  <a href='https://pub.dev/packages/firebase_analytics'>
    firebase_analytics: ^9.1.6  &nbsp;&nbsp;&nbsp;  #you need to enable firebase analytics from firebase
  </a><br>
<br>

<br><br><br>

And add this code line to the <b>AndroidManifest.xml</b> in <i>'android\app\src\main'</i>



      <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
            <intent-filter>
                <action android:name="FLUTTER_NOTIFICATION_CLICK"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>


At last add these for the Custom Data as Additional Options in firebase masseging <i> <a href='https://github.com/dinethsiriwardana/flutter-notification/blob/main/ScreenShot/4.png?raw=true'> In Here <a> </i>
  <br>
Key - click_action <br>
Value - FLUTTER_NOTIFICATION_CLICK
