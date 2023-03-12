part of '../login_page.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UniLogo(),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'login_info',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.titleLarge,
          ).tr(),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: PrimaryButton(
            onPressed: () {
              context.go('/learn-more');
            },
            isPrimary: false,
            child: const Text(
              'learn_more',
              style: TextStyle(color: Colors.black),
            ).tr(),
          ),
        )
      ],
    );
  }
}
