import 'package:awfar_captain/core/helpers/spacing.dart';
import 'package:awfar_captain/core/theming/color_manager.dart';
import 'package:awfar_captain/core/theming/text_style_manager.dart';
import 'package:awfar_captain/core/widgets/back_icon_button.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_cubit.dart';
import 'package:awfar_captain/features/authentication/logic/register/register_state.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/add_documents_widget.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/custom_text_form.dart';
import 'package:awfar_captain/features/authentication/ui/widgets/upload_files_listener.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../lang/locale_keys.g.dart';

class AddDocumentsScreen extends StatelessWidget {
  const AddDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          LocaleKeys.addDecuments.tr(),
          style: TextStyleManager.font17blackBold,
        ),
        leading: const BackIconButton(),
      ),
      body: SafeArea(
        child: BlocBuilder<RegisterCubit, RegisterStates>(
          builder: (context, state) {
            RegisterCubit registerCubit = context.read<RegisterCubit>();
            return Form(
              key: registerCubit.filesFormKey,
              child: Column(
                children:[
                  Expanded(
                    child: ListView(
                    padding: const EdgeInsets.all(10.0),
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: registerCubit.documents.length,
                        itemBuilder: (context, index) => AddDocumentsWidget(
                          text: registerCubit.documents[index],
                          onTap: () async {
                            registerCubit.pickDocument(index);
                          },
                          file: registerCubit.getFile(index),
                        ),
                        separatorBuilder: (context, index) => Divider(
                          color: ColorManager.darkGrey,
                          thickness: 0.8,
                          endIndent: 20.h,
                          indent: 20.h,
                        ),
                        physics: const BouncingScrollPhysics(),
                      ),
                      verticalSpace(20.h),
                      CustomTextForm(validator: (value) {
                        if (value == null)
                      {
                        return 'Please enter a value';

                      }
                      return null; }, obscureText: false, text: 'Car brand', inputType: TextInputType.text, controller: registerCubit.carBrand,),
                      verticalSpace(30.h),
                      CustomTextForm(validator: (value) {
                        if (value == null)
                          {
                            return 'Please enter a value';

                          }
                        return null;
                      }, obscureText: false, text: 'Work area', inputType: TextInputType.text, controller: registerCubit.workArea,),
                      verticalSpace(30.h),
                      const UploadFilesListener(),

                    ],
                    ),
                  ),
                ]
              ),
            );
          },
        ),
      ),
    );
  }
}
