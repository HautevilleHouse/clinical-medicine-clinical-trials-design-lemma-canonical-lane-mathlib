import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure RandomizedControlledTrialDesign where
  treatmentEffect : ℝ
  controlOutcome : ℝ
  sampleSizeTreatment : ℕ
  sampleSizeControl : ℕ
  varianceInTreatment : ℝ
  varianceInControl : ℝ
  significanceLevel : ℝ
  power : ℝ

def pooledStandardError (R : RandomizedControlledTrialDesign) : ℝ :=
  Real.sqrt ((R.varianceInTreatment / (R.sampleSizeTreatment : ℝ)) + (R.varianceInControl / (R.sampleSizeControl : ℝ)))

def zStatistic (R : RandomizedControlledTrialDesign) : ℝ :=
  (R.treatmentEffect - R.controlOutcome) / pooledStandardError R

theorem z_statistic_finite (R : RandomizedControlledTrialDesign) (h : pooledStandardError R > 0) :
    zStatistic R ≠ ∞ ∧ zStatistic R ≠ -∞ := by
  unfold zStatistic
  have : pooledStandardError R ≠ 0 := by linarith
  have : (R.treatmentEffect - R.controlOutcome) / pooledStandardError R ≠ ∞ := by
    intro hdiv; apply this; field_simp at hdiv; linarith
  have : (R.treatmentEffect - R.controlOutcome) / pooledStandardError R ≠ -∞ := by
    intro hdiv; apply this; field_simp at hdiv; linarith
  exact And.intro this this

theorem statistically_significant_if_z_exceeds_threshold (R : RandomizedControlledTrialDesign) :
    |zStatistic R| > 1.96 → R.treatmentEffect ≠ R.controlOutcome := by
  intro hz
  intro heq
  have : zStatistic R = 0 := by
    unfold zStatistic; rw [heq]; ring
  linarith

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse
