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
              child: const ProfileDetailScreen(),
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: RoutesConstant.paths.photo,
              name: RoutesConstant.names.photoProfile,
              pageBuilder: (context, state) {
                final extra = state.extra as Map<String, dynamic>?;

                final id = extra?['id'] as String?;
                final avatarUrl = extra?['avatarUrl'] as String?;
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
                    final extra = state.extra as Map<String, dynamic>?;

                    final id = extra?['id'] as String?;
                    final name = extra?['name'] as String?;
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => sl<ProfileEditCubit>(),
                        child: ProfileEditNameScreen(id: id, name: name),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.username,
                  name: RoutesConstant.names.editUsernameProfile,
                  pageBuilder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;

                    final id = extra?['id'] as String?;
                    final username = extra?['username'] as String?;
                    final usernameUpdatedAt =
                        extra?['username_updated_at'] as DateTime?;
                    return transitionPage(
                      key: state.pageKey,
                      child: MultiBlocProvider(
                        providers: [
                          BlocProvider(create: (_) => sl<ProfileEditCubit>()),
                          BlocProvider(
                            create: (context) => sl<CheckUsernameCubit>(),
                          ),
                        ],
                        child: ProfileEditUserNameScreen(
                          id: id,
                          username: username,
                          usernameUpdatedAt: usernameUpdatedAt,
                        ),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.bio,
                  name: RoutesConstant.names.editBioProfile,
                  pageBuilder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;

                    final id = extra?['id'] as String?;
                    final bio = extra?['bio'] as String?;
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => sl<ProfileEditCubit>(),
                        child: ProfileEditBioScreen(id: id, bio: bio),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.gender,
                  name: RoutesConstant.names.editGenderProfile,
                  pageBuilder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;

                    final id = extra?['id'] as String?;
                    final gender = extra?['gender'] as Gender?;
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => sl<ProfileEditCubit>(),
                        child: ProfileEditGenderScreen(id: id, gender: gender),
                      ),
                    );
                  },
                ),

                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: RoutesConstant.paths.birthday,
                  name: RoutesConstant.names.editBirthdayProfile,
                  pageBuilder: (context, state) {
                    final extra = state.extra as Map<String, dynamic>?;

                    final id = extra?['id'] as String?;
                    final birthday = extra?['birthday'] as DateTime?;
                    return transitionPage(
                      key: state.pageKey,
                      child: BlocProvider(
                        create: (_) => sl<ProfileEditCubit>(),
                        child: ProfileEditBirthdayScreen(
                          id: id,
                          birthday: birthday,
                        ),
                      ),
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
