//
//  Generated code. Do not modify.
//  source: channel_control.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'channel_control.pb.dart' as $0;

export 'channel_control.pb.dart';

@$pb.GrpcServiceName('ChannelControl')
class ChannelControlClient extends $grpc.Client {
  static final _$setValue = $grpc.ClientMethod<$0.ControlValue, $0.ControlValue>(
      '/ChannelControl/SetValue',
      ($0.ControlValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ControlValue.fromBuffer(value));

  ChannelControlClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ControlValue> setValue($0.ControlValue request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setValue, request, options: options);
  }
}

@$pb.GrpcServiceName('ChannelControl')
abstract class ChannelControlServiceBase extends $grpc.Service {
  $core.String get $name => 'ChannelControl';

  ChannelControlServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ControlValue, $0.ControlValue>(
        'SetValue',
        setValue_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ControlValue.fromBuffer(value),
        ($0.ControlValue value) => value.writeToBuffer()));
  }

  $async.Future<$0.ControlValue> setValue_Pre($grpc.ServiceCall call, $async.Future<$0.ControlValue> request) async {
    return setValue(call, await request);
  }

  $async.Future<$0.ControlValue> setValue($grpc.ServiceCall call, $0.ControlValue request);
}
