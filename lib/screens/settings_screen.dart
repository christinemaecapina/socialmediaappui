import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Privacy and settings', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSectionHeader('ACCOUNT'),
          _buildSettingItem(Icons.person_outline, 'Manage my account'),
          _buildSettingItem(Icons.lock_outline, 'Privacy and safety'),
          _buildSettingItem(Icons.videocam_outlined, 'Content preferences'),
          _buildSettingItem(Icons.account_balance_wallet_outlined, 'Balance'),
          _buildSettingItem(Icons.share_outlined, 'Share profile'),
          _buildSettingItem(Icons.qr_code_outlined, 'TikCode'),
          
          _buildSectionHeader('GENERAL'),
          _buildSettingItem(Icons.notifications_none, 'Push notifications'),
          _buildSettingItem(Icons.language, 'Language'),
          _buildSettingItem(Icons.wb_sunny_outlined, 'Digital Wellbeing'),
          _buildSettingItem(Icons.accessibility, 'Accessibility'),
          _buildSettingItem(Icons.opacity, 'Data Saver'),
          
          _buildSectionHeader('SUPPORT'),
          _buildSettingItem(Icons.edit_outlined, 'Report a problem'),
          _buildSettingItem(Icons.help_outline, 'Help Center'),
          _buildSettingItem(Icons.info_outline, 'Safety Center'),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, bottom: 8),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 22),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {},
    );
  }
}
