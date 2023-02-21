import 'package:chat_for_peace/core/models/idea_model.dart';
import 'package:chat_for_peace/core/view-models/idea_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../utilities/mediaQuery.dart';

class IdeaWidget extends StatefulWidget {
  final Idea idea;
  final bool ButtonType;
  const IdeaWidget({Key? key, required this.idea, required this.ButtonType})
      : super(key: key);

  @override
  State<IdeaWidget> createState() => _IdeaWidgetState();
}

class _IdeaWidgetState extends State<IdeaWidget> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    Mediaquery media =
        Mediaquery(mediaHeight: deviceHeight, mediaWidth: deviceWidth);
    return Padding(
      padding: EdgeInsets.all(media.getwidht(16)),
      child: Slidable(
        startActionPane: widget.ButtonType
            ? ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async {
                      try {
                        print(widget.idea.likes);
                        await Provider.of<IdeaProvider>(context, listen: false)
                            .likeIdea(title: widget.idea.title);
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                    icon: FontAwesomeIcons.thumbsUp,
                    foregroundColor: Colors.purple,
                    label: "Support this Idea",
                  )
                ],
              )
            : ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async {
                      try {
                        print(widget.idea.likes);
                        await Provider.of<IdeaProvider>(context, listen: false)
                            .deleteIdea(title: widget.idea.title);
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Colors.red,
                    icon: FontAwesomeIcons.trash,
                    foregroundColor: Colors.purple,
                    label: "Delete this Idea",
                  )
                ],
              ),
        child: Container(
          height: media.getHeight(200),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(143, 148, 251, 2),
                  blurRadius: 20.0,
                  offset: Offset(0, 10),
                )
              ]),
          child: Padding(
            padding: EdgeInsets.all(media.getwidht(8)),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      widget.idea.owner,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: media.getwidht(18),
                          fontFamily: 'Courgette'),
                    ),
                  ),
                ),
                Divider(),
                Expanded(
                    child: Align(
                  child: Row(
                    children: [
                      Text(
                        "Idea Title :",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: media.getwidht(13),
                            fontFamily: 'Courgette'),
                      ),
                      SizedBox(
                        width: media.getwidht(15),
                      ),
                      Text(widget.idea.title),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                )),
                Divider(),
                Expanded(
                  child: Align(
                    child: Column(
                      children: [
                        Text(
                          "Idea description",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: media.getwidht(13),
                              fontFamily: 'Courgette'),
                        ),
                        Text(widget.idea.description),
                      ],
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  flex: 6,
                ),
                Divider(),
                Expanded(
                    child: Container(
                  child: Row(
                    children: [
                      Text(
                        "supports",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: media.getwidht(13),
                            fontFamily: 'Courgette'),
                      ),
                      SizedBox(
                        width: media.getwidht(110),
                      ),
                      Text(widget.idea.likes.toString()),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
