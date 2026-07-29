import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure CoxProportionalHazardsModel where
  baselineHazard : ℝ → ℝ
  covariates : List String
  coefficients : List ℝ
  eventIndicator : Bool
  survivalTime : ℝ
  censored : Bool

def hazardFunction (C : CoxProportionalHazardsModel) (t : ℝ) : ℝ :=
  C.baselineHazard t * Real.exp (List.sum (List.map2 (fun c x => c * x) C.coefficients []))

theorem hazard_nonnegative (C : CoxProportionalHazardsModel) (t : ℝ) :
    hazardFunction C t ≥ 0 := by
  unfold hazardFunction
  apply mul_nonneg (by sorry) (Real.exp_nonneg _)

theorem proportional_hazards_ratio_constant (C1 C2 : CoxProportionalHazardsModel) (t : ℝ) :
    hazardFunction C1 t / hazardFunction C2 t = hazardFunction C1 0 / hazardFunction C2 0 := by
  sorry

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse
