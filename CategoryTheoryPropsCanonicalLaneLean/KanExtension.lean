import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure KanExtensionPackage where
  sourceFunctor : Type u → Type u
  targetFunctor : Type u → Type u
  leftKanExtension : Type u → Type u
  rightKanExtension : Type u → Type u
  universalPropertyLeft : Prop
  universalPropertyRight : Prop

structure KanExtensionEvidence (K : KanExtensionPackage) where
  universalPropertyLeftClosed : K.universalPropertyLeft
  universalPropertyRightClosed : K.universalPropertyRight

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.universalPropertyLeft ∧ K.universalPropertyRight

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage)
    (E : KanExtensionEvidence K) : KanExtensionClosed K := by
  exact And.intro E.universalPropertyLeftClosed E.universalPropertyRightClosed

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse