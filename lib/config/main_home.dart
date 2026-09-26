import 'package:flutter/material.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../shared/shared.dart';

class MainHome extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;
    final bodyMedium = textTheme.bodyMedium?.copyWith(
      color: scheme.onSurfaceVariant,
    );

    return Scaffold(
      body: Padding(
        padding: const .all(SpacingSize.xl),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: .min,
                        spacing: SpacingSize.lg,
                        children: [
                          Row(
                            mainAxisSize: .min,
                            spacing: SpacingSize.md,
                            children: [
                              Image.asset(IconAsset.logo, width: IconSize.lg),
                              Text(
                                'Raja Tani',
                                style: textTheme.headlineMedium?.copyWith(
                                  color: scheme.primary,
                                  fontWeight: .w700,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            'Temukan produk pertanian terbaik sekarang juga, dan mulai besarkan agribisnis Anda bersama Raja Tani.',
                            style: bodyMedium,
                            textAlign: .center,
                          ),

                          AppField(
                            prefixIcon: Icon(Iconsax.sms_outline),
                            hintText: 'Cth. Budi Darsono',
                          ),

                          AppButton(
                            onPressed: () {},
                            label: 'Continue with email',
                          ),

                          FractionallySizedBox(
                            widthFactor: .5,
                            child: Row(
                              spacing: SpacingSize.md,
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: scheme.onSurfaceVariant,
                                  ),
                                ),
                                Text('OR', style: bodyMedium),
                                Expanded(
                                  child: Divider(
                                    color: scheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          AppButton.outlined(
                            onPressed: () {},
                            icon: Iconsax.call_outline,
                            label: 'Continue with phone',
                          ),

                          AppButton.outlined(
                            onPressed: () {},
                            imageAsset: IconAsset.google,
                            label: 'Continue with Google',
                          ),
                        ],
                      ),
                    ),
                  ),

                  SafeArea(
                    child: Align(
                      alignment: .bottomCenter,
                      child: Text(
                        'From\nAkagami',
                        style: bodyMedium,
                        textAlign: .center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
