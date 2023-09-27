import 'package:flutter/material.dart';

// google fonts imports
import 'package:google_fonts/google_fonts.dart';

class WidgetsTeamDropDown extends StatefulWidget {
  const WidgetsTeamDropDown({super.key});

  @override
  State<WidgetsTeamDropDown> createState() => _WidgetsTeamDropDownState();
}

class _WidgetsTeamDropDownState extends State<WidgetsTeamDropDown> {
  // initial drop down value
  String dropDownValue = "Select Team";

  // Teams
  List<String> teams = ['audi 1', 'audi 2', 'audi 3', 'audi 4'];

  // select team
  void showTeams() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Colors.white,
              content: SizedBox(
                width: 200,
                height: 200,
                child: ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          dropDownValue = teams[index];
                        });
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -1.5),
                        leading: Icon(
                          Icons.group,
                          color: Colors.grey[600],
                        ),
                        title: Text(
                          teams[index],
                          style: GoogleFonts.ubuntu(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3, color: Colors.grey[900]!),
          borderRadius: BorderRadius.circular(40)),
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 2),
      child: Row(
        children: [
          Icon(
            Icons.group,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: showTeams,
            child: Text(
              dropDownValue,
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
