import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tricares_doctor_app/core/Global%20Cubit/global_cubit.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/features/profile/cubit/profile_cubit.dart';
import 'package:tricares_doctor_app/features/profits/cubits/add_profit_cubit/add_profit_cubit.dart';
import 'package:tricares_doctor_app/features/profits/screens/widgets/profit_card.dart';
import '../../../../core/component/MessageWidget/message_widget.dart';
import '../../../../core/network/Local/CashHelper.dart';
import '../../../../core/network/Remote/DioHelper.dart';
import '../../../../core/network/endPoind.dart';
import '../../../../generated/l10n.dart';
import '../../models/profits_model.dart';

class ProfitsBodyConsumer extends StatefulWidget {
  const ProfitsBodyConsumer({Key? key}) : super(key: key);

  @override
  State<ProfitsBodyConsumer> createState() => _ProfitsBodyConsumerState();
}

class _ProfitsBodyConsumerState extends State<ProfitsBodyConsumer> {
  final PagingController<int, PartnersOrders> _pagingController =
      PagingController(firstPageKey: 0);
  int pageNumber = 1;
  bool isEmpty = false;
  bool hasError = false;
String message = '';
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await DioHelper.postData(
          data: {
            'page': pageNumber,
          },
          url: EndPoints.profitsTable,
          token: CashHelper.prefs.getString('token') ?? "");
      print(newItems.data);
      final ProfitsModel proftiModel = ProfitsModel.fromJson(newItems.data);

;      if (pageNumber == 1 && proftiModel.data == null) {

        setState(() {
          message = proftiModel.errors!.join(' ');
          isEmpty = true;
        });
      } else {
        if (!proftiModel.hasError!) {
          final isLastPage =
              proftiModel.data!.pageCurrent == proftiModel.data!.pageMax;
          if (isLastPage) {
            _pagingController.appendLastPage(proftiModel.data!.partnersOrders!);
          } else {
            final nextPageKey =
                pageKey + proftiModel.data!.partnersOrders!.length;
            pageNumber++;
            _pagingController.appendPage(
                proftiModel.data!.partnersOrders!, nextPageKey);
          }
        } else {
          setState(() {
            hasError = true;
          });
        }
      }
    } catch (error) {
      setState(() {
        hasError = true;
      });
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AddProfitCubit, AddProfitState>(
      listener: (context, state) {
        if (state is AddProfitSuccess) {
          setState(() {
            pageNumber = 1;
            _pagingController.refresh();
            context.read<ProfileCubit>().postUserData();
          });
        }
      },
      builder: (context, state) {
        return BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {
            if (state is ChangeLocal) {
              setState(() {
                pageNumber = 1;
                _pagingController.refresh();
              });
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                  right: width * 0.02, left: width * 0.02, top: height * 0.00),
              child: isEmpty
                  ? MessageWidget(
                      width: width,
                      height: height / 3,
                      heightImage: height / 3,
                      widthImage: width / 3,
                      imagePath: 'assets/icons/empty.svg',
                      message: message,
                      clickBtn: () {
                        setState(() {
                          pageNumber = 1;
                          isEmpty = false;
                          hasError = false;
                          _pagingController.refresh();
                        });
                      },
                      btnText: S.of(context).reload,
                    )
                  : hasError
                      ? MessageWidget(
                          width: width ,
                          height: height / 3,
                          heightImage: height / 3,
                          widthImage: width / 3,
                          imagePath: 'assets/icons/error.svg',
                          message: S.of(context).errorHappenedUnExpected,
                          clickBtn: () {
                            setState(() {
                              pageNumber = 1;
                              hasError = false;
                              isEmpty = false;
                              _pagingController.refresh();
                            });
                          },
                          btnText: S.of(context).reload,
                        )
                      : RefreshIndicator(
                          onRefresh: () => Future(() {
                            pageNumber = 1;
                            _pagingController.refresh();
                          }),
                          child: PagedListView<int, PartnersOrders>(
                            pagingController: _pagingController,
                            physics: const BouncingScrollPhysics(),
                            builderDelegate:
                                PagedChildBuilderDelegate<PartnersOrders>(
                              itemBuilder: (context, item, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.009),
                                child: ProfitCard(
                                  profit: item,
                                ),
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 900),
                              animateTransitions: true,
                              newPageErrorIndicatorBuilder: (context) {
                                return MessageWidget(
                                  width: width,
                                  height: height / 3,
                                  heightImage: height / 3,
                                  widthImage: width / 3,
                                  imagePath: 'assets/icons/error.svg',
                                  message:
                                      S.of(context).errorHappenedUnExpected,
                                  clickBtn: () {
                                    setState(() {
                                      pageNumber = 1;
                                      hasError = false;
                                      isEmpty = false;
                                      _pagingController.refresh();
                                    });
                                  },
                                  btnText: S.of(context).reload,
                                );
                              },
                              firstPageErrorIndicatorBuilder: (context) {
                                return MessageWidget(
                                  width: width,
                                  height: height / 3,
                                  heightImage: height / 3,
                                  widthImage: width / 3,
                                  imagePath: 'assets/icons/error.svg',
                                  message:
                                      S.of(context).errorHappenedUnExpected,
                                  clickBtn: () {
                                    setState(() {
                                      pageNumber = 1;
                                      hasError = false;
                                      isEmpty = false;
                                      _pagingController.refresh();
                                    });
                                  },
                                  btnText: S.of(context).reload,
                                );
                              },
                              firstPageProgressIndicatorBuilder: (context) {
                                return const BuildLoadingWidget();
                              },
                              newPageProgressIndicatorBuilder: (context) {
                                return const BuildLoadingWidget();
                              },
                            ),
                          ),
                        ),
            );
          },
        );
      },
    );
  }
}
