import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure DoseResponseModel where
  doses : List ℝ
  responses : List ℝ
  eMax : ℝ
  eC50 : ℝ
  hillCoefficient : ℝ
  baselineEffect : ℝ

def sigmoidResponse (D : DoseResponseModel) (dose : ℝ) : ℝ :=
  D.baselineEffect + D.eMax * dose ^ D.hillCoefficient / (D.eC50 ^ D.hillCoefficient + dose ^ D.hillCoefficient)

theorem response_increases_with_dose (D : DoseResponseModel) (d1 d2 : ℝ) (h : d1 < d2) (hpos : d1 ≥ 0) :
    sigmoidResponse D d1 ≤ sigmoidResponse D d2 := by
  unfold sigmoidResponse
  have hpos' : d2 ≥ 0 := by linarith
  have hnum : d1 ^ D.hillCoefficient ≤ d2 ^ D.hillCoefficient := by
    refine Real.rpow_le_rpow_of_exponent_le ?_ (by
      have : d1 ≤ d2 := by linarith
      exact this)
    exact hpos
    exact hpos'
  have hdenom : D.eC50 ^ D.hillCoefficient + d1 ^ D.hillCoefficient ≤ D.eC50 ^ D.hillCoefficient + d2 ^ D.hillCoefficient := by
    nlinarith
  have hfrac : D.eMax * d1 ^ D.hillCoefficient / (D.eC50 ^ D.hillCoefficient + d1 ^ D.hillCoefficient) ≤
             D.eMax * d2 ^ D.hillCoefficient / (D.eC50 ^ D.hillCoefficient + d2 ^ D.hillCoefficient) := by
    refine (div_le_div_right (by positivity)).mpr ?_
    · refine mul_le_mul_of_nonneg_left hnum (by positivity)
    · positivity
  nlinarith

theorem response_bounded (D : DoseResponseModel) (dose : ℝ) :
    sigmoidResponse D dose ≤ D.baselineEffect + D.eMax := by
  unfold sigmoidResponse
  have : D.eMax * dose ^ D.hillCoefficient / (D.eC50 ^ D.hillCoefficient + dose ^ D.hillCoefficient) ≤ D.eMax := by
    refine (div_le_one ?_).mpr ?_
    · positivity
    · have : dose ^ D.hillCoefficient ≤ D.eC50 ^ D.hillCoefficient + dose ^ D.hillCoefficient := by nlinarith
      nlinarith
  nlinarith

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse