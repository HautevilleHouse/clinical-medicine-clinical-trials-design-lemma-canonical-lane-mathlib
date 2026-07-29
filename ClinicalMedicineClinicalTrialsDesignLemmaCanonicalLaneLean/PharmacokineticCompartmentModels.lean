import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  rateConstants : List (ℝ × ℝ)
  initialConcentration : ℝ
  dosingRegimen : ℝ → ℝ
  solution : ℝ → ℝ

structure CompartmentModelEvidence (C : CompartmentModel) where
  positiveCompartments : C.compartments > 0
  rateConstantsPositive : List.All (λ (k : ℝ × ℝ) => k.1 > 0 ∧ k.2 > 0) C.rateConstants
  initialConcentrationNonnegative : C.initialConcentration ≥ 0
  dosingWellDefined : ∀ t, C.dosingRegimen t ≥ 0
  solutionSatisfiesODE : Prop  -- placeholder for ODE satisfaction

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.compartments > 0 ∧
  (∀ k ∈ C.rateConstants, k.1 > 0 ∧ k.2 > 0) ∧
  C.initialConcentration ≥ 0 ∧
  (∀ t, C.dosingRegimen t ≥ 0)

theorem compartment_model_closed_from_evidence (C : CompartmentModel) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  refine And.intro E.positiveCompartments
    (And.intro (fun k hk => ?_) (And.intro E.initialConcentrationNonnegative E.dosingWellDefined))
  -- requires List.All lemma; for now assume rateConstantsPositive implies forall
  have hAll : List.All (λ (k : ℝ × ℝ) => k.1 > 0 ∧ k.2 > 0) C.rateConstants := E.rateConstantsPositive
  -- Using List.All.mem hypothesis
  have hmem : ∀ {x : ℝ × ℝ}, x ∈ C.rateConstants → (λ (k : ℝ × ℝ) => k.1 > 0 ∧ k.2 > 0) x := by
    intro x hx
    exact hAll.get hx
  exact hmem hk

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse