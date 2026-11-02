part of 'router.dart';

final _profileKey = GlobalKey<NavigatorState>();

final _profileRoute = StatefulShellBranch(
  navigatorKey: _profileKey,
  routes: [
    GoRoute(
      path: RoutesConstant.paths.profile,
      name: RoutesConstant.names.profile,
      pageBuilder: (context, state) {
        return transitionPage(key: state.pageKey, child: const ProfileScreen());
      },
      routes: [
        GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: RoutesConstant.paths.detail,
          name: RoutesConstant.names.detailProfile,
          pageBuilder: (context, state) {
            return transitionPage(
              key: state.pageKey,
              child: BlocProvider(
                create: (_) => sl<AvatarCubit>(),
                child: const ProfileDetailScreen(),
              ),
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: rootNavigatorKey,
              path: RoutesConstant.paths.photo,
              name: RoutesConstant.names.photoProfile,
              pageBuilder: (context, state) {
                return transitionPage(
                  key: state.pageKey,
                  child: BlocProvider(
                    create: (_) => sl<AvatarCubit>(),
                    child: const ProfilePhotoScreen(),
                  ),
                );
              },
            ),

            GoRoute(
              path: RoutesConstant.paths.edit,
              redirect: (context, state) {
                if (state.uri.path == RoutesConstant.paths.edit) {
                  return RoutesConstant.paths.name;
                }
                return null;
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: RoutesConstant.paths.name,
                  name: RoutesConstant.names.editNameProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => sl<ProfileEditCubit>(),
                        child: const ProfileEditNameScreen(),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: RoutesConstant.paths.username,
                  name: RoutesConstant.names.editUsernameProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (_) => sl<ProfileEditCubit>()),
                          BlocProvider(create: (_) => sl<CheckUsernameCubit>()),
                        ],
                        child: const ProfileEditUserNameScreen(),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: RoutesConstant.paths.bio,
                  name: RoutesConstant.names.editBioProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => sl<ProfileEditCubit>(),
                        child: const ProfileEditBioScreen(),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: RoutesConstant.paths.gender,
                  name: RoutesConstant.names.editGenderProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => sl<ProfileEditCubit>(),
                        child: const ProfileEditGenderScreen(),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: RoutesConstant.paths.birthday,
                  name: RoutesConstant.names.editBirthdayProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => sl<ProfileEditCubit>(),
                        child: const ProfileEditBirthdayScreen(),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: RoutesConstant.paths.email,
                  name: RoutesConstant.names.editEmailProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (context) => sl<ContactUpdateCubit>(),
                        child: const ProfileEditEmailScreen(),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: RoutesConstant.paths.phone,
                  name: RoutesConstant.names.editPhoneProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (context) => sl<ContactUpdateCubit>(),
                        child: const ProfileEditPhoneScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
