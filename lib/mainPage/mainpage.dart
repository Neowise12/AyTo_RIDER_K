import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rider/Utilites/mydrawer.dart';
import 'package:rider/mainPage/Ambulance.dart';
import 'package:rider/mainPage/DetailsFetch.dart';







class MainPage extends StatefulWidget {
  //final User user;
  // ignore: use_key_in_widget_constructors
  const MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<ScaffoldState> scaffoldkey= GlobalKey<ScaffoldState>();

  GoogleMapController? _controller;
  Location currentLocation = Location();
  final Set<Marker> _markers={};
  var x , y;


  late GoogleMapController mapController;
  //final Completer<GoogleMapController> _controller = Completer();
  double mapBottomPadding =0;
  //var geolocator =Geolocator();
  //late Position currentPosition;

  // void setPositionlocator() async{
  //
  //   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
  //   currentPosition = position;
  //   LatLng pos = LatLng(position.latitude,position.longitude);
  //   CameraPosition cp = CameraPosition(target: pos,zoom: 14);
  //   mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  //
  //
  // }

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );
  void getLocation() async{
    currentLocation.onLocationChanged.listen((LocationData loc){

      _controller?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
        zoom: 12.0,
      )));
      setState(() {
        _markers.add(Marker(markerId: const MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
        x = loc.latitude!;
        y = loc.longitude!;


      });
    });
  }

  @override
  void initState(){
    super.initState();
    setState(() {
      getLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldkey,
      drawer: const MyDrawer(),
      body: Stack(
        children:  [
          GoogleMap(
            padding: EdgeInsets.only(bottom: mapBottomPadding),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition:CameraPosition(
              target: LatLng(x,y),
              zoom: 12.0,
            ),
            onMapCreated: (GoogleMapController controller){
              _controller = controller;

              getLocation();
            },
            markers: _markers,


            //     setState(() {
            //       mapBottomPadding= 250;
            //     });
            //     setPositionlocator();
            //
            //   },
            //
          ),
          //drawer
          Positioned(
            top: 44,
            left: 15,
            child: GestureDetector(
              onTap: (){
                scaffoldkey.currentState!.openDrawer();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [ BoxShadow(
                        color:Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 0.5,
                        offset: Offset(
                          0.7,
                          0.7,
                        )
                    )]

                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(Icons.menu, color: Colors.black26,),
                ),
              ),
            ),
          ),
          //search
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 220,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                  boxShadow:[ BoxShadow(
                      color:  Colors.black26,
                      blurRadius: 15.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7, 0.7)

                  )]

              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 5.0,),
                    const Text("hey there!",style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold), ),
                    const Text("Where you wanna go?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          // color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow:[ BoxShadow(
                              color:  Colors.black26,
                              blurRadius: 15.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7)), ]
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Details()));
                        },
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.airport_shuttle_outlined ,color: Colors.black,),
                            ),
                            SizedBox(width: 22,),
                            Text("Check transport availability"),

                          ],
                        ),
                      ),),
                    const SizedBox(height: 22,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Ambulance()));

                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            boxShadow:[ BoxShadow(
                                color:  Colors.black26,
                                blurRadius: 15.0,
                                spreadRadius: 0.5,
                                offset: Offset(0.7, 0.7)), ]
                        ),
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.airport_shuttle_outlined ,color: Colors.red,),
                            ),
                            SizedBox(width: 22,),
                            Text("Ambulance"),

                          ],
                        ),),
                    ),



                  ],
                ),
              ),


            ),
          )
        ],
      ),
    );
  }
}
