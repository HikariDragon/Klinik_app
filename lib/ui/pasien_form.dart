import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/pasien.dart';
import 'package:flutter_application_1/ui/pasien_detail.dart';
import '../service/pasien_service.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({Key? key}) : super(key: key);
  _PasienFormState createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPasienCtrl = TextEditingController();
  final _nIPCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNamaPasien(),
                _fieldNIP(),
                _fieldTangalLahir(),
                _fieldNomorTelepon(),
                _fieldAlamat(),
              
                const SizedBox(height: 20),
                _tombolSimpan(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldNIP() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP"),
      controller: _nIPCtrl,
    );
  }

  // _fieldTangalLahir() {
  //   return TextField(
  //     decoration: const InputDecoration(labelText: "Tanggal Lahir"),
  //     controller: _tanggalLahirCtrl,
  //   );
  // }
  _fieldTangalLahir() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir"),
      controller: _tanggalLahirCtrl,
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        ).then((selectedDate) {
          if (selectedDate != null) {
            setState(() {
              final formattedDate =
                  "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
              _tanggalLahirCtrl.text = formattedDate;
            });
          }
        });
      },
      readOnly: true,
    );
  }

  _fieldNomorTelepon() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telepon"),
      controller: _nomorTeleponCtrl,
    );
  }

  _fieldAlamat() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatCtrl,
    );
  }

 

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Pasien pasien = new Pasien(
              nip: _nIPCtrl.text,
              nama: _namaPasienCtrl.text,
              tgl: DateTime.parse(_tanggalLahirCtrl.text),
              tlp: _nomorTeleponCtrl.text,
              alamat: _alamatCtrl.text,
              );
          await PasienService().simpan(pasien).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PasienDetail(pasien: value),
              ),
            );
          });
        },
        child: const Text("Simpan"));
  }
}