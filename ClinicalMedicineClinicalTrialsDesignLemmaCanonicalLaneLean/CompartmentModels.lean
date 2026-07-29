import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure CompartmentModelPackage where
  centralCompartment : Type u
  peripheralCompartment : Type v
  rateConstants : Type w
  initialConditions : Prop
  differentialEquations : Prop
  solutionFamily : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  initialConditionsClosed : C.initialConditions
  differentialEquationsClosed : C.differentialEquations
  solutionFamilyClosed : C.solutionFamily

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.initialConditions ∧ C.differentialEquations ∧ C.solutionFamily

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.initialConditionsClosed
    (And.intro E.differentialEquationsClosed E.solutionFamilyClosed)

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse