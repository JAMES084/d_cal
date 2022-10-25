import 'package:d_cal/responsive.dart';
import 'package:d_cal/views/profile/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_controller.dart';

class BodyContent extends StatefulWidget {
  const BodyContent({super.key});

  @override
  State<BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final HomeController c = Get.put(HomeController());
  final GlobalKey _key = LabeledGlobalKey("prefectures");
  OverlayEntry? _overlayEntry;
  Size? buttonSize;
  Offset? buttonPosition;
  bool isPrefecturesOpen = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    findButton() {
      RenderBox renderBox =
          _key.currentContext!.findRenderObject() as RenderBox;
      buttonSize = renderBox.size;
      buttonPosition = renderBox.localToGlobal(Offset.zero);
    }

    OverlayEntry overlayEntryBuilder() {
      return OverlayEntry(
        builder: (context) {
          return Positioned(
            top: buttonPosition!.dy + buttonSize!.height,
            left: buttonPosition!.dx,
            width: buttonSize!.width,
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.008),
                child: Container(
                  width: buttonSize!.width,
                  height: 257,
                  padding: EdgeInsets.only(
                    left: size.width * 0.032,
                    top: size.height * 0.032,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'tokyo',
                        ),
                        Text(
                          'tokyo',
                        ),
                        Text(
                          'tokyo',
                        ),
                        Text(
                          'tokyo',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    void openMenu() {
      findButton();
      _overlayEntry = overlayEntryBuilder();
      Overlay.of(context)!.insert(_overlayEntry!);
      isPrefecturesOpen = !isPrefecturesOpen;
    }

    void closeMenu() {
      _overlayEntry!.remove();
      isPrefecturesOpen = !isPrefecturesOpen;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9EF),
      key: _scaffoldState,
      drawer: const SideMenu(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.15,
                  right: size.width * 0.15,
                ),
                color: const Color(0xFFFFF9EF),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.104,
                    ),
                    const Text(
                      'profile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                        bottom: size.height * 0.015,
                      ),
                      width: size.width * 0.768,
                      child: const Divider(
                        color: Color(0xFFF2EADD),
                        thickness: 2,
                      ),
                    ),
                    const Text(
                      'profile picture',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.016,
                        bottom: size.height * 0.032,
                      ),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI',
                        ),
                      ),
                    ),
                    const Text(
                      'name\*',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: 'Yuna Asahikawa',
                      fillColor: Colors.white,
                      readOnly: false,
                    ),
                    const Text(
                      'Furigana',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: 'Asahikawa Yuna',
                      fillColor: Colors.white,
                      readOnly: false,
                    ),
                    const Text(
                      'Member ID',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: 'D0001',
                      fillColor: const Color(0xFFF2EADD),
                      readOnly: false,
                    ),
                    const Text(
                      'Phone Number\* (no hyphens)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: 'D0001',
                      fillColor: Colors.white,
                      readOnly: false,
                    ),
                    const Text(
                      'Sex\*',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.009,
                        bottom: size.height * 0.029,
                      ),
                      child: Row(
                        children: [
                          _radioItems(0),
                          SizedBox(
                            width: size.width * 0.008,
                          ),
                          const Text('Women'),
                          SizedBox(
                            width: size.width * 0.024,
                          ),
                          _radioItems(1),
                          SizedBox(
                            width: size.width * 0.008,
                          ),
                          const Text('Male'),
                          SizedBox(
                            width: size.width * 0.024,
                          ),
                          _radioItems(2),
                          SizedBox(
                            width: size.width * 0.008,
                          ),
                          const Text('No answer'),
                        ],
                      ),
                    ),
                    const Text(
                      'Date of birth\*',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: '1992/11/26',
                      fillColor: Colors.white,
                      readOnly: false,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.08),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                          width: 163,
                          height: 46,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.fromLTRB(24, 13, 24, 13),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFF2EDE3),
                            ),
                          ),
                          onPressed: null,
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFC6BFB5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                        bottom: size.height * 0.015,
                      ),
                      width: size.width * 0.768,
                      child: const Divider(
                        color: Color(0xFFF2EADD),
                        thickness: 2,
                      ),
                    ),
                    const Text(
                      'Postal code\* (no hyphens)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: '163 8001',
                      fillColor: Colors.white,
                      readOnly: false,
                    ),
                    const Text(
                      'Prefectures\*',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      key: _key,
                      size: size,
                      readOnly: true,
                      onTap: () {
                        if (isPrefecturesOpen) {
                          closeMenu();
                        } else {
                          openMenu();
                        }
                      },
                      hintText: 'Tokyo',
                      fillColor: Colors.white,
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(
                          right: size.width * 0.002,
                          top: size.height * 0.002,
                          bottom: size.height * 0.002,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Color(0xFFCFCFCF),
                        ),
                      ),
                    ),
                    const Text(
                      'City\*',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: 'Nishi-Shinjuku, Shinjuku Ward',
                      fillColor: Colors.white,
                      readOnly: false,
                    ),
                    const Text(
                      'After the address (not published)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF918885),
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: 'Honmachi 1-2',
                      fillColor: Colors.white,
                      readOnly: false,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.08),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                          width: 163,
                          height: 46,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.fromLTRB(24, 13, 24, 13),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFF2EDE3),
                            ),
                          ),
                          onPressed: null,
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFC6BFB5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'email address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                        bottom: size.height * 0.015,
                      ),
                      width: size.width * 0.768,
                      child: const Divider(
                        color: Color(0xFFF2EADD),
                        thickness: 2,
                      ),
                    ),
                    _textFormField(
                      size: size,
                      hintText: 'sample@user.com',
                      fillColor: const Color(0xFFF2EADD),
                      readOnly: false,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.077),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(
                          width: 163,
                          height: 46,
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.fromLTRB(24, 13, 24, 13),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFFF6F42),
                            ),
                          ),
                          onPressed: null,
                          child: const Text(
                            'change',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFF9EF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF4F4F4F),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                        bottom: size.height * 0.015,
                      ),
                      width: size.width * 0.768,
                      child: const Divider(
                        color: Color(0xFFF2EADD),
                        thickness: 2,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(
                        width: 163,
                        height: 46,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(24, 13, 24, 13),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xFFFF6F42),
                          ),
                        ),
                        onPressed: null,
                        child: const Text(
                          'change',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFFF9EF),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.174,
                    )
                  ],
                ),
              ),
              if (!Responsive.isDesktop(context))
                IconButton(
                  onPressed: () {
                    _scaffoldState.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 27,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFormField({
    required Size size,
    String? hintText,
    Color? fillColor,
    Widget? suffixIcon,
    void Function()? onTap,
    Key? key,
    required bool readOnly,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.008,
        bottom: size.height * 0.032,
      ),
      child: SizedBox(
        width: size.width * 0.768,
        height: 48,
        child: TextFormField(
          key: key,
          onTap: onTap,
          readOnly: readOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: Color(0xFFF2EADD),
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: Color(0xFFF2EADD),
                width: 2.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(
                color: Color(0xFFF2EADD),
                width: 2.0,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(
              size.width * 0.016,
              size.height * 0.007,
              size.width * 0.016,
              size.height * 0.007,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4F4F4F),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }

  Widget _radioItems(int index) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          c.updateRadioSelection(index);
        },
        child: Container(
          width: 24.0,
          height: 24.0,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: c.radioIndex.value == index
                ? null
                : Border.all(
                    color: const Color(0xFFF2EADD),
                    width: 2.0,
                  ),
            borderRadius: BorderRadius.circular(16.0),
            color: c.radioIndex.value == index
                ? const Color(0xFFFF9675)
                : Colors.white,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
