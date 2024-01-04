import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_task/controller/images/imagesUrl.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: Colors.red.shade700,
        appBar: profileAppBar(),
        body: Container(
          height: height,
          width: width,
          margin: EdgeInsets.only(top: height * 0.1),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('You have an Upcoming appointment!!'),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Image.asset(
                    drImage,
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text('Dr.Emma Mia'),
                trailing: ElevatedButton(
                    onPressed: () {}, child: const Text('Attend Now')),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const ListTile(
                  leading: Text('Monday, May 12 '),
                  trailing: Text('11:00-12:00AM'),
                ),
              ),
              const ListTile(
                leading: Text('Health Articles'),
                trailing: Text('see All'),
              ),
              Expanded(
                  child: ListView.builder(
                    
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    width: 200,
                    child: ClipRRect(
                      
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          byDefaultImages,
                          fit: BoxFit.fill,
                        )),
                  );
                },
              ))
            ],
          ),
        ));
  }

  AppBar profileAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: const Icon(Icons.menu, color: Colors.white),
    );
  }
}
