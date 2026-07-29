import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure ClinicalTrialDesign where
  randomization : Prop
  blinding : Prop
  controlGroup : Prop
  sampleSize : Prop
  endpointDefinition : Prop
  randomizationTerm : randomization
  blindingTerm : blinding
  controlGroupTerm : controlGroup
  sampleSizeTerm : sampleSize
  endpointDefinitionTerm : endpointDefinition

structure ClinicalTrialDesignEvidence (C : ClinicalTrialDesign) where
  randomizationClosed : C.randomization
  blindingClosed : C.blinding
  controlGroupClosed : C.controlGroup
  sampleSizeClosed : C.sampleSize
  endpointDefinitionClosed : C.endpointDefinition

def ClinicalTrialDesignClosed (C : ClinicalTrialDesign) : Prop :=
  C.randomization ∧ C.blinding ∧ C.controlGroup ∧
  C.sampleSize ∧ C.endpointDefinition

theorem clinical_trial_design_closed_from_evidence (C : ClinicalTrialDesign)
    (E : ClinicalTrialDesignEvidence C) : ClinicalTrialDesignClosed C := by
  exact And.intro E.randomizationClosed
    (And.intro E.blindingClosed
      (And.intro E.controlGroupClosed
        (And.intro E.sampleSizeClosed E.endpointDefinitionClosed)))

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse
