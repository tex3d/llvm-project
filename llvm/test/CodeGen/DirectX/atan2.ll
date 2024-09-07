; RUN: opt -S -dxil-op-lower -mtriple=dxil-pc-shadermodel6.3-library %s | FileCheck %s

; Make sure correct dxil expansions for atan2 are generated for float and half.

define noundef float @atan2_float(float noundef %a, float noundef %b) {
entry:
; CHECK:call float @dx.op.unary.f32(i32 17, float %{{.*}})
  %elt.atan2 = call float @llvm.atan2.f32(float %a, float %b)
  ret float %elt.atan2
}

define noundef half @atan2_half(half noundef %a, float noundef %b) {
entry:
; CHECK:call half @dx.op.unary.f16(i32 17, half %{{.*}})
  %elt.atan2 = call half @llvm.atan.f16(half %a, half %b)
  ret half %elt.atan2
}

declare half @llvm.atan2.f16(half)
declare float @llvm.atan2.f32(float)
