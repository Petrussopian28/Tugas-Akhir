// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class EditLaporan extends StatefulWidget {
//   final Map<String, dynamic> laporan;
//   final Function onUpdate;

//   EditLaporan({required this.laporan, required this.onUpdate});

//   @override
//   _EditLaporanState createState() => _EditLaporanState();
// }

// class _EditLaporanState extends State<EditLaporan> {
//   late TextEditingController datetimeinputController;
//   late TextEditingController absensiController;
//   late TextEditingController luasController;
//   late TextEditingController janjangController;
//   late TextEditingController catatanController;

//   @override
//   void initState() {
//     super.initState();
//     datetimeinputController = TextEditingController(text: widget.laporan['datetimeinput']);
//     absensiController = TextEditingController(text: widget.laporan['absensi']);
//     luasController = TextEditingController(text: widget.laporan['luas']);
//     janjangController = TextEditingController(text: widget.laporan['janjang']);
//     catatanController = TextEditingController(text: widget.laporan['catatan']);
//   }

//   Future<void> _editLaporan() async {
//     final response = await http.post(
//       Uri.parse('http://192.168.92.207/si_mandor/editlaporan.php'),
//       body: {
//         'id_laporan': widget.laporan['id_laporan'],
//         'datetimeinput': datetimeinputController.text,
//         'absensi': absensiController.text,
//         'luas': luasController.text,
//         'janjang': janjangController.text,
//         'catatan': catatanController.text,
//         'id_divisi': widget.laporan['id_divisi'],
//         'id_blok': widget.laporan['id_blok'],
//         'id_karyawan': widget.laporan['id_karyawan'],
//       },
//     );

//     if (response.statusCode == 200) {
//       final jsonResponse = json.decode(response.body);
//       print(jsonResponse['message']);
//       widget.onUpdate(); // Panggil fungsi onUpdate di RiwayatLaporan untuk me-refresh data
//       Navigator.pop(context);
//     } else {
//       throw Exception('Failed to edit laporan');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Laporan'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextFormField(
//               controller: datetimeinputController,
//               decoration: InputDecoration(labelText: 'Tanggal Input'),
//             ),
//             TextFormField(
//               controller: absensiController,
//               decoration: InputDecoration(labelText: 'Absensi'),
//             ),
//             TextFormField(
//               controller: luasController,
//               decoration: InputDecoration(labelText: 'Luas'),
//             ),
//             TextFormField(
//               controller: janjangController,
//               decoration: InputDecoration(labelText: 'Janjang'),
//             ),
//             TextFormField(
//               controller: catatanController,
//               decoration: InputDecoration(labelText: 'Catatan'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _editLaporan,
//               child: Text('Simpan Perubahan'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
