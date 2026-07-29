import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure SurvivalAnalysisModelPackage where
  hazardFunction : Type u
  survivalFunction : Type v
  kaplanMeierEstimator : Prop
  coxProportionalHazards : Prop
  logRankTest : Prop

structure SurvivalAnalysisModelEvidence (S : SurvivalAnalysisModelPackage) where
  kaplanMeierEstimatorClosed : S.kaplanMeierEstimator
  coxProportionalHazardsClosed : S.coxProportionalHazards
  logRankTestClosed : S.logRankTest

def SurvivalAnalysisModelClosed (S : SurvivalAnalysisModelPackage) : Prop :=
  S.kaplanMeierEstimator ∧ S.coxProportionalHazards ∧ S.logRankTest

theorem survival_analysis_model_closed_from_evidence
    (S : SurvivalAnalysisModelPackage)
    (E : SurvivalAnalysisModelEvidence S) : SurvivalAnalysisModelClosed S := by
  exact And.intro E.kaplanMeierEstimatorClosed
    (And.intro E.coxProportionalHazardsClosed E.logRankTestClosed)

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse