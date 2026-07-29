import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure DoseResponseModelPackage where
  doseLevels : Type u
  responseCurve : Type v
  sigmoidShape : Prop
  maximalEffect : Prop
  hillCoefficient : Prop

structure DoseResponseModelEvidence (D : DoseResponseModelPackage) where
  sigmoidShapeClosed : D.sigmoidShape
  maximalEffectClosed : D.maximalEffect
  hillCoefficientClosed : D.hillCoefficient

def DoseResponseModelClosed (D : DoseResponseModelPackage) : Prop :=
  D.sigmoidShape ∧ D.maximalEffect ∧ D.hillCoefficient

theorem dose_response_model_closed_from_evidence (D : DoseResponseModelPackage)
    (E : DoseResponseModelEvidence D) : DoseResponseModelClosed D := by
  exact And.intro E.sigmoidShapeClosed
    (And.intro E.maximalEffectClosed E.hillCoefficientClosed)

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse