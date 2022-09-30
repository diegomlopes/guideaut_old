import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:guidealt/data/datasources/remote/category_data_source_sql.dart';
import 'package:guidealt/data/datasources/remote/recomendation_data_souce_sql.dart';
import 'package:guidealt/data/datasources/remote/reference_data_source_sql.dart';
import 'package:guidealt/domain/entities/category.dart' as categorymodel;
import 'package:guidealt/domain/entities/recomendation.dart';
import 'package:guidealt/domain/entities/reference.dart';
import 'package:guidealt/domain/entities/user.dart';
import 'package:guidealt/presentation/features/home/widgets/logged_app_bar/logged_app_bar.dart';
import 'package:guidealt/presentation/features/panel/pages/responsive_widget.dart';
import 'package:guidealt/presentation/features/panel/widgets/canvas/canvas_widget.dart';
import 'package:guidealt/theme/app_colors.dart';
import 'package:guidealt/theme/app_fonts.dart';
import 'package:guidealt/theme/app_metrics.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tuple/tuple.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final User _user = User(
  id: 1,
  email: "", 
  password: "",
  firstName: "Diego",
  secondName: "Lopes",
  type: 1
);

class EditRecomendationPage extends StatefulWidget {
  const EditRecomendationPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/edit_recomendation';

  @override
  State<EditRecomendationPage> createState() => _EditRecomendationPageState();
}

class _EditRecomendationPageState extends State<EditRecomendationPage> with SingleTickerProviderStateMixin {

  late QuillController _controller;
  final FocusNode _focusNode = FocusNode();

  ScreenshotController screenshotController = ScreenshotController();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _referenceDescriptionController = TextEditingController();
  final TextEditingController _referenceLinkController = TextEditingController();
  final TextEditingController _referenceDoiController = TextEditingController();

  final List<categorymodel.Category> _tags = <categorymodel.Category>[];

  List<categorymodel.Category> _tagsToSelect = [
    categorymodel.Category(id: -1, description: "+", isMandatoryReference: true, user: _user),
  ];

  String _title = "Untitled";
  bool _isEditingReference = false;
  late Recomendation _recomendation;

  final List<Reference> _references = <Reference>[];

  refreshState(VoidCallback fn) {
    if (mounted) setState(fn);
  }

  @override
  void initState() {
    super.initState();
    _loadFromAssets();

    _titleController.addListener(() {
      setState(() {
        _title = _titleController.text;
      });
    });

    _recomendation = Recomendation(
      user: _user,
      title: _title, 
      plainText: _controller.getPlainText(), 
      categories: _tags, 
      references: _references
    );

    CategoryDataSourceSql().gellAllCategories().then((List<categorymodel.Category> categories) {
      final addCategory = categorymodel.Category(id: -1, description: "+", isMandatoryReference: true, user: _user);
      setState(() {
        _tagsToSelect = categories..add(addCategory);
      });
    });
  }

  void _addTags(tagModel) async {
    if (!_tags.contains(tagModel)) {
      setState(() {
        _tags.add(tagModel);
      });
    } else {
      _removeTag(tagModel);
    }
  }

  void _removeTag(tagModel) async {
    if (_tags.contains(tagModel)) {
      setState(() {
        _tags.remove(tagModel);
      });
    }
  }

  Future<void> _loadFromAssets() async {
      final doc = Document()..insert(0, '');
      setState(() {
        _controller = QuillController(
            document: doc, selection: const TextSelection.collapsed(offset: 0));
      });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Scaffold(body: Center(child: Text('Loading...')));
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppMetrics.appbarHeight),
        child: LoggedAppBar(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Recomendations",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontFamily: AppFonts.apercu,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Divider(),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 16,
                          fontFamily: AppFonts.apercu,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalDivider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Text(
                        _title.isNotEmpty ? _title : "Untitled",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 32,
                          fontFamily: AppFonts.apercu,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Panel > ",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontFamily: AppFonts.apercu,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "My Recomendations > ",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontFamily: AppFonts.apercu,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            _title.isNotEmpty ? _title : "Untitled",
                            style: TextStyle(
                              color: AppColors.lightGrey,
                              fontSize: 14,
                              fontFamily: AppFonts.apercu,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          style: TextStyle(
                            fontFamily: AppFonts.apercu
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 460,
                            child: TextField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                                ),
                                hintText: 'Enter with the title',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 460,
                          child: const Divider()
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 460,
                          child: _buildCategoriesWidget(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 460,
                          child: const Divider()
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontFamily: AppFonts.apercu,
                            )
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 460,
                          child: QuillToolbar.basic(
                            controller: _controller,
                            // webImagePickImpl: _webImagePickImpl,
                            // onImagePickCallback: _onImagePickCallback
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 460,
                            height: MediaQuery.of(context).size.height - 400,
                            child: QuillEditor(
                              controller: _controller,
                              scrollController: ScrollController(),
                              scrollable: true,
                              focusNode: _focusNode,
                              autoFocus: false,
                              readOnly: false,
                              placeholder: 'Describe your recomendation',
                              expands: false,
                              padding: EdgeInsets.zero,
                              customStyles: DefaultStyles(
                                h1: DefaultTextBlockStyle(
                                    const TextStyle(
                                      fontSize: 32,
                                      color: Colors.black,
                                      height: 1.15,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    const Tuple2(16, 0),
                                    const Tuple2(0, 0),
                                    null),
                                sizeSmall: const TextStyle(fontSize: 9),
                              ),
                              embedBuilder: defaultEmbedBuilderWeb
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 460,
                          child: const Divider()
                        ),
                        Row(
                          children: [
                            const Text(
                              "References",
                              style: TextStyle(
                                fontFamily: AppFonts.apercu,
                              )
                            ),
                            GestureDetector(
                              onTap: () => setState(() {
                                _isEditingReference = !_isEditingReference;
                              }),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: circularButtom()
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _references.map((e) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (_references.indexOf(e) + 1).toString() + ". " + e.description,
                                  style: const TextStyle(
                                    fontFamily: AppFonts.apercu,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                InkWell(
                                  onTap: () => launchUrl(Uri.http(e.link, "")),
                                  child: Text(
                                    e.link,
                                    style: TextStyle(
                                      fontFamily: AppFonts.apercu,
                                      color: AppColors.tertiaryColor,
                                    )
                                  ),
                                ),
                                Text(
                                  e.doi,
                                  style: const TextStyle(
                                    fontFamily: AppFonts.apercu,
                                  )
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 460,
                          child: const Divider()
                        ),
                        _isEditingReference ?
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 460,
                          // height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextField(
                                  controller: _referenceDescriptionController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                    ),
                                    hintText: 'Enter with the reference description',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextField(
                                  controller: _referenceLinkController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                    ),
                                    hintText: 'Enter with the reference link',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: TextField(
                                  controller: _referenceDoiController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                    ),
                                    hintText: 'Enter with the reference DOI',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: TextButton(
                                        onPressed: () => setState(() {
                                          _isEditingReference = false;
                                        }), 
                                        child: Container(
                                          width: 150,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: AppColors.lightGrey,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(25)
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                fontFamily: AppFonts.apercu,
                                                color: AppColors.whiteColor,
                                                fontSize: 15
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: TextButton(
                                        onPressed: () => _addReference(), 
                                        child: Container(
                                          width: 150,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(25)
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Add Reference",
                                              style: TextStyle(
                                                fontFamily: AppFonts.apercu,
                                                color: AppColors.whiteColor,
                                                fontSize: 15
                                              )
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ) : 
                        Container(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 460,
                          child: const Divider()
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.basic,
                          child: TextButton(
                            onPressed: () => _saveRecomendation(), 
                            child: Container(
                              width: 100,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25)
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    fontFamily: AppFonts.apercu,
                                    color: AppColors.whiteColor,
                                    fontSize: 15
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 460 > 800 ? 800 : MediaQuery.of(context).size.width - 460,
                            height: (MediaQuery.of(context).size.width - 460 > 800 ? 800 : MediaQuery.of(context).size.width - 460) * 0.75,
                            child: Screenshot(
                              controller: screenshotController,
                              child: const CanvasWidget(),
                            ),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.basic,
                          child: TextButton(
                            onPressed: () => _getPdf(), 
                            child: Container(
                              width: 100,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25)
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Get PDF",
                                  style: TextStyle(
                                    fontFamily: AppFonts.apercu,
                                    color: AppColors.whiteColor,
                                    fontSize: 15
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getPdf() {
    screenshotController.capture().then((Uint8List? screenShot) {
      if (screenShot != null) {
        getPdf(screenShot);
      }
    });
    
  }

  Future getPdf(Uint8List screenShot) async {
    final pdf = pw.Document();

    final logoImage = pw.MemoryImage(
      screenShot,
    );

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          var width = MediaQuery.of(this.context).size.width;
          var height = MediaQuery.of(this.context).size.height;
          return pw.Container(
            margin: pw.EdgeInsets.only(top: height * 0.1),
            child: pw.ListView(
              children: [
                pw.Text("asdasd")
                // your image here
                // pw.Container(
                //     height: height * 0.25, child: pw.Image(logoImage)),
              // other contents
              ],
            ),
          );
        }));

  final bytes = await pdf.save();

  html.Blob myBlob = html.Blob(bytes);

  final url = html.Url.createObjectUrlFromBlob(myBlob);

  final anchor = html.document.createElement('a') as html.AnchorElement
     ..href = url
     ..style.display = 'none'
     ..download = 'pdf.pdf';
  
  if (html.document.body != null) {
    html.document.body?.children.add(anchor);
    anchor.click();
    print("Entrou aqui");
  }

  // var anchorElement = html.AnchorElement(
  //   href: html.Url.createObjectUrlFromBlob(myBlob).toString(),
  // )..setAttribute("download", "data.txt")..click();

}

  void _addReference() {
    final reference = Reference(
      recomendation: _recomendation,
      description: _referenceDescriptionController.text, 
      link: _referenceLinkController.text,
      doi: _referenceDoiController.text
    );

    setState(() {
      _references.add(reference);
      _isEditingReference = false;
      _referenceDescriptionController.text = "";
      _referenceLinkController.text = "";
      _referenceDoiController.text = "";
    });
  }

  void _saveRecomendation() {
    
    
    _recomendation = Recomendation(
      user: _user,
      title: _title, 
      plainText: _controller.getPlainText(), 
      categories: _tags, 
      references: _references
    );

    final ReferenceDataSourceSql referenceDataSourceSql = ReferenceDataSourceSql();

    // RecomendationDataSource().addRecomendation(_recomendation).then((value) {
    //   showAlertDialog(context);
    // });

    // RecomendationDataSourceSql(
    //   referenceDataSourceSql: referenceDataSourceSql)
    //   .addRecomendation(_recomendation).then((value) {
    //     showAlertDialog(context);
    //   }).catchError((onError) => print(onError));
  }

  showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  final alert = AlertDialog(
          title: const Text('Saved'),
          content: Text('The recomendation: $_title was successfully saved!'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () { 
              	Navigator.of(context).pop();
              },
            ),
          ],
        );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  Widget _buildCategoriesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
      const Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text('Choose the related categories:'),
      ),
      Wrap(
        alignment: WrapAlignment.start,
        children: _tagsToSelect.where((e) => e.id != _tagsToSelect.last.id).map((tagModel) => tagChip(
                  tagModel: tagModel,
                  onTap: () => _addTags(tagModel),
                  action: 'Add',
                ))
            .toList()
            ..add(
              addTagChip(
                  tagModel: _tagsToSelect.last,
                  onTap: () {},
                  action: 'Add',
                )
            ),
      ),
    ]);
  }

  Widget circularButtom() {
    return _isEditingReference ? 
    Container() : 
    Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),
          child: Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: const Center(
              child: Text(
                "+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget addTagChip({
    required categorymodel.Category tagModel,
    onTap,
    action,
  }) {
    return InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              child: Container(
                width: 37,
                height: 37,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Center(
                  child: Text(
                    tagModel.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget tagChip({
    required categorymodel.Category tagModel,
    onTap,
    action,
  }) {
    return InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 5.0,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: _tags.map((e) => e.id).toList().where((e) => e == tagModel.id).isNotEmpty ? AppColors.tertiaryColor : AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Text(
                  tagModel.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

}

class PlatformViewRegistry {
  static void registerViewFactory(String viewId, dynamic cb) {}
}

class PlatformViewRegistryFix {
  void registerViewFactory(dynamic x, dynamic y) {
    if (kIsWeb) {
      PlatformViewRegistry.registerViewFactory(
        x,
        y,
      );
    }
  }
}

class UniversalUI {
  PlatformViewRegistryFix platformViewRegistry = PlatformViewRegistryFix();
}

var ui = UniversalUI();

Widget defaultEmbedBuilderWeb(BuildContext context, QuillController controller,
    Embed node, bool readOnly) {
  switch (node.value.type) {
    case 'image':
      final imageUrl = node.value.data;
      final size = MediaQuery.of(context).size;
      UniversalUI().platformViewRegistry.registerViewFactory(
          imageUrl, (viewId) => html.ImageElement()..src = imageUrl);
      return Padding(
        padding: EdgeInsets.only(
          right: ResponsiveWidget.isMediumScreen(context)
              ? size.width * 0.5
              : (ResponsiveWidget.isLargeScreen(context))
                  ? size.width * 0.75
                  : size.width * 0.2,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: HtmlElementView(
            viewType: imageUrl,
          ),
        ),
      );

    default:
      throw UnimplementedError(
        'Embeddable type "${node.value.type}" is not supported by default '
        'embed builder of QuillEditor. You must pass your own builder function '
        'to embedBuilder property of QuillEditor or QuillField widgets.',
      );
  }
}

class CategorieModel {
  final String id;
  String title;

  CategorieModel(this.id,
    this.title,
  );
}