import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/core/constants/app_assets.dart';
import 'package:dentbuy_flutter_app/feature/home/models/list_model.dart';
import 'package:dentbuy_flutter_app/feature/home/page/clinics_screen.dart';
import 'package:dentbuy_flutter_app/feature/home/page/tools_screen.dart';
import 'package:dentbuy_flutter_app/feature/home/widgets/list_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _favorites = List.generate(4, (_) => false);

  String _selectedCity = 'Mansoura';

  final List<String> _cities = [
    'Cairo', 'Giza', 'Alexandria', 'Mansoura',
    'Tanta', 'Aswan', 'Luxor', 'Suez', 'Zagazig', 'Ismailia',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
        titleSpacing: 12,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            // ── Row 1: Logo + Categories + Notification ───────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SvgPicture.asset(
                  AppAssets.logoSvg,
                  width: 36,
                  colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                ),

                SizedBox(width: 40),

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

                SizedBox(width: 30),

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

            // ── Row 2: Location Selector ──────────────────────────────
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: AppColors.redcolor, size: 16),
                SizedBox(width: 2),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCity,
                    isDense: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.primary, size: 16),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.darkcolor,
                    ),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    onChanged: (String? newCity) {
                      if (newCity != null) setState(() => _selectedCity = newCity);
                    },
                    items: _cities.map((city) {
                      final bool isSelected = _selectedCity == city;
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Row(
                          children: [
                        
                            SizedBox(width: 6),
                            Text(
                              city,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                                color: isSelected ? AppColors.darkcolor : AppColors.darkcolor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            SizedBox(height: 6),

            // ── Row 3: Search Bar ─────────────────────────────────────
            SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for service...',
                  hintStyle: TextStyle(color: AppColors.graycolor, fontSize: 13),
                  prefixIcon: Icon(Icons.search, color: AppColors.graycolor, size: 18),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.graycolor.withOpacity(0.4)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.graycolor.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

      // ── Body: unchanged ───────────────────────────────────────────────
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Clinics for Rent', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                
                    onPressed: () {
                     Navigator.push(
                     context,
                        MaterialPageRoute(builder: (_) => const ClinicsScreen()),
                    );

                    },
                    child: Text('See All', style: TextStyle(fontSize: 12, color: AppColors.primary)),
                  ),
                ],
              ),

              SizedBox(height: 10),

              SizedBox(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _favorites.length,
                  separatorBuilder: (_, __) => SizedBox(width: 10),
                  itemBuilder: (context, index) => ListViewCard(
                    isFavorite: _favorites[index],
                    onTap: () => setState(() => _favorites[index] = !_favorites[index]),
                    product: clinicProducts[index],
                  ),
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Clinics for Sale', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                       Navigator.push(
                       context,
                       MaterialPageRoute(builder: (_) => const ClinicsScreen()),
                    );
                    },
                    child: Text('See All', style: TextStyle(fontSize: 12, color: AppColors.primary)),
                  ),
                ],
              ),

              SizedBox(height: 10),

              SizedBox(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _favorites.length,
                  separatorBuilder: (_, __) => SizedBox(width: 10),
                  itemBuilder: (context, index) => ListViewCard(
                    isFavorite: _favorites[index],
                    onTap: () => setState(() => _favorites[index] = !_favorites[index]), product:   clinicProducts[index],
                  ),
                ),
              ),
                     SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('tools', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {
                       Navigator.push(
                     context,
                        MaterialPageRoute(builder: (_) => const ToolsScreen()),
                    );
                    },
                    child: Text('See All', style: TextStyle(fontSize: 12, color: AppColors.primary)),
                  ),
                ],
              ),

              SizedBox(height: 10),

              SizedBox(
                height: 250,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _favorites.length,
                  separatorBuilder: (_, __) => SizedBox(width: 10),
                  itemBuilder: (context, index) => ListViewCard(
                    isFavorite: _favorites[index],
                    onTap: () => setState(() => _favorites[index] = !_favorites[index]), product:   clinicProducts[index],
                  ),
                ),
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

