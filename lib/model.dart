import 'package:get/state_manager.dart';

class Grids{
 final int id;
 final String name;

  Grids({required this.id, required this.name});
  final isSelected = false.obs;

}

var gridList=[
  Grids(id: 1, name: 'one'),
  Grids(id: 2, name: 'two'),
  Grids(id: 3, name: 'three'),
  Grids(id: 4, name: 'four'),
  Grids(id: 5, name: 'five'),
  Grids(id: 6, name: 'six'),
  Grids(id: 7, name: 'seven'),
  Grids(id: 8, name: 'eight'),
  Grids(id: 9, name: 'nine'),
  Grids(id: 10, name: 'ten'),
  
];