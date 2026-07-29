import HautevilleHouse.CategoryTheoryPropsCanonicalLaneLean.CategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryPropsCanonicalLaneLean

structure KanExtensionPackage where
  categoryA : CategoryPackage
  categoryB : CategoryPackage
  categoryC : CategoryPackage
  functorK : FunctorPackage categoryA categoryB
  functorF : FunctorPackage categoryA categoryC
  leftKan : FunctorPackage categoryB categoryC
  rightKan : FunctorPackage categoryB categoryC
  universalPropertyLeft : Prop
  universalPropertyRight : Prop
  existenceLeft : Prop
  existenceRight : Prop

structure KanExtensionEvidence where
  universalPropertyLeftClosed : Prop
  universalPropertyRightClosed : Prop
  existenceLeftClosed : Prop
  existenceRightClosed : Prop

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.universalPropertyLeft ∧ K.universalPropertyRight ∧ K.existenceLeft ∧ K.existenceRight

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage) (E : KanExtensionEvidence) : KanExtensionClosed K :=
  And.intro E.universalPropertyLeftClosed
    (And.intro E.universalPropertyRightClosed (And.intro E.existenceLeftClosed E.existenceRightClosed))

end CategoryTheoryPropsCanonicalLaneLean
end HautevilleHouse