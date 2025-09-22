import 'package:flutter/material.dart';
import '../models/user.dart';
import 'bottom_navigation.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final primaryColor = Color(0xFFF4CEB7);
  bool _obscure = true;
  bool _agree = false;
  String? _gender;
  DateTime? _tanggalLahir;

  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _tgllhrText = TextEditingController();
  final _kotaLahir = TextEditingController();

  // set mana saja fiel yang harus diisi
  String? _required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null;

  //Sebelum buat onpress tambahkan event
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 100);
    final last = DateTime(now.year + 1);
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 20, now.month, now.day),
      firstDate: first,
      lastDate: last,
    );
    if (picked != null) {
      setState(() {
        _tanggalLahir = picked;
        _tgllhrText.text =
            '${picked.day.toString().padLeft(2, '0')}-'
            '${picked.month.toString().padLeft(2, '0')}-'
            '${picked.year}';
      });
    }
  }

  // tempat penyimpanan sederhana untuk dikirim ke halaman setelahnya
  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (!_agree) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Centang persetujuan terlebih dahulu!')),
        );
        return;
      }

      final data = User(
        name: _name.text.trim(),
        email: _email.text.trim(),
        city: _kotaLahir.text.trim(),
        gender: _gender,
        birthdate: _tanggalLahir ?? DateTime.now(),
      );
      Navigator.of(context).pushNamed(BottomNavigation.routeName, arguments: data);
    }
  }

  // safearea turunan dari container karena itu bisa child
  //code utk UI & User
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'Nama'),
                  validator: _required,
                  textInputAction: TextInputAction.next,
                ),

                // const SizedBox(height: 12),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: _required,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                      tooltip: _obscure ? 'Tampilkan' : 'Sembunyikan',
                    ),
                  ),
                  obscureText: _obscure,
                  validator: _required,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _kotaLahir,
                  decoration: const InputDecoration(labelText: 'Kota Lahir'),
                  validator: _required,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _tgllhrText,
                  validator: _required,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                    suffixIcon: IconButton(
                      onPressed: _pickDate,
                      icon: const Icon(Icons.date_range),
                      tooltip: 'PilihTanggal',
                    ),
                  ),
                  onTap: _pickDate,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Jenis Kelamin',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Laki-Laki'),
                        value: 'L',
                        groupValue: _gender,
                        onChanged: (v) => setState(() => _gender = v),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Perempuan'),
                        value: 'P',
                        groupValue: _gender,
                        onChanged: (v) => setState(() => _gender = v),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CheckboxListTile(
                  value: _agree,
                  onChanged: (v) => setState(() => _agree = v ?? false),
                  title: const Text('Saya menyetujui syarat & ketentuan'),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                //   Tombol submit
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.check),
                    label: const Text('Daftar'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(14)
                      ),
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
