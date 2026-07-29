import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure BioequivalenceData where
  aucTest : ℝ
  aucReference : ℝ
  cmaxTest : ℝ
  cmaxReference : ℝ
  geoMeanRatioAuc : ℝ
  geoMeanRatioCmax : ℝ
  logTransformed : Bool

def bioequivalenceCondition (B : BioequivalenceData) : Prop :=
  (0.80 ≤ B.geoMeanRatioAuc ∧ B.geoMeanRatioAuc ≤ 1.25) ∧
  (0.80 ≤ B.geoMeanRatioCmax ∧ B.geoMeanRatioCmax ≤ 1.25)

theorem bioequivalence_satisfied_if_ratios_in_range (B : BioequivalenceData) :
    bioequivalenceCondition B := by
  unfold bioequivalenceCondition
  constructor
  · constructor <;> nlinarith
  · constructor <;> nlinarith

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse
