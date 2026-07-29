import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure DiagnosticInferenceModelPackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatio : Prop

structure DiagnosticInferenceModelEvidence (D : DiagnosticInferenceModelPackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  likelihoodRatioClosed : D.likelihoodRatio

def DiagnosticInferenceModelClosed (D : DiagnosticInferenceModelPackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧ D.negativePredictiveValue ∧ D.likelihoodRatio

theorem diagnostic_inference_model_closed_from_evidence
    (D : DiagnosticInferenceModelPackage)
    (E : DiagnosticInferenceModelEvidence D) : DiagnosticInferenceModelClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed E.likelihoodRatioClosed)))

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse