import 'dart:core';

import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<ScheduleItem> items = <ScheduleItem>[];

  @override
  void initState() {
    super.initState();
    items.add(ScheduleItem(
        autoModel: "Ниссан 12",
        autoNumber: "KZ ADA 123",
        autoPlacesNum: 55,
        cityFrom: "Актау",
        cityTo: "Караганда",
        arrivalDate: "06.02.2020 Thu",
        arrivalTime: "18:54",
        sendDate: "07.02.2020 Fri",
        sendTime: "20:36",
        imgLink: 'assets/images/bus1.png'));

    items.add(ScheduleItem(
        autoModel: "Тойото 3",
        autoNumber: "KZ BQC 123",
        autoPlacesNum: 45,
        cityFrom: "Костанай",
        cityTo: "Астана",
        arrivalDate: "04.05.2020 Thu",
        arrivalTime: "19:30",
        sendDate: "05.05.2020 Fri",
        sendTime: "18:25",
        imgLink: 'assets/images/bus2.png'));
  }

  TextStyle firstRolestyle = const TextStyle(
    fontSize: 20.0,
  );

  TextStyle headerDetails = const TextStyle(
    fontSize: 16.0,
  );

  TextStyle secondRolestyle =
      TextStyle(fontSize: 16.0, color: Colors.grey[600]);

  TextStyle headerRolestyle = const TextStyle(
      fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return getItemList();
  }

  Widget getItemList() {
    return ListView.builder(
      itemBuilder: (context, index) => getItemContainer(id: index),
      itemCount: items.length,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
    );
  }

  Widget getItemContainer({required int id}) {
    ScheduleItem item = items[id];

    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 12.0, 13.0, 0.0),
      decoration: BoxDecoration(),
      alignment: Alignment.topCenter,
      child: Card(
        child: Container(
          alignment: Alignment.topCenter,
          height: 300,
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                flex: 14,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Image.asset(item.imgLink),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        flex: 13,
                      ),
                      Expanded(
                        flex: 7,
                        child: SizedBox(
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  item.autoModel,
                                  style: firstRolestyle,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 60,
                                    child: Text(
                                      item.autoNumber,
                                      style: secondRolestyle,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Text(
                                    '${item.autoPlacesNum}',
                                    style: secondRolestyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                flex: 16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        "Город ${item.cityFrom} - ${item.cityTo}",
                        style: firstRolestyle,
                      ),
                      width: 180,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Отправление",
                        style: headerRolestyle,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Дата - ${item.arrivalDate}",
                        style: headerDetails,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Text(
                        "Время - ${item.arrivalTime}",
                        style: headerDetails,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Прибытие",
                        style: headerRolestyle,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Дата - ${item.sendDate}",
                        style: headerDetails,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Text(
                        "Время - ${item.sendTime}",
                        style: headerDetails,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduleItem {
  String autoModel = "";
  String autoNumber = "";
  int autoPlacesNum = 0;
  String cityFrom = "";
  String cityTo = "";

  String sendDate = "";
  String sendTime = "";

  String arrivalDate = "";
  String arrivalTime = "";
  String imgLink = "";

  ScheduleItem(
      {required String autoModel,
      required String autoNumber,
      required int autoPlacesNum,
      required String cityFrom,
      required String cityTo,
      required String sendDate,
      required String sendTime,
      required String arrivalDate,
      required String arrivalTime,
      required String imgLink}) {
    this.arrivalDate = arrivalDate;
    this.arrivalTime = arrivalTime;
    this.autoModel = autoModel;
    this.autoNumber = autoNumber;
    this.autoPlacesNum = autoPlacesNum;
    this.cityFrom = cityFrom;
    this.cityTo = cityTo;
    this.sendDate = sendDate;
    this.sendTime = sendTime;
    this.imgLink = imgLink;
  }
}
