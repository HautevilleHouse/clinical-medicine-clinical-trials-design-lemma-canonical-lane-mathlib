import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ

structure DiagnosticTestEvidence (D : DiagnosticTest) where
  sensitivityInUnitInterval : 0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1
  specificityInUnitInterval : 0 ≤ D.specificity ∧ D.specificity ≤ 1
  prevalenceInUnitInterval : 0 ≤ D.prevalence ∧ D.prevalence ≤ 1
  ppvDerived : D.positivePredictiveValue =
    (D.sensitivity * D.prevalence) / (D.sensitivity * D.prevalence + (1 - D.specificity) * (1 - D.prevalence))
  npvDerived : D.negativePredictiveValue =
    (D.specificity * (1 - D.prevalence)) / ((1 - D.sensitivity) * D.prevalence + D.specificity * (1 - D.prevalence))

def DiagnosticTestClosed (D : DiagnosticTest) : Prop :=
  0 ≤ D.sensitivity ∧ D.sensitivity ≤ 1 ∧
  0 ≤ D.specificity ∧ D.specificity ≤ 1 ∧
  0 ≤ D.prevalence ∧ D.prevalence ≤ 1 ∧
  D.positivePredictiveValue =
    (D.sensitivity * D.prevalence) / (D.sensitivity * D.prevalence + (1 - D.specificity) * (1 - D.prevalence)) ∧
  D.negativePredictiveValue =
    (D.specificity * (1 - D.prevalence)) / ((1 - D.sensitivity) * D.prevalence + D.specificity * (1 - D.prevalence))

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTest) (E : DiagnosticTestEvidence D) :
    DiagnosticTestClosed D := by
  rcases E with ⟨⟨sensLow, sensHigh⟩, ⟨specLow, specHigh⟩, ⟨prevLow, prevHigh⟩, ppvEq, npvEq⟩
  exact ⟨sensLow, sensHigh, specLow, specHigh, prevLow, prevHigh, ppvEq, npvEq⟩

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse