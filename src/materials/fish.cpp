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
/*
    // opacity and intialize BSDF
    Spectrum op = opacity->Evaluate(*si).Clamp();
    Spectrum t = (-op + Spectrum(1.f)).Clamp();
    if (!t.IsBlack()) {
        si->bsdf = ARENA_ALLOC(arena, BSDF)(*si, 1.f);
        BxDF *tr = ARENA_ALLOC(arena, SpecularTransmission)(t, 1.f, 1.f, mode);
        si->bsdf->Add(tr);
    } else
        si->bsdf = ARENA_ALLOC(arena, BSDF)(*si, eta);

    Spectrum R = Kr->Evaluate(*si).Clamp();
    Spectrum T = Kt->Evaluate(*si).Clamp();
    Float urough = uRoughness->Evaluate(*si);
    Float vrough = vRoughness->Evaluate(*si);

    // diffuse
    Spectrum c = op * color->Evaluate(*si).Clamp();
    Float lum = c.y();
    // normalize lum. to isolate hue+sat
    Spectrum Ctint = lum > 0 ? (c / lum) : Spectrum(1.);
    BxDF *diff = ARENA_ALLOC(arena, LambertianReflection)(c);
    // si->bsdf->Add(diff);
    si->bsdf = ARENA_ALLOC(arena, BSDF)(*si, eta);
*/


/*
    if (R.IsBlack() && T.IsBlack()) return;

    bool isSpecular = urough == 0 && vrough == 0;
    if (isSpecular && allowMultipleLobes) {
        si->bsdf->Add(
            ARENA_ALLOC(arena, FresnelSpecular)(R, T, 1.f, eta, mode));
    } else {
        if (remapRoughness) {
            urough = TrowbridgeReitzDistribution::RoughnessToAlpha(urough);
            vrough = TrowbridgeReitzDistribution::RoughnessToAlpha(vrough);
        }
        MicrofacetDistribution *distrib =
            isSpecular ? nullptr
                       : ARENA_ALLOC(arena, TrowbridgeReitzDistribution)(
                             urough, vrough);
        if (!R.IsBlack()) {
            Fresnel *fresnel = ARENA_ALLOC(arena, FresnelDielectric)(1.f, eta);
            if (isSpecular)
                si->bsdf->Add(
                    ARENA_ALLOC(arena, SpecularReflection)(R, fresnel));
            else
                si->bsdf->Add(ARENA_ALLOC(arena, MicrofacetReflection)(
                    R, distrib, fresnel));
        }
        if (!T.IsBlack()) {
            if (isSpecular)
                si->bsdf->Add(ARENA_ALLOC(arena, SpecularTransmission)(
                    T, 1.f, eta, mode));
            else
                si->bsdf->Add(ARENA_ALLOC(arena, MicrofacetTransmission)(
                    T, distrib, 1.f, eta, mode));
        }
    }
*/
/*
    Spectrum sig_a = scale * sigma_a->Evaluate(*si).Clamp();
    Spectrum sig_s = scale * sigma_s->Evaluate(*si).Clamp();
    si->bssrdf = ARENA_ALLOC(arena, TabulatedBSSRDF)(*si, this, mode, eta,
                                                     sig_a, sig_s, table);


*/
}

FishMaterial *CreateFishMaterial(const TextureParams &mp) {
    Float Kd[3] = {1, 1, 1};
    Float sig_a_rgb[3] = {.0014f, .0025f, .0142f}, //skim milk values
          sig_s_rgb[3] = {.70f, 1.22f, 1.90f};
    Spectrum sig_a = Spectrum::FromRGB(sig_a_rgb),
             sig_s = Spectrum::FromRGB(sig_s_rgb);
    std::string name = mp.FindString("name");
    bool found = GetMediumScatteringProperties(name, &sig_a, &sig_s);
    Float g = mp.FindFloat("g", 0.0f);
    if (name != "") {
        if (!found)
            Warning("Named material \"%s\" not found.  Using defaults.",
                    name.c_str());
        else
            g = 0; /* Enforce g=0 (the database specifies reduced scattering
                      coefficients) */
    }

    std::shared_ptr<Texture<Spectrum>> sigma_a, sigma_s;
    sigma_a = mp.GetSpectrumTexture("sigma_a", sig_a);
    sigma_s = mp.GetSpectrumTexture("sigma_s", sig_s);
    std::shared_ptr<Texture<Spectrum>> kd =
        mp.GetSpectrumTexture("Kd", Spectrum::FromRGB(Kd));
    std::shared_ptr<Texture<Spectrum>> mfp =
        mp.GetSpectrumTexture("mfp", Spectrum(1.f));
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
    return new FishMaterial(scale, sigma_a, sigma_s, kd, kr, kt, mfp, g, eta,
                            roughu, roughv, bumpMap, opacity, color,
                            remapRoughness);
}

}  // namespace pbrt
