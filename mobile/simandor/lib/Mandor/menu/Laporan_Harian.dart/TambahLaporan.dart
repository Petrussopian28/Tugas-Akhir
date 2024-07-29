import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class TambahLaporan extends StatefulWidget {
  const TambahLaporan({super.key});

  @override
  State<TambahLaporan> createState() => _TambahLaporanState();
}

class _TambahLaporanState extends State<TambahLaporan> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController datetimeinputController = TextEditingController();
  TextEditingController absensiController = TextEditingController();
  TextEditingController luasController = TextEditingController();
  TextEditingController janjangController = TextEditingController();
  TextEditingController catatanController = TextEditingController();

  List<dynamic> divisiList = [];
  List<dynamic> blokList = [];
  List<dynamic> karyawanList = [];
  List<dynamic> userList = [];

  String? selectedDivisi;
  String? selectedBlok;
  String? selectedKaryawan;
  String? selectedUser;

  @override
  void initState() {
    super.initState();
    
    _fetchOptions();
  datetimeinputController.text = "";
  }

  Future<void> _fetchOptions() async {
    final response = await http
        .get(Uri.parse('http://192.168.200.207/si_mandor/get_data.php'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        divisiList = data['divisi'];
        blokList = data['blok'];
        karyawanList = data['karyawan'];
        userList = data['user'];
      });
    } else {
      throw Exception('Failed to load options');
    }
  }

  Future<void> _submitReport() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse('http://192.168.200.207/si_mandor/tambahlaporan.php'),
        body: {
          'datetimeinput': datetimeinputController.text,
          'id_karyawan': selectedKaryawan,
          'absensi': absensiController.text,
          'id_divisi': selectedDivisi,
          'id_blok': selectedBlok,
          'luas': luasController.text,
          'janjang': janjangController.text,
          'catatan': catatanController.text,
          'id_user': selectedUser,
          
        },
      );

      final responseMessage = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseMessage['message'])),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Tambah Laporan'),
      ),
      body: Form(
          key: _formKey,
          child: Container(
        padding: EdgeInsets.all(20.5),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            TextFormField(
              controller: datetimeinputController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Masukan Tanggal"),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  String formatDate =
                      DateFormat('yyyy-MMM-dd').format(pickedDate);
                  setState(() {
                    datetimeinputController.text = formatDate;
                  });
                } else {
                  print("tanggal tidak dipilih");
                  datetimeinputController.text = "";
                }
              },
              validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Divisi Tidak Boleh Kosong";
                  }
                  return null;
                },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
              DropdownButtonFormField<String>(
                value: selectedKaryawan,
                hint: Text('Pilih Karyawan'),
                onChanged: (newValue) {
                  setState(() {
                    selectedKaryawan = newValue;
                  });
                },
                items: karyawanList.map((karyawan) {
                  return DropdownMenuItem<String>(
                    value: karyawan['id_karyawan'].toString(),
                    child: Text(karyawan['nama_karyawan']),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Harap pilih Karyawan' : null,
              ),
            
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            TextFormField(
              controller: absensiController,
              decoration: InputDecoration(
                hintText: "Absensi",
                labelText: "Absensi",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Divisi Tidak Boleh Kosong";
                  }
                  return null;
                },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            DropdownButtonFormField<String>(
                value: selectedDivisi,
                hint: Text('Pilih Divisi'),
                onChanged: (newValue) {
                  setState(() {
                    selectedDivisi = newValue;
                  });
                },
                items: divisiList.map((divisi) {
                  return DropdownMenuItem<String>(
                    value: divisi['id_divisi'].toString(),
                    child: Text(divisi['nama_divisi']),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Harap pilih Divisi' : null,
              ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            DropdownButtonFormField<String>(
                value: selectedBlok,
                hint: Text('Pilih Blok'),
                onChanged: (newValue) {
                  setState(() {
                    selectedBlok = newValue;
                  });
                },
                items: blokList.map((blok) {
                  return DropdownMenuItem<String>(
                    value: blok['id_blok'].toString(),
                    child: Text(blok['nama_blok']),
                  );
                }).toList(),
                validator: (value) => value == null ? 'Harap pilih Blok' : null,
              ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            TextFormField(
              controller: luasController,
              decoration: InputDecoration(
                hintText: "Luas Panen",
                labelText: "Luas Panen",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Divisi Tidak Boleh Kosong";
                  }
                  return null;
                },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            TextFormField(
              controller: janjangController,
              decoration: InputDecoration(
                hintText: "Janjang Panen",
                labelText: "Janjang Panen",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Divisi Tidak Boleh Kosong";
                  }
                  return null;
                },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            TextFormField(
              controller: catatanController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Catatan",
                labelText: "Catatan",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              validator: (value) {
                  if (value!.isEmpty) {
                    return "Nama Divisi Tidak Boleh Kosong";
                  }
                  return null;
                },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(5)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
                          fixedSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: _submitReport,
                      
                      child: Text('Simpan',
                      style: TextStyle(color: Colors.black),
                    )),
                ],
              )
          
          ],
        ),
      )),
    );
  }

}
