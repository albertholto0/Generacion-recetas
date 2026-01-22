import 'package:flutter/material.dart';

class KitchenTool {
  final String id;
  final String label;
  final IconData icon;
  final String category;

  const KitchenTool({
    required this.id,
    required this.label,
    required this.icon,
    this.category = 'General',
  });
}

// Espatula, cuchillo. cazuela, vaporera, comal, colador, tetera, exprimidor,

class ToolsRepository {
  static const List<KitchenTool> allTools = [
    // --- Línea Blanca / Grandes ---
    KitchenTool(
      id: 'estufa',
      label: 'Estufa',
      icon: Icons.fireplace,
      category: 'Calor',
    ),
    KitchenTool(
      id: 'horno',
      label: 'Horno',
      icon: Icons.kitchen,
      category: 'Calor',
    ),
    KitchenTool(
      id: 'refri',
      label: 'Refrigerador',
      icon: Icons.kitchen,
      category: 'Frío',
    ),
    KitchenTool(
      id: 'conge',
      label: 'Congelador',
      icon: Icons.ac_unit,
      category: 'Frío',
    ),

    // --- Pequeños Electrodomésticos ---
    KitchenTool(
      id: 'airfryer',
      label: 'Freidora de aire',
      icon: Icons.air,
      category: 'Pequeños',
    ),
    KitchenTool(
      id: 'micro',
      label: 'Microondas',
      icon: Icons.microwave,
      category: 'Pequeños',
    ),
    KitchenTool(
      id: 'licuadora',
      label: 'Licuadora',
      icon: Icons.blender,
      category: 'Pequeños',
    ),
    KitchenTool(
      id: 'cafetera',
      label: 'Cafetera',
      icon: Icons.coffee_maker,
      category: 'Pequeños',
    ),
    KitchenTool(
      id: 'tostadora',
      label: 'Tostadora',
      icon: Icons.bakery_dining,
      category: 'Pequeños',
    ),
    KitchenTool(
      id: 'procesador',
      label: 'Procesador',
      icon: Icons.restaurant,
      category: 'Pequeños',
    ),
    KitchenTool(
      id: 'batidora',
      label: 'Batidora',
      icon: Icons.gesture,
      category: 'Pequeños',
    ),
    KitchenTool(
      id: 'waflera',
      label: 'Waflera',
      icon: Icons.grid_view,
      category: 'Pequeños',
    ),
    KitchenTool(
      id: 'arrocera',
      label: 'Arrocera',
      icon: Icons.shutter_speed,
      category: 'Pequeños',
    ),

    // --- Utensilios de Cocción ---
    KitchenTool(
      id: 'sarten',
      label: 'Sartén',
      icon: Icons.set_meal,
      category: 'Utensilios',
    ),
    KitchenTool(
      id: 'olla',
      label: 'Olla',
      icon: Icons.soup_kitchen,
      category: 'Utensilios',
    ),
    KitchenTool(
      id: 'olla_presion',
      label: 'Olla a presión',
      icon: Icons.timer,
      category: 'Utensilios',
    ),
    KitchenTool(
      id: 'parrilla',
      label: 'Parrilla',
      icon: Icons.reorder,
      category: 'Utensilios',
    ),

    // --- Preparación y Medición ---
    KitchenTool(
      id: 'bascula',
      label: 'Báscula',
      icon: Icons.scale,
      category: 'Medición',
    ),
    KitchenTool(
      id: 'vaso_med',
      label: 'Vaso medidor',
      icon: Icons.local_drink,
      category: 'Medición',
    ),
    KitchenTool(
      id: 'rallador',
      label: 'Rallador',
      icon: Icons.grid_3x3,
      category: 'Preparación',
    ),
    KitchenTool(
      id: 'tabla',
      label: 'Tabla de picar',
      icon: Icons.crop_landscape,
      category: 'Preparación',
    ),
    KitchenTool(
      id: 'pelador',
      label: 'Pelador',
      icon: Icons.cleaning_services,
      category: 'Preparación',
    ),
  ];
}
