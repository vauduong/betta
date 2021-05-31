#if defined(_MSC_VER)
#define NOMINMAX
#pragma once
#endif

#ifndef PBRT_MATERIALS_FISH_H
#define PBRT_MATERIALS_FISH_H

// materials/fish.h*
#include "bssrdf.h"
#include "material.h"
#include "pbrt.h"
#include "reflection.h"

namespace pbrt {

// FishMaterial Declarations
class FishMaterial : public Material {
  public:
    // FishMaterial Public Methods
    FishMaterial(Float scale, const std::shared_ptr<Texture<Spectrum>> &Kd,
                 const std::shared_ptr<Texture<Spectrum>> &Kr,
                 const std::shared_ptr<Texture<Spectrum>> &Kt,
                 const std::shared_ptr<Texture<Spectrum>> &mfp, Float g,
                 Float eta, const std::shared_ptr<Texture<Float>> &uRoughness,
                 const std::shared_ptr<Texture<Float>> &vRoughness,
                 const std::shared_ptr<Texture<Float>> &bumpMap,

                 const std::shared_ptr<Texture<Spectrum>> &opacity,
                 const std::shared_ptr<Texture<Spectrum>> &color,
                 bool remapRoughness)
        : scale(scale),
          Kd(Kd),
          Kr(Kr),
          Kt(Kt),
          mfp(mfp),
          uRoughness(uRoughness),
          vRoughness(vRoughness),
          bumpMap(bumpMap),
          opacity(opacity),
          color(color),
          eta(eta),
          remapRoughness(remapRoughness),
          table(100, 64) {
        ComputeBeamDiffusionBSSRDF(g, eta, &table);
    }
    void ComputeScatteringFunctions(SurfaceInteraction *si, MemoryArena &arena,
                                    TransportMode mode,
                                    bool allowMultipleLobes) const;

  private:
    // FishMaterial Private Data
    Float scale;
    std::shared_ptr<Texture<Spectrum>> Kd, Kr, Kt, mfp, color, opacity;
    std::shared_ptr<Texture<Float>> uRoughness, vRoughness;
    std::shared_ptr<Texture<Float>> bumpMap;
    Float eta;
    bool remapRoughness;
    BSSRDFTable table;
};

FishMaterial *CreateFishMaterial(const TextureParams &mp);

}  // namespace pbrt

#endif  // PBRT_MATERIALS_FISH_H
