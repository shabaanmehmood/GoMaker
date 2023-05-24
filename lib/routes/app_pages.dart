
import 'package:get/get.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_eight.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_eleven.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_fifteen.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_forteen.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_nine.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_one.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_seven.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_seventeen.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_six.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_sixteen.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_ten.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_thirteen.dart';
import 'package:go_maker_designing_app/ui/cards/two_colors/card_twelve.dart';
import 'package:go_maker_designing_app/ui/screens/business/business_main_page.dart';
import 'package:go_maker_designing_app/ui/screens/register_business.dart';
import 'package:go_maker_designing_app/ui/screens/register_customer.dart';

import '../ui/cards/two_colors/card_five.dart';
import '../ui/cards/two_colors/card_four.dart';
import '../ui/cards/two_colors/card_three.dart';
import '../ui/cards/two_colors/card_two.dart';
import '../ui/screens/login_screen.dart';
import '../ui/screens/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;
 

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreen(),
    ),
    // GetPage(
    //   name: _Paths.SLIDER_SCREEN,
    //   page: () => SliderScreen(),
    // ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_CUSTOMER_SCREEN,
      page: () => RegisterCustomer(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_BUSINESS_SCREEN,
      page: () => RegisterBusiness(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BUSINESS_MAIN_PAGE,
      page: () => BusinessMainPage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_ONE,
      page: () => CardOne(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_TWO,
      page: () => CardTwo(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_THREE,
      page: () => CardThree(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_FOUR,
      page: () => CardFour(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_FIVE,
      page: () => CardFive(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_SIX,
      page: () => CardSix(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_SEVEN,
      page: () => CardSeven(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_EIGHT,
      page: () => CardEight(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_NINE,
      page: () => CardNine(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_TEN,
      page: () => CardTen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_ELEVEN,
      page: () => CardEleven(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_TWELVE,
      page: () => CardTwelve(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_THIRTEEN,
      page: () => CardThirteen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_FOURTEEN,
      page: () => CardFourteen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_FIFTEEN,
      page: () => CardFifteen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_SIXTEEN,
      page: () => CardSixteen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CARD_SEVENTEEN,
      page: () => CardSeventeen(),
      // binding: LoginBinding(),
    ),
    // GetPage(
    //   name: _Paths.BASIC_INFORMATION,
    //   page: () => BasicInformation(),
    // ),
    // GetPage(
    //   name: _Paths.FAMILY_INFORMATION,
    //   page: () => FamilyInformation(),
    // ),
    // GetPage(
    //   name: _Paths.REQUIRED_PROPOSAL,
    //   page: () => RequiredProposal(),
    // ),
    // GetPage(
    //   name: _Paths.REQUIRED_PROPOSAL_EDIT,
    //   page: () => RequiredProposalEdit(),
    // ),
    // GetPage(
    //   name: _Paths.ALL_CASTES_MAIN_PAGE,
    //   page: () => AllCastesMainPage(),
    // ),
    // GetPage(
    //   name: _Paths.PROPOSALS_LIST,
    //   page: () => ProposalsList(),
    // ),
    // GetPage(
    //   name: _Paths.PROFILE_VIEWS,
    //   page: () => ProfileViews(),
    // ),
    // GetPage(
    //   name: _Paths.PROPOSALS_DETAIL,
    //   page: () => ProposalDetails(),
    // ),
    // GetPage(
    //   name: _Paths.DELETE_PROFILE,
    //   page: () => DeleteProfile(),
    // ),
    // GetPage(
    //   name: _Paths.FILTER_SCREEN,
    //   page: () => FilterScreen(),
    // ),
    // GetPage(
    //   name: _Paths.EDIT_PROFILE,
    //   page: () => EditProfile(),
    // ),
    // GetPage(
    //   name: _Paths.EDIT_PROFILE_NEW,
    //   page: () => EditProfileNew(),
    // ),
    // GetPage(
    //   name: _Paths.BASIC_INFORMATION_EDIT,
    //   page: () => BasicInformationEdit(),
    // ),
    // GetPage(
    //   name: _Paths.FAMILY_INFORMATION_EDIT,
    //   page: () => FamilyInformationEdit(),
    // ),
    // GetPage(
    //   name: _Paths.PRIVACY_POLICY,
    //   page: () => WebViewClass(),
    // ),
    // GetPage(
    //   name: _Paths.TERMS_CONDITIONS,
    //   page: () => WebViewClass(),
    // ),
    // GetPage(
    //   name: _Paths.CREATE_ACCOUNT,
    //   page: () => CreateAccount(),
    // ),
    // GetPage(
    //   name: _Paths.CONNECT_WITH,
    //   page: () => ConnectWith(),
    // ),
    // GetPage(
    //   name: _Paths.INTRO_SCREEN,
    //   page: () => IntroScreen(),
    // ),
    // GetPage(
    //   name: _Paths.LOGIN,
    //   page: () => LoginView(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SPLASH_SCREEN,
    //   page: () => SplashScreen(),
    //   binding: SplashScreenBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SELECTION_SCREEN,
    //   page: () => SelectionScreen(),
    //   binding: SplashScreenBinding()
    // ),
    // GetPage(
    //   name: _Paths.ADMIN_LOGIN,
    //   page: () => LoginView(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MEMBER_LOGIN,
    //   page: () => MemberLogin(),
    //   binding: SplashScreenBinding()
    // ),
    // GetPage(
    //   name: _Paths.ADMIN_DASHBOARD,
    //   page: () => AdminDashboard(),
    //   binding: AdminBinding()
    // ),
    // GetPage(
    //   name: _Paths.CALENDER_TASK_LIST,
    //   page: () => AdminCalendarTaskListView(),
    //   binding: AdminBinding()
    //
    // ),
    // GetPage(
    //   name: _Paths.PLANS_LIST,
    //   page: () => PlansList(),
    //   binding: SharedBinding(),
    //
    // ),
    // GetPage(
    //   name: _Paths.ADD_PLAN,
    //   page: () => AddPlan(),
    //   binding: SharedBinding(),
    //
    //
    // ),
    // GetPage(
    //   name: _Paths.PLAN_DETAIL,
    //   page: () => PlanDetail(),
    //   binding: PlanDetailBinding()
    // ),
    // GetPage(
    //   name: _Paths.EDIT_PLAN,
    //   page: () => EditPlanDetail(),
    //   binding: SharedBinding(),
    // ),
    // GetPage(
    //   name: _Paths.INSTRUCTOR_LIST,
    //   page: () => InstructorListView(),
    //   binding: SharedBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MEMBER_LIST,
    //   page: () => MemberListView(),
    //   binding: SharedBinding(),
    // ),
    // GetPage(
    //   name: _Paths.INSTRUCTOR_PROFILE,
    //   page: () => InstructorProfile(),
    //   binding: InstructorBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MY_INSTRUCTOR_PROFILE,
    //   page: () => MyInstructorProfile(),
    //   binding: MyInstructorProfileBinding(),
    // ),
    // GetPage(
    //   name: _Paths.INSTRUCTOR_PROFILE_EDIT,
    //   page: () => InstructorProfileEdit(),
    //   binding: InstructorBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ADMIN_INSTRUCTOR_PROFILE_EDIT,
    //   page: () => AdminInstructorProfileEdit(),
    //   binding: InstructorBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ADD_INSTRUCTOR,
    //   page: () => AddInstructor(),
    //   binding: InstructorBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MEMBER_PROFILE,
    //   page: () => MemberProfile(),
    //   binding: MemberBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MY_MEMBER_PROFILE,
    //   page: () => MyMemberProfile(),
    //   binding: MemberProfileBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MEMBER_PROFILE_EDIT,
    //   page: () => MemberEditProfile(),
    //   binding: MemberBinding(),
    //
    // ),
    // GetPage(
    //   name: _Paths.MY_MEMBER_PROFILE_EDIT,
    //   page: () => MyMemberEditProfile(),
    //   binding: EditMemberProfileBinding(),
    //
    // ),
    // GetPage(
    //   name: _Paths.ADD_MEMBER,
    //   page: () => AddMember(),
    //   binding: MemberBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ADMIN_PROFILE,
    //   page: () => AdminProfile(),
    //     binding: AdminEditViewBinding()
    // ),
    // GetPage(
    //   name: _Paths.ADMIN_PROFILE_EDIT,
    //   page: () => AdminEditProfile(),
    //     binding: AdminEditViewBinding()
    // ),
    // GetPage(
    //   name: _Paths.ADD_ADMIN,
    //   page: () => AdminSignUp(),
    //   binding: AdminSignUpBinding()
    // ),
    // GetPage(
    //   name: _Paths.WORKOUT_DETAIL,
    //   page: () => WorkoutDetail(),
    //     binding: SharedBinding()
    // ),
    // GetPage(
    //     name: _Paths.WORKOUT_ADD,
    //     page: () => WorkoutADD(),
    //     binding: SharedBinding()
    // ),
    // GetPage(
    //   name: _Paths.WORKOUT_LIST,
    //   page: () => WorkoutList(),
    //   binding: SharedBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MEMBER_DASHBOARD,
    //   page: () => MemberDashboard(),
    //   binding: MemberDashboardBinding()
    // ),
    // // GetPage(
    // //   name: _Paths.MEMBER_PLAN_DETAIL,
    // //   page: () => MemberPlanDetail(),
    // //   binding: MemberDashboardBinding()
    // // ),
    // GetPage(
    //   name: _Paths.INSTRUCTOR_DASHBOARD,
    //   page: () => InstructorDashboard(),
    //   binding: InstructorBinding()
    // ),
    // GetPage(
    //   name: _Paths.SELECT_PLANS,
    //   page: () => SelectPlans(),
    // ),
    // GetPage(
    //   name: _Paths.SELECT_WORKOUTS,
    //   page: () => SelectWorkout(),
    //   binding: SharedBinding()
    // ),
    // GetPage(
    //   name: _Paths.SELECT_MEMBERS,
    //   page: () => SelectMembers(),
    // ),
    // GetPage(
    //   name: _Paths.SELECT_INSTRUCTORS,
    //   page: () => SelectInstructors(),
    // ),
    // GetPage(
    //   name: _Paths.SELECT_INSTRUCTORS_ON_UPDATE,
    //   page: () => SelectInstructorsOnUpdate(),
    // ),
    // GetPage(
    //   name: _Paths.SELECT_MEMBERS_ON_UPDATE,
    //   page: () => SelectMembersOnUpdate(),
    // ),
    // GetPage(
    //   name: _Paths.SELECT_WORKOUTS_ON_UPDATE,
    //   page: () => SelectWorkoutOnUpdate(),
    // ),
    // GetPage(
    //   name: _Paths.INSTRUCTOR_TASK_LIST,
    //   page: () => InstructorTaskListView(),
    // ),
    // GetPage(
    //   name: _Paths.INSTRUCTOR_PLANS_LIST,
    //   page: () => InstructorPlans(),
    // ),
    // GetPage(
    //   name: _Paths.INSTRUCTOR_MEMBERS_LIST,
    //   page: () => InstructorMemberListView(),
    // ),
  ];
}
