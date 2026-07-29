import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure AdjointFunctorPackage (A : AdmissibleClass) where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  adjunctionIso : Prop
  uniqueUpToIso : Prop

structure AdjointEvidence (A : AdmissibleClass) (AD : AdjointFunctorPackage A) where
  leftAdjointExistsClosed : AD.leftAdjointExists
  rightAdjointExistsClosed : AD.rightAdjointExists
  adjunctionIsoClosed : AD.adjunctionIso
  uniqueUpToIsoClosed : AD.uniqueUpToIso

def AdjointClosed (A : AdmissibleClass) (AD : AdjointFunctorPackage A) : Prop :=
  AD.leftAdjointExists ∧ AD.rightAdjointExists ∧ AD.adjunctionIso ∧ AD.uniqueUpToIso

theorem adjoint_closed_from_evidence (A : AdmissibleClass) (AD : AdjointFunctorPackage A) (E : AdjointEvidence A AD) :
    AdjointClosed A AD := by
  exact And.intro E.leftAdjointExistsClosed (And.intro E.rightAdjointExistsClosed (And.intro E.adjunctionIsoClosed E.uniqueUpToIsoClosed))

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse