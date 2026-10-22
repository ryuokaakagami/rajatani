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
          parentNavigatorKey: _rootNavigatorKey,
          path: RoutesConstant.paths.detail,
          name: RoutesConstant.names.detailProfile,
          pageBuilder: (context, state) {
            return transitionPage(
              key: state.pageKey,
              child: ProfileDetailScreen(data: state.extra as UserEntity?),
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesConstant.paths.photo,
              name: RoutesConstant.names.photoProfile,
              pageBuilder: (context, state) {
                final extra = state.extra as Map<String, dynamic>?;

                final id = extra?['id'] as String? ?? '';
                final avatarUrl = extra?['avatarUrl'] as String? ?? '';
                return transitionPage(
                  key: state.pageKey,
                  child: ProfilePhotoScreen(id: id, avatarUrl: avatarUrl),
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
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.name,
                  name: RoutesConstant.names.editNameProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: const ProfileEditNameScreen(),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.username,
                  name: RoutesConstant.names.editUsernameProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: const ProfileEditUserNameScreen(),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.bio,
                  name: RoutesConstant.names.editBioProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: const ProfileEditBioScreen(),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.gender,
                  name: RoutesConstant.names.editGenderProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: const ProfileEditGenderScreen(),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.birthday,
                  name: RoutesConstant.names.editBirthdayProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: const ProfileEditBirthdayScreen(),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.email,
                  name: RoutesConstant.names.editEmailProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: const ProfileEditEmailScreen(),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.phone,
                  name: RoutesConstant.names.editPhoneProfile,
                  pageBuilder: (context, state) {
                    return transitionPage(
                      key: state.pageKey,
                      child: const ProfileEditPhoneScreen(),
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
