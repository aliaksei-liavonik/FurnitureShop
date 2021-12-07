import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_shop/features/common/widgets/app_bar.dart';
import 'package:furniture_shop/features/common/widgets/app_text_button.dart';
import 'package:furniture_shop/features/common/widgets/app_text_field.dart';
import 'package:furniture_shop/features/common/widgets/asset_button.dart';
import 'package:furniture_shop/features/common/widgets/asset_icon.dart';
import 'package:furniture_shop/profile_screen/update_profile_dialog.dart';
import 'package:furniture_shop/resources/app_colors.dart';
import 'package:furniture_shop/resources/app_text_styles.dart';
import 'package:furniture_shop/resources/assets.gen.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _editPhoto() {}

    void _editNickname() {
      showUpdateProfileDialog<void>(
        context: context,
        title: 'Nickname',
        child: Column(
          children: [
            const AppTextField(),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {},
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
      showUpdateProfileDialog<void>(
        context: context,
        title: 'Name',
        child: Column(
          children: [
            const AppTextField(),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {},
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
      showUpdateProfileDialog<void>(
        context: context,
        title: 'Surame',
        child: Column(
          children: [
            const AppTextField(),
            const SizedBox(height: 20),
            AppTextButton(
              onPressed: () {},
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

    void _logOut() {}

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Profile'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(56, 24, 60, 0),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}
