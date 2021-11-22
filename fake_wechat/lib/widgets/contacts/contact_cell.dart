
import 'package:flutter/material.dart';

class ContactCell extends StatelessWidget {
  const ContactCell({
    required this.name,
    this.avatarUrl,
    this.assetName,
    this.indexLetter,
  }) : assert((avatarUrl != null || assetName != null), '至少一张图片');

  static double baseCellHeight = 60;
  static double indexHeight = 22;

  final String name;
  final String? avatarUrl;
  final String? assetName;
  final String? indexLetter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          height: indexLetter == null ? 0 : ContactCell.indexHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 12,),
              Text(indexLetter ?? ""),
            ],
          ),
        ),
        Container(
          height: ContactCell.baseCellHeight,
          color: Colors.white,
          child: Stack(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      avatarUrl != null
                          ? Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: NetworkImage(avatarUrl!),
                          ),
                        ),
                      )
                          : Container(),
                      assetName != null
                          ? Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: AssetImage(assetName!),
                          ),
                        ),
                      )
                          : Container(),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(left: 70),
                  height: 0.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
