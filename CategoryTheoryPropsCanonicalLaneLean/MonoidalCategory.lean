import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure MonoidalCategoryData where
  C : Type u
  [Category C]
  tensor : C × C ⥤ C
  unit : C
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop
  associatorClosed : associator
  leftUnitorClosed : leftUnitor
  rightUnitorClosed : rightUnitor
  pentagonIdentityClosed : pentagonIdentity
  triangleIdentityClosed : triangleIdentity

structure MonoidalCategoryEvidence (M : MonoidalCategoryData) where
  associatorClosed : M.associator
  leftUnitorClosed : M.leftUnitor
  rightUnitorClosed : M.rightUnitor
  pentagonIdentityClosed : M.pentagonIdentity
  triangleIdentityClosed : M.triangleIdentity

def MonoidalCategoryClosed (M : MonoidalCategoryData) : Prop :=
  M.associator ∧ M.leftUnitor ∧ M.rightUnitor ∧ M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_category_closed_from_evidence (M : MonoidalCategoryData) (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.associatorClosed (And.intro E.leftUnitorClosed (And.intro E.rightUnitorClosed (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed)))

end HautevilleHouse
end CategoryTheoryPropsCanonicalLaneLean