import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Botones',
    subtitle: 'Varios Botones',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),

  MenuItems(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),

  MenuItems(
    title: 'Snackabrs and Dialogs',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),
  MenuItems(
    title: 'Animated Container',
    subtitle: 'Stateful Widget Animated',
    link: '/animated',
    icon: Icons.check_box_outlined,
  ),

  MenuItems(
    title: 'Ui Controls + Tiles',
    subtitle: 'Una serie de controles de Flutter',
    link: '/uicontrols',
    icon: Icons.car_rental_outlined,
  ),
  MenuItems(
    title: 'Onboarding',
    subtitle: 'How to use the App',
    link: '/app_tutorial',
    icon: Icons.menu_book_outlined,
  ),

  MenuItems(
    title: 'Infinite Scroll + Pull',
    subtitle: 'Infinite List and pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
];
