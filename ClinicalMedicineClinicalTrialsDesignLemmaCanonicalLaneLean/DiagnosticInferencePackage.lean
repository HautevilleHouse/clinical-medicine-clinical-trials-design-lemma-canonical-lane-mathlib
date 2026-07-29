import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatios : Prop

structure DiagnosticTestEvidence (D : DiagnosticTestPackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  likelihoodRatiosClosed : D.likelihoodRatios

def DiagnosticTestClosed (D : DiagnosticTestPackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧
  D.negativePredictiveValue ∧ D.likelihoodRatios

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestPackage)
    (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed E.likelihoodRatiosClosed)))

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse