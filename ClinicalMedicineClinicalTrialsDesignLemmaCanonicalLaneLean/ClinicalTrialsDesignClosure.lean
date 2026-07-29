import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean

structure ClinicalTrialsDesignClosurePackage where
  hypothesisTest : Prop
  sampleSizeCalculation : Prop
  randomizationProcedure : Prop
  blindingMethod : Prop
  statisticalAnalysisPlan : Prop

structure ClinicalTrialsDesignClosureEvidence (C : ClinicalTrialsDesignClosurePackage) where
  hypothesisTestClosed : C.hypothesisTest
  sampleSizeCalculationClosed : C.sampleSizeCalculation
  randomizationProcedureClosed : C.randomizationProcedure
  blindingMethodClosed : C.blindingMethod
  statisticalAnalysisPlanClosed : C.statisticalAnalysisPlan

def ClinicalTrialsDesignClosureClosed (C : ClinicalTrialsDesignClosurePackage) : Prop :=
  C.hypothesisTest ∧ C.sampleSizeCalculation ∧ C.randomizationProcedure ∧ C.blindingMethod ∧ C.statisticalAnalysisPlan

theorem clinical_trials_design_closure_closed_from_evidence
    (C : ClinicalTrialsDesignClosurePackage)
    (E : ClinicalTrialsDesignClosureEvidence C) : ClinicalTrialsDesignClosureClosed C := by
  exact And.intro E.hypothesisTestClosed
    (And.intro E.sampleSizeCalculationClosed
      (And.intro E.randomizationProcedureClosed
        (And.intro E.blindingMethodClosed E.statisticalAnalysisPlanClosed)))

end ClinicalMedicineClinicalTrialsDesignLemmaCanonicalLaneLean
end HautevilleHouse