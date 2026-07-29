import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure DiagnosticTestProperties where
  truePositiveRate : ℝ
  falsePositiveRate : ℝ
  trueNegativeRate : ℝ
  falseNegativeRate : ℝ
  prevalence : ℝ

def positivePredictiveValue (D : DiagnosticTestProperties) : ℝ :=
  (D.truePositiveRate * D.prevalence) / (D.truePositiveRate * D.prevalence + D.falsePositiveRate * (1 - D.prevalence))

theorem ppv_between_zero_and_one (D : DiagnosticTestProperties) :
    positivePredictiveValue D ≥ 0 ∧ positivePredictiveValue D ≤ 1 := by
  constructor
  · apply div_nonneg (mul_nonneg (by positivity) (by positivity))
    positivity
  · refine (div_le_one ?_).mpr ?_
    · positivity
    · nlinarith

theorem ppv_increases_with_prevalence (D : DiagnosticTestProperties) :
    D.truePositiveRate > 0 → D.falsePositiveRate > 0 → positivePredictiveValue D ≤ positivePredictiveValue { D with prevalence := D.prevalence * 2 } := by
  intro hTPR hFPR
  unfold positivePredictiveValue
  field_simp
  nlinarith

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse
