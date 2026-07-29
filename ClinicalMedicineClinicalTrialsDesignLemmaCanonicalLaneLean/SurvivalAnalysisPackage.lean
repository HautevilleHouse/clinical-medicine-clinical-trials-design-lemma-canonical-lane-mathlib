import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : Prop
  survivalFunction : Prop
  censoringMechanism : Prop
  proportionalHazards : Prop
  kaplanMeierEstimate : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : S.hazardFunction
  survivalFunctionClosed : S.survivalFunction
  censoringMechanismClosed : S.censoringMechanism
  proportionalHazardsClosed : S.proportionalHazards
  kaplanMeierEstimateClosed : S.kaplanMeierEstimate

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.hazardFunction ∧ S.survivalFunction ∧ S.censoringMechanism ∧
  S.proportionalHazards ∧ S.kaplanMeierEstimate

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalFunctionClosed
      (And.intro E.censoringMechanismClosed
        (And.intro E.proportionalHazardsClosed E.kaplanMeierEstimateClosed)))

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse