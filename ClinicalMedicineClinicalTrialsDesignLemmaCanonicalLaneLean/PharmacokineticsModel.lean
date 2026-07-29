import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure PharmacokineticsModel where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  doseRegimen : Prop
  plasmaConcentration : Prop
  absorptionRateTerm : absorptionRate
  distributionVolumeTerm : distributionVolume
  eliminationRateTerm : eliminationRate
  doseRegimenTerm : doseRegimen
  plasmaConcentrationTerm : plasmaConcentration

structure PharmacokineticsModelEvidence (P : PharmacokineticsModel) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  doseRegimenClosed : P.doseRegimen
  plasmaConcentrationClosed : P.plasmaConcentration

def PharmacokineticsModelClosed (P : PharmacokineticsModel) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧
  P.doseRegimen ∧ P.plasmaConcentration

theorem pharmacokinetics_model_closed_from_evidence (P : PharmacokineticsModel)
    (E : PharmacokineticsModelEvidence P) : PharmacokineticsModelClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.doseRegimenClosed E.plasmaConcentrationClosed)))

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse
