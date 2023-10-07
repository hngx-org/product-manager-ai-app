import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:product_management_ai_app/src/core/constants/app_color.dart';
import 'package:product_management_ai_app/src/data/local_service/toast_service.dart';
import 'package:product_management_ai_app/src/features/chat/models/chat_model.dart';
import 'package:product_management_ai_app/src/shared/utils/extensions.dart';

class ChatTile extends HookWidget {
  final ChatMessage message;
  final bool sender;
  final bool isLast;

  const ChatTile({
    super.key,
    required this.message,
    required this.sender,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = useState(false);
    return GestureDetector(
      onDoubleTap: () => isSelected.value = !isSelected.value,
      onLongPress: () => isSelected.value = !isSelected.value,
      child: Column(
        children: [
          if (isSelected.value)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //share and copy
                IconButton(
                    onPressed: () {
                      isSelected.value = !isSelected.value;
                      // Share.share(
                      //   message.text,
                      // ).then(
                      //   (value) => isSelected.value = !isSelected.value,
                      // );
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 16,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(
                        text: message.text,
                      )).then((_) {
                        isSelected.value = !isSelected.value;
                        ToastService().showCustomToast(
                          'Text copied to clipboard',
                          isError: false,
                        );
                      });
                    },
                    icon: const Icon(
                      Icons.copy,
                      size: 16,
                      color: Colors.black,
                    )),
                40.wi,
              ],
            ),
          Align(
            alignment: message.isHistory
                ? Alignment.center
                : sender
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
            child: sender
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!message.isHistory)
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                              const Color.fromRGBO(95, 118, 238, 1),
                          child: Image.asset('assets/images/icons8-bot.gif')
                              .padAll(3),
                        ),
                      Center(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: message.isHistory ? (.99.sw - 32) : .7.sw,
                          ),
                          margin: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 10.0,
                          ).copyWith(left: 10),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: isSelected.value
                                ? AppColors.greyTextColor
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12.0),
                              topRight: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                message.text,
                                softWrap: true,
                                style: const TextStyle(color: Colors.black),
                              ),
                              10.hi,
                              Text(
                                  DateFormat('MMM dd, yyyy hh:mm a')
                                      .format(message.timestamp),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    constraints: BoxConstraints(
                      maxWidth: .7.sw,
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: isSelected.value
                          ? AppColors.greyTextColor
                          : const Color.fromRGBO(95, 118, 238, 1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message.text,
                          softWrap: true,
                          style: const TextStyle(color: Colors.white),
                        ),
                        10.hi,
                        Text(
                          DateFormat('MMM dd, yyyy hh:mm a')
                              .format(message.timestamp),
                          style: const TextStyle(
                            color: Color.fromARGB(199, 238, 238, 238),
                          ),
                        )
                      ],
                    ),
                  ),
          ),
          if (isLast) 70.hi,
        ],
      ),
    );
  }
}
