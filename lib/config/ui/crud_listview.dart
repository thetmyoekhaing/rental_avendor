import 'package:flutter/material.dart';
import 'package:rental_vendor/constants/constants.dart';

class CRUDListView extends StatelessWidget {
  bool isBusinesses;
  VoidCallback? onPressed;
  VoidCallback? editOnPressed;
  VoidCallback? deleteOnPressed;
  List list;
  CRUDListView(
      {super.key,
      required this.list,
      required this.isBusinesses,
      required this.deleteOnPressed,
      required this.editOnPressed,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final oneItem = list[index];
          return Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: prussianBlue,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        oneItem.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(color: white, fontSize: 20),
                      ),
                    ),
                    isBusinesses
                        ? Text(
                            oneItem.address ?? '',
                            style: const TextStyle(color: white, fontSize: 20),
                          )
                        : Container(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: editOnPressed ?? () {},
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: pictionBlue,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "Edit",
                              style: TextStyle(color: white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: deleteOnPressed ?? () {},
                          icon: const Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.redAccent,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          );
        },
      ),
    );
  }
}
