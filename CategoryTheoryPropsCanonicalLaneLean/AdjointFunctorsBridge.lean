import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure AdjointFunctorsPackage where
  categoryC : Type u
  categoryD : Type v
  homC : categoryC → categoryC → Type w
  homD : categoryD → categoryD → Type x
  identityC : ∀ (A : categoryC), homC A A
  identityD : ∀ (A : categoryD), homD A A
  compositionC : ∀ {A B C : categoryC}, homC B C → homC A B → homC A C
  compositionD : ∀ {A B C : categoryD}, homD B C → homD A B → homD A C
  leftAdjoint : categoryC → categoryD
  rightAdjoint : categoryD → categoryC
  unit : ∀ (A : categoryC), homC A (rightAdjoint (leftAdjoint A))
  counit : ∀ (B : categoryD), homD (leftAdjoint (rightAdjoint B)) B
  triangleIdentityLeft : ∀ (A : categoryC),
    compositionD (counit (leftAdjoint A)) (leftAdjoint.map (unit A)) = identityD (leftAdjoint A)
  triangleIdentityRight : ∀ (B : categoryD),
    compositionC (rightAdjoint.map (counit B)) (unit (rightAdjoint B)) = identityC (rightAdjoint B)
  universalPropertyUnit : ∀ (A : categoryC) (B : categoryD) (f : homC A (rightAdjoint B)),
    ∃! g : homD (leftAdjoint A) B, compositionC (rightAdjoint.map g) (unit A) = f
  universalPropertyCounit : ∀ (A : categoryC) (B : categoryD) (g : homD (leftAdjoint A) B),
    ∃! f : homC A (rightAdjoint B), compositionC (rightAdjoint.map g) (unit A) = f

structure AdjointFunctorsEvidence (A : AdjointFunctorsPackage) where
  triangleIdentityLeftClosed : A.triangleIdentityLeft
  triangleIdentityRightClosed : A.triangleIdentityRight
  universalPropertyUnitClosed : A.universalPropertyUnit
  universalPropertyCounitClosed : A.universalPropertyCounit

def AdjointFunctorsBridgeClosed (A : AdjointFunctorsPackage) : Prop :=
  A.triangleIdentityLeft ∧ A.triangleIdentityRight ∧ A.universalPropertyUnit ∧ A.universalPropertyCounit

theorem adjoint_functors_bridge_closed_from_evidence (A : AdjointFunctorsPackage) (E : AdjointFunctorsEvidence A) : AdjointFunctorsBridgeClosed A := by
  exact And.intro E.triangleIdentityLeftClosed
    (And.intro E.triangleIdentityRightClosed
      (And.intro E.universalPropertyUnitClosed E.universalPropertyCounitClosed))

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse
