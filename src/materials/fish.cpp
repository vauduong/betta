// materials/fish.cpp*
#include "materials/fish.h"

#include "interaction.h"
#include "paramset.h"
#include "spectrum.h"
#include "texture.h"
#include "textures/constant.h"

namespace pbrt {

// FishMaterial Method Definitions
void FishMaterial::ComputeScatteringFunctions(SurfaceInteraction *si,
                                              MemoryArena &arena,
                                              TransportMode mode,
                                              bool allowMultipleLobes) const {
    // Perform bump mapping with _bumpMap_, if present
    //    if (bumpMap) Bump(bumpMap, si);

    // opacity and intialize BSDF
    Spectrum op = opacity->Evaluate(*si).Clamp();
    Spectrum t = (-op + Spectrum(1.f)).Clamp();
    if (!t.IsBlack()) {
        si->bsdf = ARENA_ALLOC(arena, BSDF)(*si, 1.f);
        BxDF *tr = ARENA_ALLOC(arena, SpecularTransmission)(t, 1.f, 1.f, mode);
        si->bsdf->Add(tr);
    } else
        si->bsdf = ARENA_ALLOC(arena, BSDF)(*si, eta);

    // diffuse
    Spectrum c = op * color->Evaluate(*si).Clamp();
    Float lum = c.y();
    // normalize lum. to isolate hue+sat
    Spectrum Ctint = lum > 0 ? (c / lum) : Spectrum(1.);
    BxDF *diff = ARENA_ALLOC(arena, LambertianReflection)(c);

    Spectrum D = op * Kd->Evaluate(*si).Clamp();
    Spectrum S = op * Kt->Evaluate(*si).Clamp();
    Float roughu = uRoughness->Evaluate(*si);
    Float roughv = vRoughness->Evaluate(*si);

    if (D.IsBlack() && S.IsBlack()) return;
    if (!D.IsBlack() || !S.IsBlack()) {
        if (remapRoughness) {
            roughu = TrowbridgeReitzDistribution::RoughnessToAlpha(roughu);
            roughv = TrowbridgeReitzDistribution::RoughnessToAlpha(roughv);
        }
        MicrofacetDistribution *distrib =
            ARENA_ALLOC(arena, TrowbridgeReitzDistribution)(roughu, roughv);
        si->bsdf->Add(ARENA_ALLOC(arena, FresnelBlend)(D, S, distrib));
    }
}

FishMaterial *CreateFishMaterial(const TextureParams &mp) {
    Float Kd[3] = {.5, .5, .5};
    std::shared_ptr<Texture<Spectrum>> kd =
        mp.GetSpectrumTexture("Kd", Spectrum::FromRGB(Kd));
    std::shared_ptr<Texture<Spectrum>> mfp =
        mp.GetSpectrumTexture("mfp", Spectrum(1.f));

    Float g = mp.FindFloat("g", 0.0f);
    std::shared_ptr<Texture<Spectrum>> kr =
        mp.GetSpectrumTexture("Kr", Spectrum(1.f));
    std::shared_ptr<Texture<Spectrum>> kt =
        mp.GetSpectrumTexture("Kt", Spectrum(1.f));
    std::shared_ptr<Texture<Float>> roughu =
        mp.GetFloatTexture("uroughness", 0.f);
    std::shared_ptr<Texture<Float>> roughv =
        mp.GetFloatTexture("vroughness", 0.f);
    std::shared_ptr<Texture<Float>> bumpMap =
        mp.GetFloatTextureOrNull("bumpmap");
    std::shared_ptr<Texture<Spectrum>> opacity =
        mp.GetSpectrumTexture("opacity", 1.f);
    std::shared_ptr<Texture<Spectrum>> color =
        mp.GetSpectrumTexture("color", Spectrum(0.5f));
    Float eta = mp.FindFloat("eta", 1.33f);
    Float scale = mp.FindFloat("scale", 1.0f);
    bool remapRoughness = mp.FindBool("remaproughness", true);
    return new FishMaterial(scale, kd, kr, kt, mfp, g, eta, roughu, roughv,
                            bumpMap, opacity, color, remapRoughness);
}

}  // namespace pbrt
