// materials/newt.cpp*
#include "materials/newt.h"
#include "interaction.h"
#include "paramset.h"
#include "spectrum.h"
#include "texture.h"
#include "textures/constant.h"

namespace pbrt {

// NewtMaterial Method Definitions
void NewtMaterial::ComputeScatteringFunctions(SurfaceInteraction *si,
                                              MemoryArena &arena,
                                              TransportMode mode,
                                              bool allowMultipleLobes) const {
    // Perform bump mapping with _bumpMap_, if present
    if (bumpMap) Bump(bumpMap, si);

    // opacity and intialize BSDF
    Spectrum op = opacity->Evaluate(*si).Clamp();
    Spectrum t = (-op + Spectrum(1.f)).Clamp();
    if (!t.IsBlack()) {
        si->bsdf = ARENA_ALLOC(arena, BSDF)(*si, 1.f);
        BxDF *tr = ARENA_ALLOC(arena, SpecularTransmission)(t, 1.f, 1.f, mode);
        si->bsdf->Add(tr);
    } else
        si->bsdf = ARENA_ALLOC(arena, BSDF)(*si);

    // diffuse
    Spectrum c = op * color->Evaluate(*si).Clamp();
    Float lum = c.y();
    // normalize lum. to isolate hue+sat
    Spectrum Ctint = lum > 0 ? (c / lum) : Spectrum(1.f);
    BxDF *diff = ARENA_ALLOC(arena, LambertianReflection)(c);
    si->bsdf->Add(diff);


    si->bsdf = ARENA_ALLOC(arena, BSDF)(*si);
    Spectrum d = op * Kd->Evaluate(*si).Clamp();
    Spectrum s = op * Ks->Evaluate(*si).Clamp();
    Float roughu = nu->Evaluate(*si);
    Float roughv = nv->Evaluate(*si);

    if (!d.IsBlack() || !s.IsBlack()) {
        if (remapRoughness) {
            roughu = TrowbridgeReitzDistribution::RoughnessToAlpha(roughu);
            roughv = TrowbridgeReitzDistribution::RoughnessToAlpha(roughv);
        }
        MicrofacetDistribution *distrib =
            ARENA_ALLOC(arena, TrowbridgeReitzDistribution)(roughu, roughv);
        si->bsdf->Add(ARENA_ALLOC(arena, FresnelBlend)(d, s, distrib));
    }
}


NewtMaterial *CreateNewtMaterial(const TextureParams &mp) {
    std::shared_ptr<Texture<Spectrum>> Kd =
        mp.GetSpectrumTexture("Kd", Spectrum(.5f));
    std::shared_ptr<Texture<Spectrum>> Ks =
        mp.GetSpectrumTexture("Ks", Spectrum(.5f));
    std::shared_ptr<Texture<Float>> uroughness =
        mp.GetFloatTexture("uroughness", .1f);
    std::shared_ptr<Texture<Float>> vroughness =
        mp.GetFloatTexture("vroughness", .1f);
    std::shared_ptr<Texture<Float>> bumpMap =
        mp.GetFloatTextureOrNull("bumpmap");
    bool remapRoughness = mp.FindBool("remaproughness", true);
    std::shared_ptr<Texture<Spectrum>> opacity =
        mp.GetSpectrumTexture("opacity", 1.f);
    std::shared_ptr<Texture<Spectrum>> color =
        mp.GetSpectrumTexture("color", Spectrum(0.5f));
    return new NewtMaterial(Kd, Ks, uroughness, vroughness, bumpMap, opacity, color,
                            remapRoughness);
}

}  // namespace pbrt
