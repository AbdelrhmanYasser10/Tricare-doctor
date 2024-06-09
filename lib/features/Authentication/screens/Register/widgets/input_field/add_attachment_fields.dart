/*
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tricares_doctor_app/core/component/Loading%20Widget/loading_widget.dart';
import 'package:tricares_doctor_app/core/globle/color/light_app_color.dart';
import 'package:tricares_doctor_app/features/Authentication/cubit/auth_cubit.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../generated/l10n.dart';

class AddAttachmentField extends StatelessWidget {
  const AddAttachmentField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).yourAttachments,
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is PickFilesError) {
              var snackBar = Utils.buildSnackBar2(
                contentType: ContentType.failure,
                context: context,
                message: S.of(context).addFile,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is PickFilesLoading) {
              return const BuildLoadingWidget();
            } else {
              var cubit = AuthCubit.get(context);
              if (cubit.xFiles.isEmpty) {
                return clickableAttachmentWidget(
                  width: width,
                  context: context,
                  height: height,
                );
              } else {
                return Container(
                  height: height * 0.2,
                  width: width,
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.025, horizontal: width * 0.06),
                  decoration: BoxDecoration(
                    color: LightAppColor.foreGroundColors,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (index < cubit.xFiles.length) {
                              return GestureDetector(
                                onTap: (){
                                  Utils.showDialog2(
                                      context: context,
                                      dialogType: DialogType.error,
                                      widget:Text(
                                          S.of(context).removeFile,
                                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                          color: Colors.white
                                        ),
                                      ),
                                    fn: () {
                                      cubit.removeFile(index: index);
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      returnFileIconWithColor(
                                          file: cubit.xFiles[index],
                                          height: height),
                                      Text(
                                        cubit.xFiles[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  cubit.attachFile();
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.fileImport,
                                      color: Colors.grey,
                                      size: height * 0.075,
                                    ),
                                    Text(
                                      S.of(context).add,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!,
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: width * 0.075,
                            );
                          },
                          itemCount: cubit.xFiles.length + 1,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Center(
          child: Text(
            S.of(context).makeSure,
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
      ],
    );
  }

  Widget clickableAttachmentWidget(
      {required BuildContext context, required width, required height}) {
    return GestureDetector(
      onTap: () {
        AuthCubit.get(context).attachFile();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: width,
            height: height * 0.2,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.black,
              ),
            ),
            child:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    FontAwesomeIcons.fileImport,
                    color: Colors.grey,
                    size: 64,
                  ),
                  Text(
                    S.of(context).allowedExtensions
                     ,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey.shade900
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget returnFileIconWithColor({required XFile file, required height}) {
    var type = file.path.split('/').last.split(".").last;
    if (type == "pdf") {
      return Icon(
        FontAwesomeIcons.filePdf,
        color: Colors.red,
        size: height * 0.075,
      );
    } else {
      return Icon(
        FontAwesomeIcons.image,
        color: Colors.blue,
        size: height * 0.075,
      );
    }
  }
}
*/
