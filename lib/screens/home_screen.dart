import 'package:flutter/material.dart';
import 'package:flutter_like_in_video/screens/schedules.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = drawerSections.sellTickets;

  @override
  Widget build(BuildContext context) {
    var container;

    switch (currentPage) {
      case drawerSections.schedule:
        container = ScheduleScreen();
        break;
      default:
        container = Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: const IconButton(
            icon: Icon(Icons.accessibility_new_rounded),
            onPressed: null,
            iconSize: 60,
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Application"),
        centerTitle: true,
        backgroundColor: Colors.green[600],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawerHeader(
                  child: Container(
                    child: Column(
                      children: [
                        const Text(
                          "Test company",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 50,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "Aty Zhoni",
                              style: TextStyle(
                                color: Colors.grey[850],
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                drawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerList() {
    List<String> drawerListTitles = [
      "Продажа билетов",
      "Список администраторов",
      "Автобусы",
      "Статистика",
      "Пассажиры",
      "Расписание",
      "История",
      "Настройки"
    ];

    return Container(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Column(
        children: [
          drawerListItem(
            1,
            "Продажа билетов",
            Icons.airplane_ticket_outlined,
            currentPage == drawerSections.sellTickets,
          ),
          drawerListItem(
            2,
            "Список администраторов",
            Icons.admin_panel_settings_outlined,
            currentPage == drawerSections.listAdmins,
          ),
          drawerListItem(
            3,
            "Автобусы",
            Icons.bus_alert_outlined,
            currentPage == drawerSections.buses,
          ),
          drawerListItem(
            4,
            "Статистика",
            Icons.stacked_bar_chart_sharp,
            currentPage == drawerSections.statistic,
          ),
          drawerListItem(
            5,
            "Пассажиры",
            Icons.personal_injury_outlined,
            currentPage == drawerSections.passagers,
          ),
          drawerListItem(
            6,
            "Расписание",
            Icons.schedule,
            currentPage == drawerSections.schedule,
          ),
          drawerListItem(
            7,
            "История",
            Icons.history_sharp,
            currentPage == drawerSections.history,
          ),
          drawerListItem(
            8,
            "Настройки",
            Icons.settings,
            currentPage == drawerSections.settings,
          ),
        ],
      ),
    );
  }

  Widget drawerListItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            switch (id) {
              case 1:
                currentPage = drawerSections.sellTickets;
                break;
              case 2:
                currentPage = drawerSections.listAdmins;
                break;
              case 3:
                currentPage = drawerSections.buses;
                break;
              case 4:
                currentPage = drawerSections.statistic;
                break;
              case 5:
                currentPage = drawerSections.passagers;
                break;
              case 6:
                currentPage = drawerSections.schedule;
                break;
              case 7:
                currentPage = drawerSections.history;
                break;
              case 8:
                currentPage = drawerSections.settings;
                break;
              default:
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum drawerSections {
  sellTickets,
  listAdmins,
  buses,
  statistic,
  passagers,
  schedule,
  history,
  settings,
}
