// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<bool> _checkOnboardingComplete;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _checkOnboardingComplete = _isOnboardingComplete();
//   // }

//   // Future<bool> _isOnboardingComplete() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   return prefs.getBool('onboarding_complete') ?? false;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: _checkOnboardingComplete,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return MaterialApp(
//             home: Scaffold(body: Center(child: CircularProgressIndicator())),
//           );
//         }

//         bool isOnboardingComplete = snapshot.data ?? false;

//         return MaterialApp.router(
//           title: 'Onboarding App',
//           routerConfig: _createRouter(isOnboardingComplete),
//         );
//       },
//     );
//   }

//   GoRouter _createRouter(bool isOnboardingComplete) {
//     return GoRouter(
//       initialLocation: isOnboardingComplete
//           ? '/home/tab1'
//           : '/onboarding/step1',
//       redirect: (context, state) {
//         // Redirect logic if needed
//         return null;
//       },
//       routes: [
//         GoRoute(
//           path: '/onboarding',
//           name: 'onboarding',
//           builder: (context, state) => const OnboardingRootPage(),
//           routes: [
//             GoRoute(
//               path: 'step1',
//               name: 'onboarding_step1',
//               builder: (context, state) => const OnboardingStep1(),
//             ),
//             GoRoute(
//               path: 'step2',
//               name: 'onboarding_step2',
//               builder: (context, state) => const OnboardingStep2(),
//             ),
//             GoRoute(
//               path: 'step3',
//               name: 'onboarding_step3',
//               builder: (context, state) => const OnboardingStep3(),
//             ),
//           ],
//         ),
//         ShellRoute(
//           builder: (context, state, child) {
//             return MainAppPage(child: child);
//           },
//           routes: [
//             GoRoute(
//               path: '/home/tab1',
//               name: 'tab1',
//               builder: (context, state) => const Tab1Page(),
//             ),
//             GoRoute(
//               path: '/home/tab2',
//               name: 'tab2',
//               builder: (context, state) => const Tab2Page(),
//             ),
//             GoRoute(
//               path: '/home/tab3',
//               name: 'tab3',
//               builder: (context, state) => const Tab3Page(),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// // Onboarding Root Page
// class OnboardingRootPage extends StatefulWidget {
//   const OnboardingRootPage({Key? key}) : super(key: key);

//   @override
//   State<OnboardingRootPage> createState() => _OnboardingRootPageState();
// }

// class _OnboardingRootPageState extends State<OnboardingRootPage> {
//   int _currentStep = 1;

//   @override
//   void initState() {
//     super.initState();
//     _updateStep();
//   }

//   @override
//   void didUpdateWidget(OnboardingRootPage oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _updateStep();
//   }

//   void _updateStep() {
//     final location = GoRouterState.of(context).uri.path;
//     if (location.contains('step1')) {
//       _currentStep = 1;
//     } else if (location.contains('step2')) {
//       _currentStep = 2;
//     } else if (location.contains('step3')) {
//       _currentStep = 3;
//     }
//   }

//   void _nextStep() {
//     if (_currentStep < 3) {
//       switch (_currentStep) {
//         case 1:
//           context.goNamed('onboarding_step2');
//           break;
//         case 2:
//           context.goNamed('onboarding_step3');
//           break;
//       }
//     }
//   }

//   void _previousStep() {
//     if (_currentStep > 1) {
//       switch (_currentStep) {
//         case 2:
//           context.goNamed('onboarding_step1');
//           break;
//         case 3:
//           context.goNamed('onboarding_step2');
//           break;
//       }
//     }
//   }

//   // Future<void> _completeOnboarding() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   await prefs.setBool('onboarding_complete', true);
//   //   if (mounted) {
//   //     context.goNamed('tab1');
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Onboarding'),
//         automaticallyImplyLeading: false,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           // Progress indicator
//           LinearProgressIndicator(value: _currentStep / 3, minHeight: 4),
//           Expanded(
//             child: Router(
//               routerDelegate: GoRouter.of(context).routerDelegate,
//               routeInformationParser: GoRouter.of(
//                 context,
//               ).routeInformationParser,
//               routeInformationProvider: GoRouter.of(
//                 context,
//               ).routeInformationProvider,
//             ),
//           ),
//           // Navigation buttons
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 if (_currentStep > 1)
//                   ElevatedButton.icon(
//                     onPressed: _previousStep,
//                     icon: const Icon(Icons.arrow_back),
//                     label: const Text('Previous'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey,
//                     ),
//                   )
//                 else
//                   const SizedBox(width: 100),
//                 Text(
//                   'Step $_currentStep of 3',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 if (_currentStep < 3)
//                   ElevatedButton.icon(
//                     onPressed: _nextStep,
//                     label: const Text('Next'),
//                     icon: const Icon(Icons.arrow_forward),
//                   )
//                 else
//                   ElevatedButton.icon(
//                     // onPressed: _completeOnboarding,
//                     onPressed: () {},
//                     label: const Text('Start App'),
//                     icon: const Icon(Icons.check),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Onboarding Steps
// class OnboardingStep1 extends StatelessWidget {
//   const OnboardingStep1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.rocket_launch, size: 100, color: Colors.blue),
//           const SizedBox(height: 24),
//           const Text(
//             'Welcome to Our App',
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'This is the first step of your onboarding journey. Learn about the amazing features we offer.',
//             style: TextStyle(fontSize: 16, color: Colors.grey),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingStep2 extends StatelessWidget {
//   const OnboardingStep2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.favorite, size: 100, color: Colors.pink),
//           const SizedBox(height: 24),
//           const Text(
//             'Easy to Use',
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'Our intuitive interface makes it simple to navigate and find what you need.',
//             style: TextStyle(fontSize: 16, color: Colors.grey),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnboardingStep3 extends StatelessWidget {
//   const OnboardingStep3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.settings, size: 100, color: Colors.green),
//           const SizedBox(height: 24),
//           const Text(
//             'Customize Everything',
//             style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'Personalize your experience with our flexible settings and preferences.',
//             style: TextStyle(fontSize: 16, color: Colors.grey),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Main App Pages (Tabbed Interface)
// class MainAppPage extends StatefulWidget {
//   final Widget child;

//   const MainAppPage({required this.child, Key? key}) : super(key: key);

//   @override
//   State<MainAppPage> createState() => _MainAppPageState();
// }

// class _MainAppPageState extends State<MainAppPage> {
//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _updateSelectedIndex();
//   }

//   @override
//   void didUpdateWidget(MainAppPage oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _updateSelectedIndex();
//   }

//   void _updateSelectedIndex() {
//     final location = GoRouterState.of(context).uri.path;
//     if (location.contains('tab1')) {
//       _selectedIndex = 0;
//     } else if (location.contains('tab2')) {
//       _selectedIndex = 1;
//     } else if (location.contains('tab3')) {
//       _selectedIndex = 2;
//     }
//   }

//   void _onTabTapped(int index) {
//     setState(() => _selectedIndex = index);
//     switch (index) {
//       case 0:
//         context.goNamed('tab1');
//         break;
//       case 1:
//         context.goNamed('tab2');
//         break;
//       case 2:
//         context.goNamed('tab3');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Main App'), centerTitle: true),
//       body: widget.child,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onTabTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab 1'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Tab 2'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Tab 3'),
//         ],
//       ),
//     );
//   }
// }

// class Tab1Page extends StatelessWidget {
//   const Tab1Page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.home, size: 64, color: Colors.blue),
//           const SizedBox(height: 16),
//           const Text('Tab 1 Page', style: TextStyle(fontSize: 24)),
//           const SizedBox(height: 32),
//           ElevatedButton(
//             onPressed: () => context.goNamed('tab2'),
//             child: const Text('Go to Tab 2'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Tab2Page extends StatelessWidget {
//   const Tab2Page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.favorite, size: 64, color: Colors.pink),
//           const SizedBox(height: 16),
//           const Text('Tab 2 Page', style: TextStyle(fontSize: 24)),
//           const SizedBox(height: 32),
//           ElevatedButton(
//             onPressed: () => context.goNamed('tab3'),
//             child: const Text('Go to Tab 3'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Tab3Page extends StatelessWidget {
//   const Tab3Page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.settings, size: 64, color: Colors.green),
//           const SizedBox(height: 16),
//           const Text('Tab 3 Page', style: TextStyle(fontSize: 24)),
//         ],
//       ),
//     );
//   }
// }
