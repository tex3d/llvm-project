// RUN: %clang_cc1 -finclude-default-header -triple dxil-pc-shadermodel6.6-library %s -fnative-half-type -emit-llvm-only -disable-llvm-passes -verify -verify-ignore-unexpected

float2 test_no_second_arg(float2 p0) {
  return __builtin_hlsl_atan2(p0);
  // expected-error@-1 {{too few arguments to function call, expected 2, have 1}}
}

float2 test_too_many_arg(float2 p0) {
  return __builtin_hlsl_atan2(p0, p0, p0);
  // expected-error@-1 {{too many arguments to function call, expected 2, have 3}}
}

float2 test_atan2_no_second_arg(float2 p0) {
  return atan2(p0);
  // expected-error@-1 {{no matching function for call to 'atan2'}}
}

float2 test_atan2_vector_size_mismatch(float3 p0, float2 p1) {
  return atan2(p0, p1);
  // expected-warning@-1 {{implicit conversion truncates vector: 'float3' (aka 'vector<float, 3>') to 'vector<float, 2>' (vector of 2 'float' values)}}
}

float2 test_atan2_builtin_vector_size_mismatch(float3 p0, float2 p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{all arguments to '__builtin_hlsl_atan2' must have the same type}}
}

float test_atan2_scalar_mismatch(float p0, half p1) {
  return atan2(p1, p0);
  // expected-error@-1 {{call to 'atan2' is ambiguous}}
}

float2 test_atan2_element_type_mismatch(half2 p0, float2 p1) {
  return atan2(p1, p0);
  // expected-error@-1 {{call to 'atan2' is ambiguous}}
}

float2 test_builtin_atan2_float2_splat(float p0, float2 p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{all arguments to '__builtin_hlsl_atan2' must be vectors}}
}

float3 test_builtin_atan2_float3_splat(float p0, float3 p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{all arguments to '__builtin_hlsl_atan2' must be vectors}}
}

float4 test_builtin_atan2_float4_splat(float p0, float4 p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{all arguments to '__builtin_hlsl_atan2' must be vectors}}
}

float2 test_atan2_float2_int_splat(float2 p0, int p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{all arguments to '__builtin_hlsl_atan2' must be vectors}}
}

float3 test_atan2_float3_int_splat(float3 p0, int p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{all arguments to '__builtin_hlsl_atan2' must be vectors}}
}

float2 test_builtin_atan2_int_vect_to_float_vec_promotion(int2 p0, float p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{all arguments to '__builtin_hlsl_atan2' must be vectors}}
}

float builtin_bool_to_float_type_promotion(float p0, bool p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{2nd argument must be a floating point type (was 'bool')}}
}

float builtin_atan2_int_to_float_promotion(float p0, int p1) {
  return __builtin_hlsl_atan2(p0, p1);
  // expected-error@-1 {{2nd argument must be a floating point type (was 'int')}}
}
