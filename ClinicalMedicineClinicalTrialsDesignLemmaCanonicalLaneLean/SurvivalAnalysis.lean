import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure SurvivalModel where
  timePoints : List ℝ
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  censoringIndicator : ℝ → Bool

structure SurvivalModelEvidence (S : SurvivalModel) where
  hazardNonnegative : ∀ t, S.hazardFunction t ≥ 0
  survivalFromHazard : ∀ t, S.survivalFunction t = Real.exp (-∫ s in (0 : ℝ)..t, S.hazardFunction s)
  censoringWellDefined : ∀ t, S.censoringIndicator t ∈ {true, false}

def SurvivalModelClosed (S : SurvivalModel) : Prop :=
  (∀ t, S.hazardFunction t ≥ 0) ∧
  (∀ t, S.survivalFunction t = Real.exp (-∫ s in (0 : ℝ)..t, S.hazardFunction s))

theorem survival_model_closed_from_evidence (S : SurvivalModel) (E : SurvivalModelEvidence S) :
    SurvivalModelClosed S := by
  exact And.intro E.hazardNonnegative E.survivalFromHazard

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse