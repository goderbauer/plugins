// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

const _channel = const MethodChannel('plugins.flutter.io/path_provider');

  /// Path to the temporary directory on the device.
  ///
  /// Files in this directory may be cleared at any time. This does *not* return
  /// a new temporary directory. Instead, the caller is responsible for creating
  /// (and cleaning up) files or directories within this directory. This
  /// directory is scoped to the calling application.
  ///
  /// On iOS, this uses the `NSTemporaryDirectory` API.
  ///
  /// On Android, this uses the `getCacheDir` API on the context.
  Future<Directory> getTemporaryDirectory() async {
    final String path = await _channel.invokeMethod('getTemporaryDirectory');
    if (path == null)
      return null;
    return new Directory(path);
  }

  /// Path to a directory where the application may place files that are private
  /// to the application and will only be cleared when the application itself
  /// is deleted.
  ///
  /// On iOS, this uses the `NSDocumentsDirectory` API.
  ///
  /// On Android, this returns the AppData directory.
  Future<Directory> getApplicationDocumentsDirectory() async {
    final String path = await _channel.invokeMethod(
        'getApplicationDocumentsDirectory');
    if (path == null)
      return null;
    return new Directory(path);
  }
