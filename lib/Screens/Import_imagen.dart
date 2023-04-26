import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUsuario extends StatefulWidget {
  final File? var_file;

  const ImagePickerUsuario({Key? key, this.var_file}) : super(key: key);

  @override
  _ImagePickerUsuarioState createState() => _ImagePickerUsuarioState();
}

class _ImagePickerUsuarioState extends State<ImagePickerUsuario> {
  File? _imageFile;
  final _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    if (widget.var_file != null) {
      setState(() => _imageFile = widget.var_file);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Cargar nueva imagen",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.photo_camera,color: Colors.white,),
                onPressed: () async => _pickImageFromCamera(),
                tooltip: 'Toma una foto',
              ),
              IconButton(
                icon: const Icon(Icons.photo,color: Colors.white,),
                onPressed: () async => _pickImageFromGallery(),
                tooltip: 'Agregar una foto de tu galeria',
              ),
            ],
          ),
          if (this._imageFile == null)
            const Placeholder()
          else
            Image.file(this._imageFile!),
          ListTile(
            leading: const Icon(Icons.check,color: Colors.white,),
            title: Text('Guardar cambios', style: TextStyle(color: Colors.white),),
            onTap: () {},
            
          )
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => this._imageFile = File(pickedFile.path));
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() => this._imageFile = File(pickedFile.path));
    }
  }
}