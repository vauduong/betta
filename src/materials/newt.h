#if defined(_MSC_VER)
#define NOMINMAX
#pragma once
#endif

#ifndef PBRT_MATERIALS_NEWT_H
#define PBRT_MATERIALS_NEWT_H

// materials/fish.h*
#include "material.h"
#include "pbrt.h"
#include "reflection.h"

namespace pbrt {

// Newt Material Declarations
class NewtMaterial : public Material {
  public:
    // NewtMaterial Public Methods
    NewtMaterial(const std::shared_ptr<Texture<Spectrum>> &Kd,
                 const std::shared_ptr<Texture<Spectrum>> &Ks,
                 const std::shared_ptr<Texture<Float>> &nu,
                 const std::shared_ptr<Texture<Float>> &nv,
                 const std::shared_ptr<Texture<Float>> &bumpMap,

                 const std::shared_ptr<Texture<Spectrum>> &opacity,
                 const std::shared_ptr<Texture<Spectrum>> &color,
                 bool remapRoughness)
        : Kd(Kd),
          Ks(Ks),
          nu(nu),
          nv(nv),
          bumpMap(bumpMap),
          opacity(opacity),
          color(color),
          remapRoughness(remapRoughness) {}
    void ComputeScatteringFunctions(SurfaceInteraction *si, MemoryArena &arena,
                                    TransportMode mode,
                                    bool allowMultipleLobes) const;

  private:
    // NewtMaterial Private Data
    Float scale;
    std::shared_ptr<Texture<Spectrum>> Kd, Ks, color, opacity;
    std::shared_ptr<Texture<Float>> nu, nv;
    std::shared_ptr<Texture<Float>> bumpMap;
    bool remapRoughness;
};

NewtMaterial *CreateNewtMaterial(const TextureParams &mp);

}  // namespace pbrt

#endif  // PBRT_MATERIALS_NEWT_H
