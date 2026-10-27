import 'package:flutter/material.dart';

import '../../constants/colors.dart';

/// Compte client : identité, activité et réglages.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBack,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBack,
        surfaceTintColor: AppColors.whiteBack,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Profile', style: TextStyle(color: AppColors.ternary, fontSize: 20)),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          // Identité
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, Color(0xFFFFA85C)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 34,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 31,
                    backgroundImage: AssetImage('assets/images/girl_smile.png'),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Emma Laurent',
                          style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('emma.laurent@mail.com', style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.22),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Gold',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Activité
          Row(
            children: const [
              _Stat(value: '12', label: 'Orders'),
              SizedBox(width: 10),
              _Stat(value: '4', label: 'Wishlist'),
              SizedBox(width: 10),
              _Stat(value: '\$40', label: 'Credits'),
            ],
          ),
          const SizedBox(height: 16),
          const _Section(items: [
            _Item(Icons.local_shipping_outlined, 'My orders', 'Order #4821 · On the way'),
            _Item(Icons.location_on_outlined, 'Shipping addresses', '2 saved addresses'),
            _Item(Icons.credit_card_outlined, 'Payment methods', 'Visa •••• 4242'),
          ]),
          const SizedBox(height: 12),
          const _Section(items: [
            _Item(Icons.notifications_none_rounded, 'Notifications', 'Promotions and order updates'),
            _Item(Icons.help_outline_rounded, 'Help center', 'FAQ and customer support'),
          ]),
          const SizedBox(height: 12),
          const _Section(items: [
            _Item(Icons.logout_rounded, 'Log out', null, danger: true),
          ]),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.grayFineColor),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.ternary)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _Item {
  final IconData icon;
  final String title;
  final String? subtitle;
  final bool danger;

  const _Item(this.icon, this.title, this.subtitle, {this.danger = false});
}

class _Section extends StatelessWidget {
  final List<_Item> items;

  const _Section({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.grayFineColor),
      ),
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: (items[i].danger ? AppColors.alert : AppColors.primary).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(items[i].icon,
                    color: items[i].danger ? AppColors.alert : AppColors.primary, size: 21),
              ),
              title: Text(
                items[i].title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: items[i].danger ? AppColors.alert : AppColors.ternary,
                ),
              ),
              subtitle: items[i].subtitle == null
                  ? null
                  : Text(items[i].subtitle!, style: const TextStyle(fontSize: 12.5, color: Colors.grey)),
              trailing: items[i].danger ? null : const Icon(Icons.chevron_right_rounded, color: Colors.grey),
            ),
            if (i < items.length - 1)
              const Divider(height: 1, indent: 72, endIndent: 16, color: AppColors.grayFineColor),
          ],
        ],
      ),
    );
  }
}
