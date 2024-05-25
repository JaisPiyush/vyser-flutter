import 'package:flutter/material.dart';

class OrderTab extends StatelessWidget {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0XFFD8D8D8)),
              color: theme.colorScheme.background),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 0.25 * MediaQuery.of(context).size.width,
                    color: Color(0XFFFF9C65),
                    child: Center(
                        child: Text(
                      'Order',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    )),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '#5670 1212 0564 3090 5876',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '10 Items  * Rs. 1,365.76',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            color: Color(0XFFD4E5FF),
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                            child: Text(
                          '01:59s',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3.2 Km',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 135,
                    decoration: BoxDecoration(
                        color: Color(0XFFFFEFF1),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Text(
                      'Decline',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0XFFFF0018)),
                    )),
                  ),
                  Container(
                    height: 40,
                    width: 135,
                    decoration: BoxDecoration(
                        color: Color(0XFF2F9733),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                        child: Text(
                      'Accept',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
