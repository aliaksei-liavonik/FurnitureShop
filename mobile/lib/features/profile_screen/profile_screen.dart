import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/auth/auth_cubit.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_field.dart';
import 'package:furniture_shop/features/common/widgets/asset_button.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/features/profile_screen/profile_screen_cubit.dart';
import 'package:furniture_shop/features/profile_screen/update_profile_dialog.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nickNameEditingController = useTextEditingController();
    final nameEditingController = useTextEditingController();
    final surnameEditingController = useTextEditingController();
    final fieldEditingController = useTextEditingController();

    void _editPhoto() {}

    void _editNickname() {
      fieldEditingController.text = nickNameEditingController.text;
      showUpdateProfileDialog<void>(
        context: context,
        title: 'Nickname',
        child: Column(
          children: [
            AppTextField(
              controller: fieldEditingController,
            ),
            const SizedBox(height: 20),
            AppTextButton(
              initialValue: nickNameEditingController.text,
              onPressed: () {
                context.read<ProfileScreenCubit>().updateProfile(
                      username: fieldEditingController.text,
                    );
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'Confirm',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void _editName() {
      fieldEditingController.text = nameEditingController.text;

      showUpdateProfileDialog<void>(
        context: context,
        title: 'Name',
        child: Column(
          children: [
            AppTextField(
              controller: fieldEditingController,
            ),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {
                context.read<ProfileScreenCubit>().updateProfile(
                      name: fieldEditingController.text,
                    );
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'Confirm',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void _editSurname() {
      fieldEditingController.text = surnameEditingController.text;

      showUpdateProfileDialog<void>(
        context: context,
        title: 'Surname',
        child: Column(
          children: [
            AppTextField(
              controller: fieldEditingController,
            ),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {
                context.read<ProfileScreenCubit>().updateProfile(
                      surname: fieldEditingController.text,
                    );
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                'Confirm',
                style: AppTextStyles.med14.copyWith(
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void _logOut() {
      context.read<AuthCubit>().logOut();
    }

    return Scaffold(
      body: BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
        builder: (context, state) {
          return state.map(
            initial: (state) => Center(
              child: AppTextButton(
                onPressed: _logOut,
                withBorderSide: false,
                background: Colors.transparent,
                child: Text(
                  'Log out',
                  style: AppTextStyles.reg18.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
            loading: (state) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (state) {
              nickNameEditingController.text = state.userInfo.username;
              nameEditingController.text = state.userInfo.firstname;
              surnameEditingController.text = state.userInfo.surname;

              return SafeArea(
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'Profile',
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(56, 24, 60, 0),
                        child: SingleChildScrollView(
                          physics: const ScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Material(
                                color: AppColors.grey0,
                                borderRadius: BorderRadius.circular(48),
                                child: InkWell(
                                  onTap: _editPhoto,
                                  customBorder: const CircleBorder(),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 48,
                                    child: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: AssetIcon(
                                        color: AppColors.primaryText,
                                        asset: Assets.icons.edit,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                controller: nickNameEditingController,
                                label: 'Nickname',
                                suffixIcon: AssetButton(
                                  onPressed: _editNickname,
                                  icon: AssetIcon(
                                    asset: Assets.icons.edit,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                readOnly: true,
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                controller: nameEditingController,
                                label: 'Name',
                                suffixIcon: AssetButton(
                                  onPressed: _editName,
                                  icon: AssetIcon(
                                    asset: Assets.icons.edit,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                readOnly: true,
                              ),
                              const SizedBox(height: 20),
                              AppTextField(
                                controller: surnameEditingController,
                                label: 'Surname',
                                suffixIcon: AssetButton(
                                  onPressed: _editSurname,
                                  icon: AssetIcon(
                                    asset: Assets.icons.edit,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                                readOnly: true,
                              ),
                              const SizedBox(height: 20),
                              AppTextButton(
                                onPressed: _logOut,
                                withBorderSide: false,
                                background: Colors.transparent,
                                child: Text(
                                  'Log out',
                                  style: AppTextStyles.reg18.copyWith(
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (state) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Something went wrong'),
                  AppTextButton(
                    onPressed: _logOut,
                    withBorderSide: false,
                    background: Colors.transparent,
                    child: Text(
                      'Log out',
                      style: AppTextStyles.reg18.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
