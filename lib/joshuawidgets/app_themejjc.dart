import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'App Theme';
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          // titleLarge: GoogleFonts.oswald(
          //   fontSize: 30,
          //   fontStyle: FontStyle.italic,
          // ),
          // bodyMedium: GoogleFonts.merriweather(),
          // displaySmall: GoogleFonts.pacifico(),
          titleLarge: const TextStyle(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    const title = 'Custom Theme';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Text('Text with a background color',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  )),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink,
            brightness: Brightness.dark,
          ),
        ),
        child: FloatingActionButton(
            onPressed: () {}, child: const Icon(Icons.add)),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Theme.of(context).colorScheme.onSecondary,
      //   ),
      //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      //   child: Row(
      //     children: [
      //       IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.add),
      //       ),
      //       IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.add),
      //       ),
      //       IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.add),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
