import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_sound_player/Model/MySongModel.dart';



class CloudSongController extends GetxController {
  final db = FirebaseFirestore.instance;

  RxList<MySongModel> cloudSongList = RxList<MySongModel>([]);
  RxList<MySongModel> trandingSongList = RxList<MySongModel>([]);

  @override
  void onInit() {
    getCloudSound();
    // TODO: implement onInit
    super.onInit();
  }

  void uploadSongToDB() async{
    MySongModel newSong = MySongModel(
      id: 1,
      title: "WhatsApp Audio ",
      artist: "Jubain Nautiyal",
      album: "album",
      albumArt: "https://c.saavncdn.com/586/Dil-Kahe-Hindi-2020-20200904224534-500x500.jpg",
      data: "gs://music-eeb9a.appspot.com/Morning-Light(chosic.com).mp3",
    );

    await db.collection("tranding").add(newSong.toJson());
    print("😍 Song upload to Database  😍");
  }


   void getCloudSound() async {
     cloudSongList.clear();
     await db.collection("songs").get().then((value) {
       value.docs.forEach((element) {
         cloudSongList.add(MySongModel.fromJson(element.data()));
       });
     });
     await db.collection("tranding").get().then((value) {
       value.docs.forEach((element) {
         trandingSongList.add(MySongModel.fromJson(element.data()));
       });
     });
   }

}
