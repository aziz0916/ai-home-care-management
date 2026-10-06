import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/flutter_flow/ff_builtin_enums.dart';

String? getAlertStatusText(dynamic recordItem) {
  final data = recordItem is String ? jsonDecode(recordItem) : recordItem;

  if (data is! Map) return '通知狀態未記錄';

  if (data['alert_sent'] == true) return '通知已發送';

  final hasFall = data['fall'] == true;
  final hasAbnormal =
      (data['abnormal_description'] ?? '').toString().trim().isNotEmpty;

  if (!hasFall && !hasAbnormal) {
    return '無異常，無需通知';
  }

  return '尚未確認通知已發送';
}
