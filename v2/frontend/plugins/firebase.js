import firebase from "firebase";

const firebaseConfig = {
  apiKey: "AIzaSyBmeZbN75mQN8ghSHWAoXsSzF8oyLDF9Aw",
  authDomain: "lizards-risyu.firebaseapp.com",
  projectId: "lizards-risyu",
  storageBucket: "lizards-risyu.appspot.com",
  messagingSenderId: "854045817351",
  appId: "1:854045817351:web:9fd5eb342d1a9f10e448a2",
  measurementId: "G-SYYEY0EFDX",
};

if (!firebase.apps.length) {
  firebase.initializeApp(firebaseConfig);
}

export default firebase;
