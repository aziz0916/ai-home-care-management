import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'create_record_page_widget.dart' show CreateRecordPageWidget;
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRecordPageModel extends FlutterFlowModel<CreateRecordPageWidget> {
  ///  Local state fields for this page.

  DateTime? selectedServiceDate;

  bool isSavingRecord = false;

  ///  State fields for stateful widgets in this page.

  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // State field(s) for ddClient widget.
  int? ddClientValue;
  FormFieldController<int>? ddClientValueController;
  // State field(s) for ddServiceType widget.
  String? ddServiceTypeValue;
  FormFieldController<String>? ddServiceTypeValueController;
  DateTime? datePicked;
  // State field(s) for txtServiceMinutes widget.
  FocusNode? txtServiceMinutesFocusNode;
  TextEditingController? txtServiceMinutesTextController;
  String? Function(BuildContext, String?)?
      txtServiceMinutesTextControllerValidator;
  // State field(s) for txtNotes widget.
  FocusNode? txtNotesFocusNode;
  TextEditingController? txtNotesTextController;
  String? Function(BuildContext, String?)? txtNotesTextControllerValidator;
  // State field(s) for swFall widget.
  bool? swFallValue;
  // State field(s) for txtAbnormalDescription widget.
  FocusNode? txtAbnormalDescriptionFocusNode;
  TextEditingController? txtAbnormalDescriptionTextController;
  String? Function(BuildContext, String?)?
      txtAbnormalDescriptionTextControllerValidator;
  // Stores action output result for [Backend Call - API (CreateServiceRecord)] action in btnSaveRecord widget.
  ApiCallResponse? apiResultt2s;

  /// Query cache managers for this widget.

  final _createRecordClientsCacheManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> createRecordClientsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _createRecordClientsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCreateRecordClientsCacheCache() =>
      _createRecordClientsCacheManager.clear();
  void clearCreateRecordClientsCacheCacheKey(String? uniqueKey) =>
      _createRecordClientsCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtServiceMinutesFocusNode?.dispose();
    txtServiceMinutesTextController?.dispose();

    txtNotesFocusNode?.dispose();
    txtNotesTextController?.dispose();

    txtAbnormalDescriptionFocusNode?.dispose();
    txtAbnormalDescriptionTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearCreateRecordClientsCacheCache();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
