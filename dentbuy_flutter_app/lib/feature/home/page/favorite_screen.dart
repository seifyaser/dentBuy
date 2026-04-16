import 'package:dentbuy_flutter_app/core/constants/app_assets.dart';
import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/home/page/clinics_screen.dart';
import 'package:dentbuy_flutter_app/feature/home/page/tools_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteItem {
  final String id;
  final String title;
  final String description;
  final String category;
  final String icon;
  final Color color;
  bool isFavorite;

  FavoriteItem({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
    required this.color,
    this.isFavorite = true,
  });
}

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<FavoriteItem> _favoriteItems;

  @override
  void initState() {
    super.initState();
    _initializeFavorites();
  }

  void _initializeFavorites() {
    _favoriteItems = [
      FavoriteItem(
        id: '1',
        title: 'Dr. Ahmed Hassan',
        description: 'Orthodontist - 4.8 rating',
        category: 'Dentist',
        icon: '👨‍⚕️',
        color: const Color(0xFF1E88E5),
      ),
      FavoriteItem(
        id: '2',
        title: 'Professional Cleaning',
        description: 'Advanced teeth cleaning service',
        category: 'Service',
        icon: '✨',
        color: const Color(0xFF1E88E5),  
      ),
      FavoriteItem(
        id: '3',
        title: 'Downtown Clinic',
        description: '24/7 Emergency services',
        category: 'Clinic',
        icon: '🏥',
        color: const Color(0xFF1E88E5),
      ),
      FavoriteItem(
        id: '4',
        title: 'Teeth Whitening',
        description: 'Professional whitening treatment',
        category: 'Service',
        icon: '😁',
        color: const Color(0xFF1E88E5),
      ),
      FavoriteItem(
        id: '5',
        title: 'Dr. Fatima Ali',
        description: 'Cosmetic Dentist - 4.9 rating',
        category: 'Dentist',
        icon: '👩‍⚕️',
        color: const Color(0xFF1E88E5),
      ),
      FavoriteItem(
        id: '6',
        title: 'Root Canal Treatment',
        description: 'Painless treatment available',
        category: 'Service',
        icon: '🦷',
        color: const Color(0xFF1E88E5),
      ),
    ];
  }

  void _removeFavorite(String id) {
    setState(() {
      _favoriteItems.removeWhere((item) => item.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Removed from favorites'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        titleSpacing: 12,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            // ── Row 1: Logo + Categories ───────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SvgPicture.asset(
                  AppAssets.logoSvg,
                  width: 36,
                  colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                ),

                SizedBox(width: 35),

                // Clinics
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ClinicsScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1),
                        ),
                        child: Icon(Icons.maps_home_work, size: 14, color: AppColors.primary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Clinics',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 25),

                // Tools
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ToolsScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1),
                        ),
                        child: Icon(Icons.handyman, size: 14, color: AppColors.primary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Tools',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                Spacer(),

                // Notification
               
              ],
            ),

            SizedBox(height: 6),

          ],
        ),
      ),
      body: _favoriteItems.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _favoriteItems.length,
              itemBuilder: (context, index) {
                return _buildFavoriteCard(context, _favoriteItems[index]);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No Favorites Yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add items to your favorites to see them here',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, FavoriteItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Container
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: item.color.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      item.icon,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: item.color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item.category,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: item.color,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Remove Button
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(
                Icons.bookmark ,
                color: Colors.blue,
              ),
              onPressed: () => _removeFavorite(item.id),
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(8),
              splashRadius: 20,
            ),
          ),
        ],
      ),
    );
  }
}
