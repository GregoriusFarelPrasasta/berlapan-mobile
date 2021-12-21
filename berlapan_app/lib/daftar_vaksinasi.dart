import 'package:flutter/material.dart';
import 'main.dart';

class DaftarVaksinasi extends StatelessWidget {
  const DaftarVaksinasi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berlapan - Daftar Vaksinasi',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Berlapan - Daftar Vaksinasi'),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.green),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Ayo Vaksinasi',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Text(
              'Mengapa sih saya harus divaksinasi?',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.0),
            Syarat('1. Mencegah risiko tertular COVID-19',
                'Vaksinasi membuat seseorang tidak mudah tertular COVID-19. Akan tetapi, protokol kesehatannya tetap dijaga ya!'),
            SizedBox(height: 10.0),
            Syarat('2. Mengurangi risiko gejala berat jika terkena COVID-19',
                'Vaksinasi membuat sistem imun tubuh kita lebih kuat melawan virus Corona. Walaupun sampai tertular, gejala yang ditimbulkan dari infeksi COVID-19 pada orang yang telah divaksinasi biasanya ringan.'),
            SizedBox(height: 10.0),
            Syarat('3. Mendorong terbentuknya Herd Immunity',
                'Bila diberikan secara massal, vaksin COVID-19 juga mampu mendorong terbentuknya kekebalan kelompok (herd immunity) dalam masyarakat. Artinya, orang yang tidak bisa mendapatkan vaksin, misalnya bayi baru lahir, lansia, atau penderita kelainan sistem imun tertentu, bisa mendapatkan perlindungan dari orang-orang di sekitarnya.'),
            SizedBox(height: 10.0),
            Syarat('4. Meminimalisasi dampak ekonomi dan sosial',
                'Jika sebagian besar masyarakat sudah memiliki sistem kekebalan tubuh yang baik untuk melawan penyakit COVID-19, kegiatan sosial dan ekonomi masyarakat bisa kembali seperti sediakala.'),
            SizedBox(height: 15.0),
            ElevatedButton(
              child: Text('Ayo Daftar Vaksinasi Sekarang!'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DaftarVaksinasiForm()));
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class Syarat extends StatelessWidget {
  final String judul;
  final String isi;

  const Syarat(this.judul, this.isi);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.yellow),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(this.judul + "\n" + this.isi),
      ),
    );
  }
}

class DaftarVaksinasiForm extends StatelessWidget {
  const DaftarVaksinasiForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Daftar Vaksinasi',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Pendaftaran Vaksinasi'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Form Pendaftaran Vaksinasi',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(height: 15.00),
              const FormDaftar(),
              SizedBox(height: 15.00),
              ElevatedButton(
                child: Text("Klik Setelah Daftar"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Berhasil()));
                },
              ),
              SizedBox(height: 10.00),
              ElevatedButton(
                child: Text("Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormDaftar extends StatefulWidget {
  const FormDaftar({Key? key}) : super(key: key);

  @override
  FormDaftarState createState() {
    return FormDaftarState();
  }
}

class FormDaftarState extends State<FormDaftar> {
  final _formKey = GlobalKey<FormState>();

  //Untuk dropdown alamat sentra vaksinasi
  final alamatTersedia = [
    "Alamat A",
    "Alamat B",
    "Alamat C",
    "Alamat D",
    "Alamat E",
  ];
  String? alamatTerpilih;

  //Untuk dropdown tanggal Vaksinasi
  final tanggalVaksinasiTersedia = [
    "Tanggal 1",
    "Tanggal 2",
    "Tanggal 3",
  ];
  String? tanggalVaksinasiTerpilih;

  //Untuk dropdown jam vaksinasi
  final jamVaksinasiTersedia = [
    "08.00 - 09.00",
    "09.00 - 10.00",
    "10.00 - 11.00",
    "11.00 - 12.00",
    "12.00 - 13.00",
    "13.00 - 14.00",
    "14.00 - 15.00",
    "15.00 - 16.00",
    "16.00 - 17.00",
  ];
  String? jamVaksinasiTerpilih;

  //Untuk dropdown Vaksinasi ke-
  final pilihanVaksinasiKe = ["1", "2"];
  String? vaksinasiKeTerpilih;

  //Membuat method buildMenuItem
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ),
      );

  //Method isNumeric
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  String selectedTanggalVaksinasi = "";
  Widget build(BuildContext context) {
    String tanggalLahir = "";
    DateTime tanggalLahirPilihan;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Nama:",
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi field ini.';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Masukkan nama Anda',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Tanggal Lahir:",
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi field ini.';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Format : dd-mm-yyyy',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "NIK:",
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mohon isi field ini.';
              } else if (!(isNumeric(value))) {
                return 'Mohon isi field ini dengan numerik';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'Masukkan NIK Anda (Harus numerik)',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Alamat Sentra Vaksinasi:",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton<String>(
                isExpanded: true,
                items: alamatTersedia.map(buildMenuItem).toList(),
                value: alamatTerpilih,
                onChanged: (value) {
                  setState(() {
                    this.alamatTerpilih = value;
                  });
                }),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Tanggal Vaksinasi: ",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton<String>(
                isExpanded: true,
                items: tanggalVaksinasiTersedia.map(buildMenuItem).toList(),
                value: tanggalVaksinasiTerpilih,
                onChanged: (value) {
                  setState(() {
                    this.tanggalVaksinasiTerpilih = value;
                  });
                }),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Jam Vaksinasi: ",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton<String>(
                isExpanded: true,
                items: jamVaksinasiTersedia.map(buildMenuItem).toList(),
                value: jamVaksinasiTerpilih,
                onChanged: (value) {
                  setState(() {
                    this.jamVaksinasiTerpilih = value;
                  });
                }),
          ),
          SizedBox(
            height: 15.00,
          ),
          Text(
            "Vaksinasi Ke- :",
            style: TextStyle(fontSize: 20.0),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            child: DropdownButton<String>(
                isExpanded: true,
                items: pilihanVaksinasiKe.map(buildMenuItem).toList(),
                value: vaksinasiKeTerpilih,
                onChanged: (value) {
                  setState(() {
                    this.vaksinasiKeTerpilih = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pendaftaran Berhasil')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class Berhasil extends StatelessWidget {
  const Berhasil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Berhasil',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pendaftaran Berhasil'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Form Pendaftaran Vaksinasi',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                'Pendaftaran vaksinasi berhasil! Periksa profile Anda untuk mengakses tiket vaksinasi.',
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(height: 15.00),
              ElevatedButton(
                child: Text('Kembali Ke Home'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
