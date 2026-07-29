import ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure PharmacokineticModelPackage (C : CompartmentModelPackage) where
  absorptionRate : ℚ
  eliminationRate : ℚ
  volumeDistribution : ℚ
  clearance : ℚ
  doseRegimen : ℚ → ℚ
  concentrationCurve : ℚ → ℚ
  firstOrderKinetics : Prop
  linearSuperposition : Prop
  steadyStateReached : Prop

structure PharmacokineticModelEvidence {C : CompartmentModelPackage} (P : PharmacokineticModelPackage C) where
  firstOrderKineticsClosed : P.firstOrderKinetics
  linearSuperpositionClosed : P.linearSuperposition
  steadyStateReachedClosed : P.steadyStateReached

def PharmacokineticModelClosed {C : CompartmentModelPackage} (P : PharmacokineticModelPackage C) : Prop :=
  P.firstOrderKinetics ∧ P.linearSuperposition ∧ P.steadyStateReached

theorem pharmacokinetic_model_closed_from_evidence {C : CompartmentModelPackage} (P : PharmacokineticModelPackage C) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact And.intro E.firstOrderKineticsClosed (And.intro E.linearSuperpositionClosed E.steadyStateReachedClosed)

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse