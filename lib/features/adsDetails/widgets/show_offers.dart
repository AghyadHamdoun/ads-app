
import 'package:ads/core/customList/list_users.dart';
import 'package:ads/features/adsDetails/bloc/ads_details_bloc.dart';
import 'package:ads/features/adsDetails/bloc/ads_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_offer.dart';

class ShowOffers extends StatelessWidget {
  final AdsDetailsBloc adsDetailsBloc;
  final String userId;
  const ShowOffers({super.key,required this.adsDetailsBloc,required this.userId});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsDetailsBloc,AdsDetailsState>(
      bloc: adsDetailsBloc,
      builder: (context, state) {
        return Column(
          children: [
              for(var item in state.adsDetailsModel!.message!.bids!)
                ...[
                  Column(
                    children: [
                      ListUser(name: item.proposalBy!.firstName??"", desc: item.proposal??"",
                          image: item.proposalBy!.profilePicture, rate: item.proposalBy!.averageRating??"0",
                          adsDuration: item.duration, adsBalance: item.amount,
                          showDeleteEdit: userId==item.proposalBy!.id.toString(),
                          add: (){}, delete: (){
                            adsDetailsBloc.add(DeleteAdsOfferEvent(id: item.id.toString()));
                          }, edit: (){
                             Navigator.
                            push(context, MaterialPageRoute(builder:
                                 (context) => EditOffer(
                                   adsDetailsBloc: adsDetailsBloc,
                                   balance: item.amount??'0',
                                   duration: item.duration??"0",
                                   desc: item.proposal??"",
                                   bidId: item.id.toString(),
                                 ) ,));
                          }

                      ),
                      SizedBox(height: 12.h,),
                    ],
                  ),
                ],
          ],
        );
      },
    );
  }
}
