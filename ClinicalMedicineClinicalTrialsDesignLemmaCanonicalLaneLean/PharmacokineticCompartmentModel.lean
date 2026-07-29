import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure PharmacokineticCompartmentModel where
  centralVolume : ℝ
  peripheralVolume : ℝ
  clearance : ℝ
  intercompartmentClearance : ℝ
  absorptionRate : ℝ
  dose : ℝ
  initialCompartmentConcentration : ℝ
  initialPeripheralConcentration : ℝ
  modelType : String -- "oneCompartment" or "twoCompartment"
  absorptionType : String -- "bolus" or "firstOrder"

def PharmacokineticSteadyState (PK : PharmacokineticCompartmentModel) : Prop :=
  PK.dose > 0 ∧ PK.clearance > 0

theorem peak_concentration_after_dose (PK : PharmacokineticCompartmentModel) :
    PK.dose > 0 → PK.initialCompartmentConcentration > 0 := by
  intro hDose
  exact hDose

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse
