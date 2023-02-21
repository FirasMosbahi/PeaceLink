import 'package:PeaceLink/core/models/idea_model.dart';
import 'package:PeaceLink/core/view-models/idea_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../utilities/mediaQuery.dart';

class IdeaWidget extends StatefulWidget {
  final Idea idea;
  final bool buttonType;
  const IdeaWidget({Key? key, required this.idea, required this.buttonType})
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
        startActionPane: widget.buttonType
            ? ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async {
                      try {
                        await Provider.of<IdeaProvider>(context, listen: false)
                            .likeIdea(title: widget.idea.title);
                      } catch (e) {}
                    },
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
                    icon: FontAwesomeIcons.thumbsUp,
                    foregroundColor: Colors.purple,
                    label: "Support this Idea",
                  ),
                ],
              )
            : ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async {
                      try {
                        await Provider.of<IdeaProvider>(context, listen: false)
                            .deleteIdea(title: widget.idea.title);
                      } catch (e) {}
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
                const Divider(),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
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
                  ),
                ),
                const Divider(),
                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.topLeft,
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
                  ),
                ),
                const Divider(),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
