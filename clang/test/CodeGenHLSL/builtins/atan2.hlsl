// RUN: %clang_cc1 -finclude-default-header -x hlsl -triple \
// RUN:   dxil-pc-shadermodel6.3-library %s -fnative-half-type \
// RUN:   -emit-llvm -disable-llvm-passes -o - | FileCheck %s \
// RUN:   --check-prefixes=CHECK,DXIL_CHECK,DXIL_NATIVE_HALF,NATIVE_HALF
// RUN: %clang_cc1 -finclude-default-header -x hlsl -triple \
// RUN:   dxil-pc-shadermodel6.3-library %s -emit-llvm -disable-llvm-passes \
// RUN:   -o - | FileCheck %s --check-prefixes=CHECK,DXIL_CHECK,NO_HALF,DXIL_NO_HALF
// RUN: %clang_cc1 -finclude-default-header -x hlsl -triple \
// RUN:   spirv-unknown-vulkan-compute %s -fnative-half-type \
// RUN:   -emit-llvm -disable-llvm-passes -o - | FileCheck %s \
// RUN:   --check-prefixes=CHECK,SPIR_CHECK,NATIVE_HALF,SPIR_NATIVE_HALF
// RUN: %clang_cc1 -finclude-default-header -x hlsl -triple \
// RUN:   spirv-unknown-vulkan-compute %s -emit-llvm -disable-llvm-passes \
// RUN:   -o - | FileCheck %s --check-prefixes=CHECK,SPIR_CHECK,NO_HALF,SPIR_NO_HALF

// DXIL_NATIVE_HALF: define noundef half @
// SPIR_NATIVE_HALF: define spir_func noundef half @
// DXIL_NATIVE_HALF: %hlsl.atan2 = call half @llvm.dx.atan2.f16(
// SPIR_NATIVE_HALF: %hlsl.atan2 = call half @llvm.spv.atan2.f16(
// NATIVE_HALF: ret half %hlsl.atan2
// DXIL_NO_HALF: define noundef float @
// SPIR_NO_HALF: define spir_func noundef float @
// DXIL_NO_HALF: %hlsl.atan2 = call float @llvm.dx.atan2.f32(
// SPIR_NO_HALF: %hlsl.atan2 = call float @llvm.spv.atan2.f32(
// NO_HALF: ret float %hlsl.atan2
half test_atan2_half(half p0, half p1) { return atan2(p0, p1); }
// DXIL_NATIVE_HALF: define noundef <2 x half> @
// SPIR_NATIVE_HALF: define spir_func noundef <2 x half> @
// DXIL_NATIVE_HALF: %hlsl.atan2 = call <2 x half> @llvm.dx.atan2.v2f16(
// SPIR_NATIVE_HALF: %hlsl.atan2 = call <2 x half> @llvm.spv.atan2.v2f16(
// NATIVE_HALF: ret <2 x half> %hlsl.atan2
// DXIL_NO_HALF: define noundef <2 x float> @
// SPIR_NO_HALF: define spir_func noundef <2 x float> @
// DXIL_NO_HALF: %hlsl.atan2 = call <2 x float> @llvm.dx.atan2.v2f32(
// SPIR_NO_HALF: %hlsl.atan2 = call <2 x float> @llvm.spv.atan2.v2f32(
// NO_HALF: ret <2 x float> %hlsl.atan2
half2 test_atan2_half2(half2 p0, half2 p1) { return atan2(p0, p1); }
// DXIL_NATIVE_HALF: define noundef <3 x half> @
// SPIR_NATIVE_HALF: define spir_func noundef <3 x half> @
// DXIL_NATIVE_HALF: %hlsl.atan2 = call <3 x half> @llvm.dx.atan2.v3f16(
// SPIR_NATIVE_HALF: %hlsl.atan2 = call <3 x half> @llvm.spv.atan2.v3f16(
// NATIVE_HALF: ret <3 x half> %hlsl.atan2
// DXIL_NO_HALF: define noundef <3 x float> @
// SPIR_NO_HALF: define spir_func noundef <3 x float> @
// DXIL_NO_HALF: %hlsl.atan2 = call <3 x float> @llvm.dx.atan2.v3f32(
// SPIR_NO_HALF: %hlsl.atan2 = call <3 x float> @llvm.spv.atan2.v3f32(
// NO_HALF: ret <3 x float> %hlsl.atan2
half3 test_atan2_half3(half3 p0, half3 p1) { return atan2(p0, p1); }
// DXIL_NATIVE_HALF: define noundef <4 x half> @
// SPIR_NATIVE_HALF: define spir_func noundef <4 x half> @
// DXIL_NATIVE_HALF: %hlsl.atan2 = call <4 x half> @llvm.dx.atan2.v4f16(
// SPIR_NATIVE_HALF: %hlsl.atan2 = call <4 x half> @llvm.spv.atan2.v4f16(
// NATIVE_HALF: ret <4 x half> %hlsl.atan2
// DXIL_NO_HALF: define noundef <4 x float> @
// SPIR_NO_HALF: define spir_func noundef <4 x float> @
// DXIL_NO_HALF: %hlsl.atan2 = call <4 x float> @llvm.dx.atan2.v4f32(
// SPIR_NO_HALF: %hlsl.atan2 = call <4 x float> @llvm.spv.atan2.v4f32(
// NO_HALF: ret <4 x float> %hlsl.atan2
half4 test_atan2_half4(half4 p0, half4 p1) { return atan2(p0, p1); }

// DXIL_CHECK: define noundef float @
// SPIR_CHECK: define spir_func noundef float @
// DXIL_CHECK: %hlsl.atan2 = call float @llvm.dx.atan2.f32(
// SPIR_CHECK: %hlsl.atan2 = call float @llvm.spv.atan2.f32(
// CHECK: ret float %hlsl.atan2
float test_atan2_float(float p0, float p1) { return atan2(p0, p1); }
// DXIL_CHECK: define noundef <2 x float> @
// SPIR_CHECK: define spir_func noundef <2 x float> @
// DXIL_CHECK: %hlsl.atan2 = call <2 x float> @llvm.dx.atan2.v2f32
// SPIR_CHECK: %hlsl.atan2 = call <2 x float> @llvm.spv.atan2.v2f32
// CHECK: ret <2 x float> %hlsl.atan2
float2 test_atan2_float2(float2 p0, float2 p1) { return atan2(p0, p1); }
// DXIL_CHECK: define noundef <3 x float> @
// SPIR_CHECK: define spir_func noundef <3 x float> @
// DXIL_CHECK: %hlsl.atan2 = call <3 x float> @llvm.dx.atan2.v3f32
// SPIR_CHECK: %hlsl.atan2 = call <3 x float> @llvm.spv.atan2.v3f32
// CHECK: ret <3 x float> %hlsl.atan2
float3 test_atan2_float3(float3 p0, float3 p1) { return atan2(p0, p1); }
// DXIL_CHECK: define noundef <4 x float> @
// SPIR_CHECK: define spir_func noundef <4 x float> @
// DXIL_CHECK: %hlsl.atan2 = call <4 x float> @llvm.dx.atan2.v4f32
// SPIR_CHECK: %hlsl.atan2 = call <4 x float> @llvm.spv.atan2.v4f32
// CHECK: ret <4 x float> %hlsl.atan2
float4 test_atan2_float4(float4 p0, float4 p1) { return atan2(p0, p1); }
