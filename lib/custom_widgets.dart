import 'package:baker_st_assignment/constants/colors.dart';
import 'package:baker_st_assignment/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  static Column scoreCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '14,522',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'SCORE',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  static Row logoHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            logoJpg,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white24,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: white,
          ),
        )
      ],
    );
  }

  static Row notificationsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notifications'.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
            color: black,
          ),
        ),
      ],
    );
  }

  static SizedBox vertDividerSmall() {
    return const SizedBox(
      height: 50,
      child: VerticalDivider(
        color: white,
        thickness: 1,
      ),
    );
  }

  static Row scoreBoard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 230,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const VerticalDivider(
              color: amber,
              thickness: 8,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: scoreCol()),
                    Expanded(child: vertDividerSmall()),
                    Expanded(child: scoreCol()),
                    Expanded(child: vertDividerSmall()),
                    Expanded(child: scoreCol()),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  loremIpsum,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoremIpsumList extends StatelessWidget {
  const LoremIpsumList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return const LoremIpsumCard();
      },
    );
  }
}

class LoremIpsumCard extends StatelessWidget {
  const LoremIpsumCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white38),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              logo2Jpg,
              height: 25,
            ),
            const SizedBox(width: 10),
            const Text(
              'Lorem ipsum dolor',
              style: TextStyle(fontSize: 16),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            const Text(
              '5.0',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomWidgets.notificationsHeader(),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    color: lightGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.white38),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          logo2Jpg,
                          height: 25,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                            loremIpsum,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
