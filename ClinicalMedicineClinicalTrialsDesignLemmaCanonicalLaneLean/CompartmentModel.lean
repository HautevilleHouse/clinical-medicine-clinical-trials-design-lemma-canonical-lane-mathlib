import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  numberCompartments : Nat
  rateConstants : List ℚ
  initialConditions : List ℚ
  solution : ℕ → ℚ → ℚ
  wellMixedAssumption : Prop
  linearity : Prop
  identifiability : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  wellMixedAssumptionClosed : C.wellMixedAssumption
  linearityClosed : C.linearity
  identifiabilityClosed : C.identifiability

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.wellMixedAssumption ∧ C.linearity ∧ C.identifiability

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.wellMixedAssumptionClosed (And.intro E.linearityClosed E.identifiabilityClosed)

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse