// To parse this JSON data, do
//
//     final complaintImageUpload = complaintImageUploadFromJson(jsonString);

import 'dart:convert';

ComplaintImageUpload complaintImageUploadFromJson(String str) => ComplaintImageUpload.fromJson(json.decode(str));

String complaintImageUploadToJson(ComplaintImageUpload data) => json.encode(data.toJson());

class ComplaintImageUpload {
    ComplaintImageUpload({
        this.message,
        this.status,
        this.file,
    });

    String? message;
    String? status;
    List<FileElement>? file;

    factory ComplaintImageUpload.fromJson(Map<String, dynamic> json) => ComplaintImageUpload(
        message: json["message"],
        status: json["status"],
        file: List<FileElement>.from(json["file"].map((x) => FileElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "file": List<dynamic>.from(file!.map((x) => x.toJson())),
    };
}

class FileElement {
    FileElement({
        this.fieldname,
        this.originalname,
        this.encoding,
        this.mimetype,
        this.destination,
        this.filename,
        this.path,
        this.size,
    });

    String? fieldname;
    String? originalname;
    String? encoding;
    String? mimetype;
    String? destination;
    String? filename;
    String? path;
    int? size;

    factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        fieldname: json["fieldname"],
        originalname: json["originalname"],
        encoding: json["encoding"],
        mimetype: json["mimetype"],
        destination: json["destination"],
        filename: json["filename"],
        path: json["path"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "fieldname": fieldname,
        "originalname": originalname,
        "encoding": encoding,
        "mimetype": mimetype,
        "destination": destination,
        "filename": filename,
        "path": path,
        "size": size,
    };
}
