
const String stub = """
import '/core/presentation/widgets/common_app_bar_widget.dart';
import '/core/presentation/widgets/common_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/core/constants/app_constants.dart';
import 'logic/{ModuleName}_cubit.dart';
import 'logic/{ModuleName}_states.dart';

class {Module}ListScreen extends StatefulWidget {
  const {Module}ListScreen({Key? key}) : super(key: key);

  @override
  State<{Module}ListScreen> createState() => _{Module}ListScreenState();
}

class _{Module}ListScreenState extends State<{Module}ListScreen> {
  late {Module}Cubit {ModuleName}Cubit;

  @override
  void initState() {
    super.initState();
    {ModuleName}Cubit = {Module}Cubit.get(context);
    {ModuleName}Cubit.get{Module}List();
    {ModuleName}Cubit.scrollController = ScrollController();
    {ModuleName}Cubit.scrollController.addListener(
      () {
        {ModuleName}Cubit.setupScrollController();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///todo:add title of your screen
      appBar: CommonAppBar(
        centerTitle: true,
        withBack: false,
        titleWidget: CommonTitleText(
          textKey:"{Module}",
          textColor: AppConstants.lightBlackColor,
          textWeight: FontWeight.w700,
          textFontSize: AppConstants.fontSize16,
        ),
      ),
      body: BlocConsumer<{Module}Cubit, {Module}States>(
          listener: ({ModuleName}Ctx, {ModuleName}State) {}, 
           builder: ({ModuleName}Ctx, {ModuleName}State) {
           ///todo:add your ui screen here
           return Center(
                   child: Text(
                    "write ui here",
                   ),
                  );
      }),
    );
  }
}
""";
