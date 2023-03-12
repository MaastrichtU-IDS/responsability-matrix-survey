part of '../login_page.dart';

class OrcIDLoginButton extends StatelessWidget {
  const OrcIDLoginButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: onPressed,
      isPrimary: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/orcid_icon.png',
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 10),
          const Text('login_orcid').tr(),
        ],
      ),
    );
  }
}
